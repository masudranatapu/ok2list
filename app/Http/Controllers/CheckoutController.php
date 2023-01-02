<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class CheckoutController extends Controller
{
    public function checkoutShipping()
    {
         return view('checkout.shipping_address');
    }
    public function storeShipping(Request $request)
    {
        $data = $request->all();
        dd($data);
        //  return view('checkout.shipping_address');
    }

    public function checkoutBilling()
    {
         return view('checkout.billing_address');
    }

    public function checkoutPayment()
    {
        return view('checkout.payment');
    }
}
