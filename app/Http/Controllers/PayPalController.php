<?php
  
namespace App\Http\Controllers;

use App\Models\Auth as ModelsAuth;
use App\Models\Customer;
use App\Models\Product;
use App\Models\Promotion;
use App\Models\PromotionDetails;
use App\Models\User;
use Illuminate\Http\Request;
use Srmklive\PayPal\Services\ExpressCheckout;
use Toastr;
use Auth;
use Session;
use App\Payments;
use DB;
use Carbon\Carbon;
use App\Package;
use Illuminate\Support\Str;
   
class PayPalController extends Controller
{
    /**
     * Responds with a welcome message with instructions
     *
     * @return \Illuminate\Http\Response
     */
    public function paypal_view(){
        return view('products.welcome');
    }
   
    /**
     * Responds with a welcome message with instructions
     *
     * @return \Illuminate\Http\Response
     */
    public function cancel()
    {
        dd('Your payment is canceled. You can create cancel page here.');
    }
  
    /**
     * Responds with a welcome message with instructions
     *
     * @return \Illuminate\Http\Response
     */
    public function success(Request $request)
    {
        $provider = new ExpressCheckout; 
        $response = $provider->getExpressCheckoutDetails($request->token);
        if(Session::get('pakid')){
            $user = Customer::where('id',Auth::user()->id)->first();
            $user->package_id = Session::get('pakid');
            $user->update();
        }
        
        $package = Package::where('pk_no',Session::get('pakid'))->first();
        if(!empty($package)){
            $packageExpired = Carbon::now()->addMonths($package->package_duration);
        }
        if(Session::get('promid')){
            $promotionInfo = PromotionDetails::where('pk_no',Session::get('promid'))->first();
            $packageExpired = Carbon::now()->addDays($promotionInfo->day_limit);
        }
        DB::beginTransaction();
            try {
                /*Insert payment data to my database table*/
                $payment                = new Payments(); 
                $payment->f_customer_pk_no    = Auth::user()->id ;
                $payment->status            = 'VALID' ;
                $payment->tran_id           = $request->PayerID ?? null;
                $payment->transaction_id    = Str::random(15);
                $payment->val_id            = $request->token ?? null ;
                $payment->tran_date         = date('Y-m-d H:i:s');
                $payment->amount            = Session::get('price') ?? null ;
                $payment->card_type         = "PayPal" ?? null ;
                $payment->payment_at        = date('Y-m-d H:i:s') ?? null ;
                $payment->validated_on      = date('Y-m-d H:i:s') ?? null ;
                $payment->expired_on        = $packageExpired ?? null ;
                
                if(Session::get('promid')){
                    $payment->payment_type  = 'promotion';
                    $payment->f_prod_pk_no    = Session::get('adid') ?? null;
                    $payment->f_promotion_details_no    = Session::get('promid') ?? null;
                    

                    // Product::where('pk_no', Session::get('adid'))->update(['promotion' => $promotionInfo->promotion->title, 'promotion_to' => $promotion_to ]);
                   
                    // $product->promotion = $promotionInfo->promotion->title;
                    // $product->promotion_to = $promotion_to;
                    // $product->update();
                    // dd($product);
                }

                if( !empty($package)){
                    $payment->add_limit        = $package->ad_limit_in_montrh ?? 'null' ;
                    $payment->payment_type  = 'package';
                    $payment->f_package_pk_no = Session::get('pakid');
                }
                $payment->save();
                if(!empty(Session::get('adid'))){
                    $promotion_to =  date('Y-m-d',strtotime('+'.$promotionInfo->day_limit.' day'));
                    $product = DB::table('prd_master')->where('pk_no', Session::get('adid'))
                    ->update(['promotion' => $promotionInfo->promotion->title, 'promotion_to' => $promotion_to ]);
                }
            
            } catch (\Exception $e) {
                DB::rollback();
                Toastr::error('Failed to payment with Paypal', 'Error', ["positionClass" => "toast-top-right"]);
                return redirect()->route('my-dashboard');
            
            }

            DB::commit();

        if (in_array(strtoupper($response['ACK']), ['SUCCESS', 'SUCCESSWITHWARNING'])) {
            // return redirect('')
            // dd('Your payment was successfully. You can create success page here.');
            Toastr::success('Payment successfull with Paypal.', 'Success', ["positionClass" => "toast-top-right"]);
            return redirect('/my-dashboard');
        }
  
        
    }
}