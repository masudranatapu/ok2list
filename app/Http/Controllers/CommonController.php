<?php

namespace App\Http\Controllers;

use DB;
use App\Area;
use App\City;
use App\Package;
use App\Product;
use App\Category;
use App\Division;
use App\Models\AdDetails;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;

class CommonController extends Controller
{
    protected $category;
    protected $product;
    protected $city;
    protected $division;
    protected $area;
    protected $package;
    protected $prd_ad_details;


    public function __construct(Package $package, Category $category, Product $product, Division $division, City $city,  Area $area, AdDetails $prd_ad_details)
    {
       $this->category  = $category;
       $this->product   = $product;
       $this->division  = $division;
       $this->city      = $city;
       $this->area      = $area;
       $this->package = $package;
       $this->prd_ad_details = $prd_ad_details;
    }


    public function getCommon()
    {
        $data                   = array();
        $data['divisions']      = $this->division->getAlldivisions();
        $data['cities']         = $this->city->getCity();
        $data['areas']          = $this->area->getArea();
        $data['category']       = $this->category->getCategory();
        $data['subcategory']    = $this->category->getAllSubCategory();
        return $data;

    }

    public function getPackages(Request $request)
    {
        $data = array();
        $data['rows'] = $this->package->getPackages();
// dd($data);
        return view('package.index', compact('data'));
    }

    public function payment_gateway(Request $request){
        if(Auth::user()){
            $pack = DB::table('ss_packages')->where('pk_no',$request->get('pakid'))->first();
            Session::put('price', $pack->price_per_month);
            Session::put('adid', $request->get('adid'));
            Session::put('pakid', $request->get('pakid'));
            Session::put('promid', $request->get('promid'));
            return view('package.payment.index',compact('pack'));
        }else{
            return redirect()->route('login', ['referer' => 'package', 'pakid' =>$request->get('pakid')]  );
        }

   }
   public function promotion_payment_gateway(Request $request){
        if(Auth::user()){
            Session::put('adid', $request->get('adid'));
            Session::put('pakid', $request->get('pakid'));
            Session::put('promid', $request->get('promid'));
            Session::put('price', $request->get('price'));
            return view('package.payment.index');
        }else{
            return redirect()->route('login', ['referer' => 'package', 'pakid' =>$request->get('pakid')]  );
        }
   }




    public function getAboutUs(Request $request)
    {

        $data = [];

        $page1 = DB::table('prd_ads')->where('prd_ads.is_active',1)->where('prd_ads.name','about_us_page1')->first();

        if($page1){
            $data['about_us_page1'] = DB::table('prd_ad_details')->where('prd_ad_id',$page1->pk_no)->inRandomOrder()->first();
        }

        $page2 = DB::table('prd_ads')->where('prd_ads.is_active',1)->where('prd_ads.name','about_us_page2')->first();

        if($page2){
            $data['about_us_page2'] = DB::table('prd_ad_details')->where('prd_ad_id',$page2->pk_no)->inRandomOrder()->first();
        }
        $data['about'] = DB::table('page_about_us')->first();
        return view('common.about_us',compact('data'));
    }


    public function getContactUs(Request $request)
    {
        $data = [];

        $page1 = DB::table('prd_ads')->where('prd_ads.is_active',1)->where('prd_ads.name','contact_us_page1')->first();
        if($page1){
            $data['contact_us_page1'] = DB::table('prd_ad_details')->where('prd_ad_id',$page1->pk_no)->inRandomOrder()->first();
        }
        $page2 = DB::table('prd_ads')->where('prd_ads.is_active',1)->where('prd_ads.name','contact_us_page2')->first();
        if($page2){
            $data['contact_us_page2'] = DB::table('prd_ad_details')->where('prd_ad_id',$page2->pk_no)->inRandomOrder()->first();
        }

        return view('common.contact_us',compact('data'));
    }

    public function getTermsConditions(Request $request)
    {
        $data = [];
        $page1 = DB::table('prd_ads')->where('prd_ads.is_active',1)->where('prd_ads.name','tc_page1')->first();
        if($page1){
            $data['tc_page1'] = DB::table('prd_ad_details')->where('prd_ad_id',$page1->pk_no)->inRandomOrder()->first();
        }
        $page2 = DB::table('prd_ads')->where('prd_ads.is_active',1)->where('prd_ads.name','tc_page2')->first();
        if($page2){
            $data['tc_page2'] = DB::table('prd_ad_details')->where('prd_ad_id',$page2->pk_no)->inRandomOrder()->first();
        }
        $data['terms'] = DB::table('page_terms_conditions')->first();
        return view('common.terms_condition', compact('data'));
    }

    public function getPromoteAd(Request $request)
    {
        $data = [];
        $page1 = DB::table('prd_ads')->where('prd_ads.is_active',1)->where('prd_ads.name','promote_your_ad_page1')->first();
        if($page1){
            $data['promote_your_ad_page1'] = DB::table('prd_ad_details')->where('prd_ad_id',$page1->pk_no)->inRandomOrder()->first();
        }
        $page2 = DB::table('prd_ads')->where('prd_ads.is_active',1)->where('prd_ads.name','promote_your_ad_page2')->first();
        if($page2){
            $data['promote_your_ad_page2'] = DB::table('prd_ad_details')->where('prd_ad_id',$page2->pk_no)->inRandomOrder()->first();
        }
        $data['promote'] = DB::table('page_promote')->first();
        return view('common.promote_ad', compact('data'));
    }

    public function getPrivacyPolicy(Request $request)
    {
        $data = [];
        $page1 = DB::table('prd_ads')->where('prd_ads.is_active',1)->where('prd_ads.name','privacy_policy_page1')->first();
        if($page1){
            $data['privacy_policy_page1'] = DB::table('prd_ad_details')->where('prd_ad_id',$page1->pk_no)->inRandomOrder()->first();
        }
        $page2 = DB::table('prd_ads')->where('prd_ads.is_active',1)->where('prd_ads.name','privacy_policy_page2')->first();
        if($page2){
            $data['privacy_policy_page2'] = DB::table('prd_ad_details')->where('prd_ad_id',$page2->pk_no)->inRandomOrder()->first();
        }

        $data['privacy'] = DB::table('page_privacy_policy')->first();

        return view('common.privacy_policy',compact('data'));
    }

    public function getHowToSellFast(Request $request)
    {
        $data = [];
        $page1 = DB::table('prd_ads')->where('prd_ads.is_active',1)->where('prd_ads.name','how_to_sell_fast_page1')->first();
        if($page1){
            $data['how_to_sell_fast_page1'] = DB::table('prd_ad_details')->where('prd_ad_id',$page1->pk_no)->inRandomOrder()->first();
        }
        $page2 = DB::table('prd_ads')->where('prd_ads.is_active',1)->where('prd_ads.name','how_to_sell_fast_page2')->first();
        if($page2){
            $data['how_to_sell_fast_page2'] = DB::table('prd_ad_details')->where('prd_ad_id',$page2->pk_no)->inRandomOrder()->first();
        }
        
        $data['how_to_sell'] = DB::table('page_how_sell_fast')->first();
        $data['sidebar'] = DB::table('page_sidebar_info')->first();
        return view('common.how_to_sell_fast',compact('data'));
    }


    public function getMembership(Request $request)
    {

        $data = [];
        $page1 = DB::table('prd_ads')->where('prd_ads.is_active',1)->where('prd_ads.name','membership_page1')->first();
        if($page1){
            $data['membership_page1'] = DB::table('prd_ad_details')->where('prd_ad_id',$page1->pk_no)->inRandomOrder()->first();
        }
        $page2 = DB::table('prd_ads')->where('prd_ads.is_active',1)->where('prd_ads.name','membership_page2')->first();
        if($page2){
            $data['membership_page2'] = DB::table('prd_ad_details')->where('prd_ad_id',$page2->pk_no)->inRandomOrder()->first();
        }
        $data['membership'] = DB::table('page_membership')->first();
        $data['sidebar'] = DB::table('page_sidebar_info')->first();
        return view('common.get_membership',compact('data'));
    }


    public function getMyAds(Request $request)
    {

        return view('common.my_ads');
    }


    public function getPromotions(Request $request)
    {
        $data = [];
        $page1 = DB::table('prd_ads')->where('prd_ads.is_active',1)->where('prd_ads.name','promotions_page1')->first();
        if($page1){
            $data['promotions_page1'] = DB::table('prd_ad_details')->where('prd_ad_id',$page1->pk_no)->inRandomOrder()->first();
        }
        $page2 = DB::table('prd_ads')->where('prd_ads.is_active',1)->where('prd_ads.name','promotions_page2')->first();
        if($page2){
            $data['promotions_page2'] = DB::table('prd_ad_details')->where('prd_ad_id',$page2->pk_no)->inRandomOrder()->first();
        }
        $data['promotions'] = DB::table('page_promotions')->first();
        $data['sidebar'] = DB::table('page_sidebar_info')->first();
        return view('common.promotions',compact('data'));
    }




    public function getFaq(Request $request)
    {

        $data = [];
        $page1 = DB::table('prd_ads')->where('prd_ads.is_active',1)->where('prd_ads.name','faq_page1')->first();
        if($page1){
            $data['faq_page1'] = DB::table('prd_ad_details')->where('prd_ad_id',$page1->pk_no)->inRandomOrder()->first();
        }
        $page2 = DB::table('prd_ads')->where('prd_ads.is_active',1)->where('prd_ads.name','faq_page2')->first();
        if($page2){
            $data['faq_page2'] = DB::table('prd_ad_details')->where('prd_ad_id',$page2->pk_no)->inRandomOrder()->first();
        }
        $data['faqs']=DB::table('ss_faq')->orderBy('pk_no','DESC')->get();

        return view('common.faq', compact('data'));

    }

    // public function getPackages(Request $request)
    // {

    //     return view('common.packages');
    // }

    public function getSiteMap(Request $request)
    {
        $data = array();
        $data['data'] =  $this->getCommon();
        $page1 = DB::table('prd_ads')->where('prd_ads.is_active',1)->where('prd_ads.name','site_map_page1')->first();
        if($page1){
            $data['site_map_page1'] = DB::table('prd_ad_details')->where('prd_ad_id',$page1->pk_no)->inRandomOrder()->first();
        }
        $page2 = DB::table('prd_ads')->where('prd_ads.is_active',1)->where('prd_ads.name','site_map_page2')->first();
        if($page2){
            $data['site_map_page2'] = DB::table('prd_ad_details')->where('prd_ad_id',$page2->pk_no)->inRandomOrder()->first();
        }
        return view('common.site-map', compact('data'));
    }


    public function getArea($location_id,$type)
    {
        $response = '<option value="">No data found</option>';

        if ($type == 'city') {
            $data = Area::where('city_pk_no',$location_id)->get();
        }elseif($type == 'division'){
            $data = Area::where('division_pk_no',$location_id)->get();
        }else{
            $data = null;
        }
        if ($data && count($data) > 0 ) {
            $response = '';
          foreach ($data as $key => $value) {
            $response .= '<option value="'.$value->pk_no.'">'.$value->name.'</option>';
          }
        }

        return response()->json($response);
    }

    public function changelang($lang){
        Session::put('applocale', $lang);
        return redirect()->back();
    }





}











