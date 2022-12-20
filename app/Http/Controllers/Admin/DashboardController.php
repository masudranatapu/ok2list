<?php

namespace App\Http\Controllers\Admin;

use App\Models\Product;
use App\Models\Category;
use App\Models\Customer;
use Illuminate\Http\Request;
use App\Http\Controllers\BaseController;
use App\Payments;
use Exception;
use NotifyLk\Api\SmsApi;
use DB;

class DashboardController extends BaseController
{
    public function __construct()
    {

    }

    public function getIndex() {
            $data['total_ads'] = Product::count();
            $data['total_category'] = Category::where('parent_id',0)->count();
            $data['total_premimum_clints'] = Customer::where('package_id',1)->count();
            $data['total_clints'] = Customer::count();
            $total_package_sell = Payments::where('payment_type','package')->sum('amount');
            $total_promotion_sell = Payments::where('payment_type','promotion')->sum('amount');
            $total_sell = $total_package_sell+$total_promotion_sell;
        return view('admin.dashboard.index', compact('data','total_package_sell','total_promotion_sell','total_sell'));
    }

    public function homepage() {
        return view('admin.dashboard.home');
    }



    public function transaction_history()
    { 
        $transactions = Payments::orderBy('pk_no','desc')->get();
         return view('admin.transaction.index',compact('transactions'));
    }
    public function delete_transaction_history($id){
        $transactions = Payments::where('pk_no',$id)->delete();
        return back()->with('message',"Transaction Delete successfully !");
    }
    public function edit_transaction($id){
        $transaction = Payments::where('pk_no',$id)->first();
        return view('admin.transaction.edit',compact('transaction'));
    }
    public function update_transaction(Request $request){
        $payment = Payments::where('pk_no',$request->transaction_id)->first();
        if($payment->payment_type == 'promotion'){
            $payment->status = $request->status;
            $payment->update();
            $product = DB::table('prd_master')->where('pk_no', $payment->f_prod_pk_no)
                ->update(['is_active' => 1 ]);
        }else{
            $payment->status = $request->status;
            $payment->update();
        }
        
        return redirect('admin/transaction-history')->with('message',"Transaction Updated successfully !");
    }
}
