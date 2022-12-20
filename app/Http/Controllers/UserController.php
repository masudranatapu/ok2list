<?php
namespace App\Http\Controllers;
use App\Http\Requests\updateProfileRequest;
use App\Http\Requests\updatePasswordRequest;
use Illuminate\Http\Request;
use App\City;
use App\Payments;
use App\User;
use Toastr;
use App\Product;
use Auth;
use DB;

class UserController extends Controller
{
    protected $city;
    protected $user;
    protected $prodModel;

    public function __construct(City $city, User $user, Product $prodModel)
    {
        $this->middleware('auth');
        $this->city         = $city;
        $this->userModel    = $user;
        $this->prodModel    = $prodModel;
          
    }

   
   public function getDashboardOverview()
   {
        $data = array();
        $data['rows'] = $this->prodModel->getFavoriteAds();
        $postedads = DB::table('prd_master')->where('customer_pk_no', Auth::user()->id)->get();
        $expireads = DB::table('prd_master')->where('customer_pk_no', Auth::user()->id)->where('is_active', 2)->get();
        // dd($postedads);
        
		$package = Payments::where('f_customer_pk_no', Auth::user()->id)->where('f_package_pk_no', Auth::user()->package_id)->orderBy('pk_no','desc')->first();
		$totalads = DB::table('prd_master')->whereBetween('created_at', [$package->validated_on, $package->expired_on])->get();

        return view('users.dashboard_overview', compact('data', 'postedads', 'expireads', 'package', 'totalads'));

   }
    
    public function getMyDashboard(Request $request)
    {
        $data = array();
        $data['city_combo'] = $this->city->getCityCombo();
        
        return view('users.my_dashboard',compact('data'));
    }

    public function postMyProfileUpdate(updateProfileRequest $request)
    {
        $this->resp     = $this->userModel->postMyProfileUpdate($request);
        $msg            = $this->resp->msg;
        $msg_title      = $this->resp->msg_title;
        Toastr::success($msg, $msg_title, ["positionClass" => "toast-top-right"]);
        
        return redirect()->route($this->resp->redirect_to)->with($this->resp->redirect_class, $this->resp->msg);

    }

    public function postMyPasswordUpdate(updatePasswordRequest $request)
    {

        $this->resp     = $this->userModel->postMyPasswordUpdate($request);
        $msg            = $this->resp->msg;
        $msg_title      = $this->resp->msg_title;
        
        Toastr::info($msg, $msg_title, ["positionClass" => "toast-top-right"]);
        return redirect()->route($this->resp->redirect_to)->with($this->resp->redirect_class, $this->resp->msg);
    }

    public function postFavoriteAd(Request $request)
    {
        $data               = array();
        $this->resp         = $this->userModel->postFavoriteAd($request);
        $data['status']     = $this->resp->status;
        $data['msg']        = $this->resp->msg;
        $data['msg_title']  = $this->resp->msg_title;
        return response()->json($data);
        

    }

    public function getFavoriteAds(Request $request)
    {   
        $data = array();
        $data['rows'] = $this->prodModel->getFavoriteAds();
        // dd($data);
        return view('users.my_favorite_ads', compact('data'));
    }
  

    public function getMyMembership(Request $request)
    {
        return view('users.my_membership');
    }

    public function getpromotedAds(Request $request)
    {
        return view('users.promoted_ads');
    }
    public function getAdsPromotion(Request $request)
    {
        return view('users.ads_promotion');
    }
    public function getPendingAds(Request $request)
    {
        return view('users.pending_ads');
    }

    public function getMyPurchaseHistory()
    {
        $purchase_history = Payments::where('f_customer_pk_no',Auth::user()->id)->orderBy('pk_no','desc')->get();
        return view('users.purchase_history',compact('purchase_history'));
    }

    public function getMyPurchaseInvoice($id)
    {
        $payment = Payments::find($id);
        return view('users.purchase_invoice',compact('payment'));
    }
}
