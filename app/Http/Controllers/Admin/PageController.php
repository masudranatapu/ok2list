<?php

namespace App\Http\Controllers\Admin;

use DB;
use Auth;
use Image;
use App\Models\Ads;
use App\Models\City;
use App\SiteSetting;
use App\Models\Country;
use App\Models\AdDetails;
use Illuminate\Http\Request;
use App\Http\Requests\AdsRequest;
use App\Http\Controllers\BaseController;
use App\Http\Requests\Admin\CityRequest;
use App\Repositories\Admin\City\CityInterface;

class PageController extends BaseController
{
    protected $cityInt;
    protected $city;
    protected $country;
    protected $ads;

    public function __construct(CityInterface $cityInt, Country $country, City $city, Ads $ads)
    {
        $this->cityInt  = $cityInt;
        $this->city     = $city;
        $this->country  = $country;
        $this->ads      = $ads;
    }

    public function getHowToSellFast() {
        $data           = array();
        $data['row']   = DB::table('page_how_sell_fast')->first();
        return view('admin.web.how-to-sell',compact('data'));
    }


    public function postHowToSellFast(Request $request) {

        $check = DB::table('page_how_sell_fast')->first();

        if($check){
            DB::table('page_how_sell_fast')->where('id',$check->id)->update(['description' => $request->desc]);
        }else{
            DB::table('page_how_sell_fast')->insert(['description' => $request->desc]);
        }

        return redirect()->back()->with('flashMessageSuccess', 'Updated successfully');

    }

    public function admingetPromotions()
    {
        $promotions = DB::table('page_promotions')->first();
        return view('admin.web.promotions',compact('promotions'));
    }
    public function admingetPromotionsUpdate(Request $request, $id)
    {
        DB::table('page_promotions')->where('id', $id)->update([
            'description' => $request->desc,
        ]);

        return redirect()->back()->with('flashMessageSuccess', 'Updated successfully');
    }
    public function admingetPromote()
    {
        $promote = DB::table('page_promote')->first();
        return view('admin.web.promote',compact('promote'));
    }
    public function admingetPromoteUpdate(Request $request, $id)
    {
        DB::table('page_promote')->where('id', $id)->update([
            'description' => $request->desc,
        ]);

        return redirect()->back()->with('flashMessageSuccess', 'Updated successfully');
    }

    public function admingetSidebar()
    {
        $sidebar = DB::table('page_sidebar_info')->first();
        return view('admin.web.sidebar',compact('sidebar'));
    }

    public function admingetSidebarUpdate(Request $request, $id)
    {
        DB::table('page_sidebar_info')->where('id', $id)->update([
            'secure_trading_en' => $request->secure_trading_en,
            'support_en' => $request->support_en,
            'easy_trading_en' => $request->easy_trading_en,
        ]);

        return redirect()->back()->with('flashMessageSuccess', 'Updated successfully');

    }
}
