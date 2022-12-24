<?php

namespace App\Http\Controllers;

use App\Models\Customer;
use App\Models\Package as ModelsPackage;
use App\Models\Promotion;
use Illuminate\Http\Request;
use App\Traits\RepoResponse;
use DB;
use Auth;
use Toastr;
use Session;
use App\User;
use App\Payments;
use App\Package;
use App\PromotionDetails;
use App\Product;
use Srmklive\PayPal\Services\ExpressCheckout;
use Carbon\Carbon;
use Illuminate\Support\Str;

class PaymentController extends Controller
{
    use RepoResponse;

    public function __construct()
    {
       $this->middleware('auth');
    }


   public function getCreate(Request $request){
        try {
            $payment =new Payments();
            $payment->name = $request->name;
            $payment->email = $request->email;
            $payment->phone = $request->phone;
            $payment->billing_city = $request->billing_city;
            $payment->billing_state = $request->billing_state;
            $payment->zip_code = $request->zip_code;
            $payment->address = $request->address;
            $payment->save();
            $gateway = $request->payment_type;
            if($gateway=='offline_payment'){
                return $this->offline_payment($payment->pk_no);
            }elseif($gateway=='stripe'){
                return view('package.payment.stripe');
            }elseif($gateway=='paypal'){
                return $this->payment();
            }
        } catch (\Exception $e) {
            DB::rollback();
            Toastr::error('Failed to Payment', 'Error', ["positionClass" => "toast-top-right"]);
            return redirect()->route('my-dashboard');
        
        }
   }

   public function offline_payment($payment_id){
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
            $payment                = Payments::where('pk_no',$payment_id)->first(); 
            $payment->f_customer_pk_no    = Auth::user()->id ;
            $payment->transaction_id    = Str::random(15);
            $payment->status            = 'Due' ;
            $payment->tran_date         = date('Y-m-d H:i:s');
            $payment->amount            = Session::get('price') ?? null ;
            $payment->card_type         = "offline_payment" ?? null ;
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
                ->update(['promotion' => $promotionInfo->promotion->title, 'promotion_to' => $promotion_to,'is_active' => 0 ]);
            }
        
        } catch (\Exception $e) {
            DB::rollback();
            Toastr::error('Failed to Order', 'Error', ["positionClass" => "toast-top-right"]);
            return redirect()->route('my-dashboard');
        
        }

        DB::commit();

    Toastr::success('Order successfully.Please pay offline for confirm your Order.', 'Success', ["positionClass" => "toast-top-right"]);
    return redirect('/my-dashboard');

   }

    public function sslcommerze()
    {
        // dd($request);
               /* PHP */
        // if($request->get('adid')){
        //     $pay_for_ad = 'pay_for_ad'.Auth::user()->id;
        //     Session::put($pay_for_ad, $request->get('adid') );
        // }

        // dd();
        $post_data = array();
        $post_data['store_id'] = "dalal5fde587136c0e";
        $post_data['store_passwd'] = "dalal5fde587136c0e@ssl";
        $post_data['total_amount'] = Session::get('price');
        $post_data['currency'] = "$";
        $post_data['tran_id'] = "SSLCZ_TEST_".uniqid();
        $post_data['success_url'] = route('payment.success');
        $post_data['fail_url'] = route('payment.failed');
        $post_data['cancel_url'] = "https://www.ok2list.com/new_sslcz_gw/cancel.php";
        # $post_data['multi_card_name'] = "mastercard,visacard,amexcard";  # DISABLE TO DISPLAY ALL AVAILABLE

        # EMI INFO
        $post_data['emi_option'] = "1";
        $post_data['emi_max_inst_option'] = "9";
        $post_data['emi_selected_inst'] = "9";

        # CUSTOMER INFORMATION
        $post_data['cus_name'] = Auth::user()->name;
        $post_data['cus_email'] = Auth::user()->email;
        $post_data['cus_add1'] = Auth::user()->address;
        $post_data['cus_add2'] = Auth::user()->address;
        $post_data['cus_city'] = Auth::user()->city;
        $post_data['cus_state'] = Auth::user()->city;
        $post_data['cus_postcode'] = "";
        $post_data['cus_country'] = "Srilanka";
        $post_data['cus_phone'] = Auth::user()->mobile1;;
        $post_data['cus_fax'] = Auth::user()->mobile2;;

        # SHIPMENT INFORMATION
        $post_data['ship_name'] = "testtravewnkt";
        $post_data['ship_add1 '] = "Dhaka";
        $post_data['ship_add2'] = "Dhaka";
        $post_data['ship_city'] = "Dhaka";
        $post_data['ship_state'] = "Dhaka";
        $post_data['ship_postcode'] = "1000";
        $post_data['ship_country'] = "Srilanka";

        # OPTIONAL PARAMETERS
        $post_data['value_a'] = Session::get('adid') ?? null;
        $post_data['value_b'] = Session::get('pakid') ?? null;
        $post_data['value_c'] = Session::get('promid') ?? null;
        $post_data['value_d'] = "ref004";

        # CART PARAMETERS
        $post_data['cart'] = json_encode(array(
            array("product"=>"DHK TO BRS AC A1","amount"=>"200.00"),
            array("product"=>"DHK TO BRS AC A2","amount"=>"200.00"),
            array("product"=>"DHK TO BRS AC A3","amount"=>"200.00"),
            array("product"=>"DHK TO BRS AC A4","amount"=>"200.00")
        ));
        $post_data['product_amount'] = "100";
        $post_data['vat'] = "5";
        $post_data['discount_amount'] = "5";
        $post_data['convenience_fee'] = "3";

        //second option

        # REQUEST SEND TO SSLCOMMERZ
        $direct_api_url = "https://sandbox.sslcommerz.com/gwprocess/v3/api.php";

        $handle = curl_init();
        curl_setopt($handle, CURLOPT_URL, $direct_api_url );
        curl_setopt($handle, CURLOPT_TIMEOUT, 30);
        curl_setopt($handle, CURLOPT_CONNECTTIMEOUT, 30);
        curl_setopt($handle, CURLOPT_POST, 1 );
        curl_setopt($handle, CURLOPT_POSTFIELDS, $post_data);
        curl_setopt($handle, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($handle, CURLOPT_SSL_VERIFYPEER, FALSE); # KEEP IT FALSE IF YOU RUN FROM LOCAL PC


        $content = curl_exec($handle );

        $code = curl_getinfo($handle, CURLINFO_HTTP_CODE);

        if($code == 200 && !( curl_errno($handle))) {
            curl_close( $handle);
            $sslcommerzResponse = $content;
        } else {
            curl_close( $handle);
            echo "FAILED TO CONNECT WITH SSLCOMMERZ API";
            exit;
        }

        # PARSE THE JSON RESPONSE
        $sslcz = json_decode($sslcommerzResponse, true );

        if(isset($sslcz['GatewayPageURL']) && $sslcz['GatewayPageURL']!="" ) {
                # THERE ARE MANY WAYS TO REDIRECT - Javascript, Meta Tag or Php Header Redirect or Other
                # echo "<script>window.location.href = '". $sslcz['GatewayPageURL'] ."';</script>";
            echo "<meta http-equiv='refresh' content='0;url=".$sslcz['GatewayPageURL']."'>";
            # header("Location: ". $sslcz['GatewayPageURL']);
            exit;
        } else {
            echo "JSON Data parsing error!";
        }





    }


    public function paymentSuccess(Request $request)
    {

        $val_id=urlencode($_POST['val_id']);
        $store_id=urlencode("dalal5fde587136c0e");
        $store_passwd=urlencode("dalal5fde587136c0e@ssl");
        $requested_url = ("https://sandbox.sslcommerz.com/validator/api/validationserverAPI.php?val_id=".$val_id."&store_id=".$store_id."&store_passwd=".$store_passwd."&v=1&format=json");

        $handle = curl_init();
        curl_setopt($handle, CURLOPT_URL, $requested_url);
        curl_setopt($handle, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($handle, CURLOPT_SSL_VERIFYHOST, false); # IF YOU RUN FROM LOCAL PC
        curl_setopt($handle, CURLOPT_SSL_VERIFYPEER, false); # IF YOU RUN FROM LOCAL PC

        $result = curl_exec($handle);

        $code = curl_getinfo($handle, CURLINFO_HTTP_CODE);

        if($code == 200 && !( curl_errno($handle)))
        {

            # TO CONVERT AS ARRAY
            # $result = json_decode($result, true);
            # $status = $result['status'];

            # TO CONVERT AS OBJECT
            $result = json_decode($result);

            # TRANSACTION INFO
            $status = $result->status;
            $tran_date = $result->tran_date;
            $tran_id = $result->tran_id;
            $val_id = $result->val_id;
            $amount = $result->amount;
            $store_amount = $result->store_amount;
            $bank_tran_id = $result->bank_tran_id;
            $card_type = $result->card_type;

            # EMI INFO
            $emi_instalment = $result->emi_instalment;
            $emi_amount = $result->emi_amount;
            $emi_description = $result->emi_description;
            $emi_issuer = $result->emi_issuer;

            # ISSUER INFO
            $card_no = $result->card_no;
            $card_issuer = $result->card_issuer;
            $card_brand = $result->card_brand;
            $card_issuer_country = $result->card_issuer_country;
            $card_issuer_country_code = $result->card_issuer_country_code;

            # API AUTHENTICATION
            $APIConnect = $result->APIConnect;
            $validated_on = $result->validated_on;
            $gw_version = $result->gw_version;
            $package = Package::where('pk_no',$result->value_b)->first();
            $packageExpired = Carbon::now()->addMonths($package->package_duration);

            DB::beginTransaction();
            try {
                /*Insert payment data to my database table*/
                $payment                = new Payments();
                $payment->f_customer_pk_no    = Auth::user()->id ;
                $payment->status            = $result->status ?? null ;
                $payment->tran_date         = $result->tran_date ?? null;
                $payment->tran_id           = $result->tran_id ?? null;
                $payment->transaction_id    = Str::random(15);
                $payment->val_id            = $result->val_id ?? null ;
                $payment->amount            = $result->amount ?? null ;
                $payment->store_amount      = $result->store_amount ?? null ;
                $payment->bank_tran_id      = $result->bank_tran_id ?? null ;
                $payment->card_type         = $result->card_type ?? null ;
                $payment->emi_instalment    = $result->emi_instalment ?? null ;
                $payment->emi_amount        = $result->emi_amount ?? null ;
                $payment->emi_description   = $result->emi_description ?? null ;
                $payment->emi_issuer        = $result->emi_issuer ?? null ;
                $payment->card_no           = $result->card_no ?? null ;
                $payment->card_issuer       = $result->card_issuer ?? null ;
                $payment->card_brand        = $result->card_brand ?? null ;
                $payment->card_issuer_country  = $result->card_issuer_country ?? null ;
                $payment->card_issuer_country_code  = $result->card_issuer_country_code ?? null ;
                $payment->APIConnect        = $result->APIConnect ?? null ;
                $payment->validated_on      = $result->validated_on ?? null ;
                $payment->gw_version        = $result->gw_version ?? null ;
                $payment->payment_at        = date('Y-m-d H:i:s') ?? null ;
                $payment->expired_on        = $packageExpired ?? null ;
                $payment->add_limit        = $package->ad_limit_in_montrh ?? null ;

                if( $result->value_a){
                    $payment->payment_type  = 'promotion';
                    $payment->f_prod_pk_no    = $result->value_a;
                    $payment->f_promotion_details_no    = $result->value_c ?? null;
                }

                if( $result->value_b){
                    $payment->payment_type  = 'package';
                    $payment->f_package_pk_no = $result->value_b;
                }

                $payment->save();
                Toastr::success('Payment successfull with SSLCOMMERZ', 'Success', ["positionClass" => "toast-top-right"]);

            } catch (\Exception $e) {
                DB::rollback();
                Toastr::error('Failed to payment with SSLCOMMERZ', 'Error', ["positionClass" => "toast-top-right"]);
                return redirect()->route('my-dashboard');

            }

            DB::commit();

        } else {

            Toastr::error('Failed to connect with SSLCOMMERZ', 'Error', ["positionClass" => "toast-top-right"]);
        }

        return redirect()->route('my-dashboard');
    }


    public function freePayment(Request $request)
    {
       DB::beginTransaction();
       try {
        $promotion = PromotionDetails::find($request->get('promid'));
        $promotion = $promotion->title;
        $promotion_to = date('Y-m-d',strtotime(Auth::user()->created_at));

        $date1 = date('Y-m-d',strtotime(Auth::user()->created_at));
        $date2 = date('Y-m-d');
        $day_diff_with_regi = (int) $this->dateDiffInDays($date1,$date2);
        $dat_rem = 60 - $day_diff_with_regi;


        if($dat_rem < 1){
            Toastr::error('You are not allow to free promotion !', 'Error', ["positionClass" => "toast-top-right"]);
            return redirect()->route('my-dashboard');
        }

        $promotion_to =  date('Y-m-d',strtotime('+'.$dat_rem.' day'));

        Product::where('pk_no', $request->get('adid'))->update(['promotion' => $promotion, 'promotion_to' => $promotion_to ]);

        } catch (\Exception $e) {
            // dd($e);
            DB::rollback();
            Toastr::error('Failed to promoted the post', 'Error', ["positionClass" => "toast-top-right"]);
            return redirect()->route('my-dashboard');

        }
        DB::commit();
        Toastr::success('Post promotion successfull !', 'Success', ["positionClass" => "toast-top-right"]);

        return redirect()->route('my-dashboard');


    }

    public function payment()
    {
        $package = ModelsPackage::where('pk_no',Session::get('pakid'))->first();
        if(Session::get('promid')){
            $promotionInfo = PromotionDetails::where('pk_no',Session::get('promid'))->first();
            $promotion = Promotion::where('pk_no',$promotionInfo->f_promotion_pk_no)->first();
        }
        
        if(!empty($promotionInfo)){
            $data = [];
            $data['items'] = [
                [
                    'name' => $promotion->title,
                    'price' => Session::get('price'),
                    'desc'  => $promotion->description,
                    'qty' => 1
                ]
            ];
        }else{
            $data = [];
            $data['items'] = [
                [
                    'name' => $package->title,
                    'price' => Session::get('price'),
                    'desc'  => $package->title,
                    'qty' => 1
                ]
            ];
        }
        

        $data['invoice_id'] = 1;
        $data['invoice_description'] = "Order #{$data['invoice_id']} Invoice";
        $data['return_url'] = route('payment.success');
        $data['cancel_url'] = route('payment.cancel');
        $data['total'] = Session::get('price');

        $provider = new ExpressCheckout;

        $response = $provider->setExpressCheckout($data);

        $response = $provider->setExpressCheckout($data, true);

        return redirect($response['paypal_link']);
    }





}











