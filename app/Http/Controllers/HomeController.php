<?php

namespace App\Http\Controllers;

use DB;
use Illuminate\Http\Request;
use App\Category;
use App\Product;
use App\City;
use App\Division;
use App\Area;
use App\Http\Controllers\CommonController as Common;
use App\Http\Controllers\BaseController;
use App\Models\Customer;
use App\Models\User;
use App\Repositories\Admin\Dashboard\DashboardInterface;
use Toastr;

class HomeController extends Controller
{
    protected $category;
    protected $product;
    protected $city;
    protected $division;
    protected $area;
    protected $common;

    protected $dashboard;

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index1()
    {
        // return redirect('admin')->with('success', 'Successfully reaches the dashboard !');
        // return back()->with('success', 'Item created successfully!');
        $data = $this->dashboard->getData();
        return view('home')->withData($data);
    }


    public function getTestApi(Request $request)
    {
        $users = User::all();
        return $this->sendResponse($users->toArray(), 'Users retrieved successfully.');
    }

    public function __construct(DashboardInterface $dashboard, Category $category, Product $product, Division $division, City $city,  Area $area, Common $common)
    {
        $this->category  = $category;
        $this->product   = $product;
        $this->division  = $division;
        $this->city      = $city;
        $this->area      = $area;
        $this->common    = $common;
        $this->dashboard = $dashboard;
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {


        $data                   = array();
        $data['top_categories'] = $this->category->getTopCategory(50);
        $data['urgent_ads']     = $this->product->getUrgentAds(10);
        $data['recent_ads']     = $this->product->getRecentAds(8);
        $common                 = $this->common->getCommon();

        $data['divisions']      = $common['divisions'];
        $data['cities']         = $common['cities'];
        $data['areas']          = $common['areas'];
        $data['category']       = $common['category'];
        $data['subcategory']    = $common['subcategory'];
        $data['area_query']     = null;
        $data['area_query_display']  = null;

        $page1 = DB::table('prd_ads')->where('prd_ads.is_active', 1)->where('prd_ads.name', 'home_page1')->first();

        if ($page1) {
            $data['home_page1'] = DB::table('prd_ad_details')->where('prd_ad_id', $page1->pk_no)->inRandomOrder()->first();
        }

        $page2 = DB::table('prd_ads')->where('prd_ads.is_active', 1)->where('prd_ads.name', 'home_page2')->first();

        if ($page2) {
            $data['home_page2'] = DB::table('prd_ad_details')->where('prd_ad_id', $page2->pk_no)->inRandomOrder()->first();
        }

        $page3 = DB::table('prd_ads')->where('prd_ads.is_active', 1)->where('prd_ads.name', 'home_page3')->first();

        if ($page3) {
            $data['home_page3'] = DB::table('prd_ad_details')->where('prd_ad_id', $page3->pk_no)->inRandomOrder()->first();
        }

        // dd($data);

        return view('home.home', compact('data'));
    }
    public function getMyAds(Request $request)
    {
        return view('users.my_ads');
    }
    public function getMyProfile(Request $request)
    {
        return view('users.my_profile');
    }
    public function getMyMembership(Request $request)
    {
        return view('users.my_membership');
    }
    public function getFavoriteAds(Request $request)
    {
        return view('users.my_favorite_ads');
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

    public function verifyUser($token)
    {
        $user = Customer::where('random_token', $token)->first();
        $user->is_verified = 1;
        $user->update();
        Toastr::success('Successfully Verified.Please Login', 'Success', ["positionClass" => "toast-top-right"]);
        return redirect('/login');
    }

    public function cc(Request $request)
    {
        \Artisan::call('cache:clear');
        \Artisan::call('view:clear');
        \Artisan::call('route:clear');
        \Artisan::call('config:clear');
        \Artisan::call('config:cache');

        return 'DONE';
    }
}
