<?php

namespace App\Http\Controllers;

use App\SiteSetting;
use App\Models\Order;
use App\Models\Country;
use App\Models\Product;
use App\Payments;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;

class CheckoutController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth');
    }

    public function addToCart(Request $request)
    {
        $id = $request->id ;
        $product = Product::find($id);
        Session::put('cart', $product);
        // $html = view('checkout.sidebar', compact($product))->render();
        return response()->json(['status' => 'success']);
    }
    public function checkoutShipping()
    {
        // dd(Session::get('cart'));
        $countries = Country::where('is_active', 1)->get();
         return view('checkout.shipping_address', compact('countries'));
    }
    public function storeShipping(Request $request)
    {
        $shipping =  $request->validate([
            'firstname' => 'required',
            'lastname' => 'required',
            'email' => 'required',
            'phone_number' => 'required',
            'address' => 'required',
            'apartment' => 'nullable',
            'city' => 'required',
            'state' => 'required',
            'zip_code' => 'required',
            'country' => 'required',
            'trams_condition' => 'required',
            'order_note' => 'nullable',
        ]);
        Session::put('shipping_address', $shipping);

        if ($request->same_bill_address) {
            $billing = [
                "bill_first_name" => $request->firstname,
                "bill_last_name" => $request->lastname,
                "bill_email" => $request->email,
                "bill_phone_number" => $request->phone_number,
                "bill_address" => $request->address,
                "bill_apartment" => $request->apartment,
                "bill_city" => $request->city,
                "bill_state" => $request->state,
                "bill_zip_code" => $request->zip_code,
                "bill_country" => $request->country,
            ];
            Session::put('billing_address', $billing);
        }
        if (Session::has('billing_address')) {
            return redirect()->route('checkout.payment');
        } else {
            return redirect()->route('checkout.billing');
        }
    }

    public function checkoutBilling()
    {
        if (!Session::has('shipping_address')) {
            return redirect()->route('checkout.shipping');
        }
        $countries = Country::where('is_active', 1)->get();
         return view('checkout.billing_address', compact('countries'));
    }
    public function storeBilling(Request $request)
    {
        $billing = $request->validate([
            "bill_first_name" => 'required',
            "bill_last_name" => 'required',
            "bill_email" => 'required',
            "bill_phone_number" => 'required',
            "bill_address" => 'required',
            "bill_apartment" => 'nullable',
            "bill_city" => 'required',
            "bill_state" => 'required',
            "bill_zip_code" => 'required',
            "bill_country" => 'required',
        ]);
        Session::put('billing_address', $billing);

        return redirect()->route('checkout.payment');


    }

    public function checkoutPayment()
    {
        if (!Session::has('shipping_address')) {
            return redirect()->route('checkout.shipping');
        }
        if (!Session::has('billing_address')) {
            return redirect()->route('checkout.billing');
        }
        $setting = SiteSetting::first();
        return view('checkout.payment', compact('setting'));
    }

    public function paystackPayment(Request $request)
    {
        try {
        $payment = $request->message;
        $product = Session::get('cart');
        $shipping = Session::get('shipping_address');
        $billing = Session::get('billing_address');
        $user = Auth::user();
        $order = new Order();
        $order->user_id = $user->id;
        $order->cart = json_encode($product);
        $order->product_id = $product->pk_no;
        $order->seller_id = $product->customer_pk_no;
        $order->amount = $request->amount;
        $order->currency = $request->currency;
        $order->referance = $payment['reference'];
        $order->transaction_number = $payment['transaction'];
        $order->txnid = $payment['trxref'];
        $order->order_status = 'pending';
        $order->payment_method = 'paystack';
        if ($payment['status'] == 'success') {
            $order->payment_status = 'paid';
        }else {
            $order->payment_status = 'unpaid';
        }
        $order->shipping_info = json_encode($shipping);
        $order->billing_info =json_encode($billing);
        $order->tax = $request->tax;
        $order->save();
        // if ($order) {
        //     $payment = new Payments();

        // }


        Session::forget('cart');
        Session::forget('shipping_address');
        Session::forget('billing_address');
        return response()->json(['status' => 'success', 'data' => $payment]);
    } catch (\Throwable $th) {
        return response()->json(['status' => 'failed', 'message' => 'Something went wrong! please try again.', 'error' => $th]);
    }
    }
}
