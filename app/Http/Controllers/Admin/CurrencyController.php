<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Currency;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\Artisan;

class CurrencyController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $currencies = Currency::latest()->paginate(15);
        return view('admin.currency.index', compact('currencies'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        return view('admin.currency.create');
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
            'code' => 'required',
            'symbol' => 'required',
            'symbol_position' => 'required',
            'conversion_rate' => 'required',
        ]);
        
        Currency::create([
            'name' => $request->name,
            'code' => $request->code,
            'symbol' => $request->symbol,
            'conversion_rate' => $request->conversion_rate,
            'default_currencies' => 0,
            'symbol_position' => $request->symbol_position,
        ]);

        Toastr::success('Currency Created Successfully:-)','Success');

        return redirect()->route('currency.index');

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
        $currencies = Currency::findOrFail($id);
        return view('admin.currency.edit', compact('currencies'));
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
            'code' => 'required',
            'symbol' => 'required',
            'symbol_position' => 'required',
            'conversion_rate' => 'required',
        ]);

        $currency = Currency::findOrFail($id);

        $currency->update([
            'name' => $request->name,
            'code' => $request->code,
            'symbol' => $request->symbol,
            'conversion_rate' => $request->conversion_rate,
            'symbol_position' => $request->symbol_position,
        ]);
        
        Toastr::success('Currency Updated Successfully:-)','Success');
        return redirect()->route('currency.index');

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
        $currency = Currency::findOrFail($id);

        if ($currency->default_currencies == 1) {
            Toastr::info('You can not delete default currency :-)','Success');
            return redirect()->back();
        }

        $currency->delete();

        Toastr::info('Currency successfully delete :-)','Success');
        return redirect()->back();

    }

    public function setDefaultcurrency(Request $request)
    {
        $getDefualtCurrency = Currency::where('default_currencies', 1)->first();
        
        $getRequestCurrency = Currency::where('id', $request->id)->first();
        

        $getConversionRate = $getDefualtCurrency->default_currencies / $getRequestCurrency->conversion_rate;
        
        $all_currency = Currency::where('id', '!=', $request->id)->get();
        
        foreach ($all_currency as $value) {

            $single_currency = Currency::where('id', $value->id)->first();
            $single_currency_conversion_rate = $single_currency->conversion_rate * $getConversionRate;

            Currency::where('id', $value->id)->update([
                'conversion_rate' => $single_currency_conversion_rate,
            ]);

        }

        Currency::where('id', $getDefualtCurrency->id)->update([
            'conversion_rate' => $getConversionRate,
        ]);
        
        
        Currency::where('default_currencies', 1)->update([
            'default_currencies' => 0,
        ]);

        Currency::where('id', $request->id)->update([
            'default_currencies' => 1,
            'conversion_rate' => 1,
        ]);
        
        Toastr::success('Defualt Currency set successfully done :-)','Success');
        return redirect()->back();
        

    }
}
