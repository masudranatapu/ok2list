<?php
   
namespace App\Http\Controllers;

use App\Models\Auth as ModelsAuth;
use App\Models\Product;
use App\Models\PromotionDetails;
use App\Models\User;
use Illuminate\Http\Request;
use Session;
use Stripe;
use Toastr;
use Auth;
use App\Payments;
use DB;
use Carbon\Carbon;
use App\Package;
use App\Models\Customer;
use Illuminate\Support\Str;
   
class StripePaymentController extends Controller
{
    /**
     * success response method.
     *
     * @return \Illuminate\Http\Response
     */
    public function stripe()
    {
        return view('package.payment.stripe');
    }
  
    /**
     * success response method.
     *
     * @return \Illuminate\Http\Response
     */
    public function stripePost(Request $request)
    {
        Stripe\Stripe::setApiKey(env('STRIPE_SECRET'));
        Stripe\Charge::create ([
                "amount" => Session::get('price'),
                "currency" => "usd",
                "source" => $request->stripeToken,
                "description" => "Payment." 
        ]);

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
                $payment->transaction_id    = Str::random(15);
                $payment->status            = 'VALID' ;
                $payment->tran_date         = date('Y-m-d H:i:s');
                $payment->amount            = Session::get('price') ?? null ;
                $payment->card_type         = "stripe" ?? null ;
                $payment->payment_at        = date('Y-m-d H:i:s') ?? null ;
                $payment->validated_on      = date('Y-m-d H:i:s') ?? null ;
                $payment->expired_on        = $packageExpired ?? null ;
                if(Session::get('promid')){
                    $payment->payment_type  = 'promotion';
                    $payment->f_prod_pk_no    = Session::get('adid') ?? null;
                    $payment->f_promotion_details_no    = Session::get('promid') ?? null;
                    $promotion_to =  date('Y-m-d',strtotime('+'.$promotionInfo->day_limit.' day'));

                    Product::where('pk_no', Session::get('adid'))->update(['promotion' => $promotionInfo->promotion->title, 'promotion_to' => $promotion_to ]);

                }

                if( !empty($package)){
                    $payment->add_limit        = $package->ad_limit_in_montrh ?? 'null' ;
                    $payment->payment_type  = 'package';
                    $payment->f_package_pk_no = Session::get('pakid');
                }
                $payment->save();
                if(Session::get('adid')){
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
  
        Toastr::success('Payment successfull with Stripe.', 'Success', ["positionClass" => "toast-top-right"]);
        return redirect('/my-dashboard');
    }
}