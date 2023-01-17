<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Payment;
use Brian2694\Toastr\Facades\Toastr;

class PaymentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $payments = Payment::latest()->paginate(10);
        return view('admin.payment.index', compact('payments'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        return view('admin.payment.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
        $this->validate($request, [
            'name' => 'required',
            'public_key' => 'required',
            'secret_key' => 'required',
        ]);
        
        $payment_image = $request->file('image');
        $slug = "payment";

        if(isset($payment_image)){
            $payment_image_name = $slug.'-'.uniqid().'.'.$payment_image->getClientOriginalExtension();
            $upload_path = 'media/payment/';
            $payment_image->move($upload_path, $payment_image_name);
    
            $image_url = $upload_path.$payment_image_name;

        }else {
            $image_url = null;
        }

        Payment::create([
            'name' => $request->name,
            'slug' =>  strtolower(str_replace(' ', '-', $request->name)),
            'image' => $image_url,
            'public_key' => $request->public_key,
            'secret_key' => $request->secret_key,
            'live_mood' => $request->live_mood,
            'status' => $request->status,
        ]);
        
        Toastr::success('Payment getway successfully create :-)','Success');
        return redirect()->back();
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
        $payments = Payment::findOrFail($id);
        return view('admin.payment.edit', compact('payments'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
        $this->validate($request, [
            'name' => 'required',
            'public_key' => 'required',
            'secret_key' => 'required',
        ]);
        
        $payment = Payment::findOrFail($id);

        
        $payment_image = $request->file('image');
        $slug = "payment";

        if(isset($payment_image)){
            $payment_image_name = $slug.'-'.uniqid().'.'.$payment_image->getClientOriginalExtension();
            $upload_path = 'media/payment/';
            $payment_image->move($upload_path, $payment_image_name);
            
            $old_payment = Payment::findOrFail($id);
            if(file_exists($old_payment->image)) {
                unlink($old_payment->image);
            }

            $image_url = $upload_path.$payment_image_name;

        }else {
            $old_payment = Payment::findOrFail($id);
            $image_url = $old_payment->image;
        }

        $payment->update([
            'name' => $request->name,
            'slug' =>  strtolower(str_replace(' ', '-', $request->name)),
            'image' => $image_url,
            'public_key' => $request->public_key,
            'secret_key' => $request->secret_key,
            'live_mood' => $request->live_mood,
            'status' => $request->status,
        ]);
        
        Toastr::info('Payment getway successfully update :-)','Success');
        return redirect()->route('payment-gateway.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
        $payments = Payment::findOrFail($id);

        if(file_exists($payments->image)){
            unlink($payments->image);
        }
        
        $payments->delete();

        Toastr::warning('Payment getway successfully delete :-)','Success');
        return redirect()->back();
    }
}
