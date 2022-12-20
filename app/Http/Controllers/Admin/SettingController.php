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
use Carbon\Carbon;

class SettingController extends BaseController
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

    public function getAboutUs()
    {
        $about = DB::table('page_about_us')->latest()->first();
        return view('admin.web.about', compact('about'));

    }
    public function getAboutUsUpdate(Request $request, $id)
    {

        $about_image = $request->file('image');
        $slug = 'about';
        if(isset($about_image)){
            $about_image_name = $slug.'-'.uniqid().'.'.$about_image->getClientOriginalExtension();
            $upload_path = 'media/about/';
            $about_image->move($upload_path, $about_image_name);
            
            $old_image = DB::table('page_about_us')->where('id', $id)->first();
            if(file_exists($old_image->image)){
                unlink($old_image->image);
            }

            $image_url = $upload_path.$about_image_name;

        }else {
            $old_image = DB::table('page_about_us')->where('id', $id)->first();
            $image_url = $old_image->image;
        }

        DB::table('page_about_us')->where('id', $id)->update([
            'image' => $image_url,
            'details_en' => $request->desc,
            'details_sl' => $request->desc1,
            'mission_en' => $request->mission_en,
            'mission_sl' => $request->mission_sl,
            'vision_en' => $request->vision_en,
            'vision_sl' => $request->vision_sl,
            'our_values_en' => $request->our_values_en,
            'our_values_sl' => $request->our_values_sl,
        ]);
        return redirect()->back()->with('flashMessageSuccess','Sucessfully Updated');
        
    }

    public function getContactUs() {
        $data           = array();
        //$this->resp     = $this->cityInt->getPaginatedList($request, 20);
        //$data['data']   = $this->resp->data;
        return view('admin.web.contact',compact('data'));
    }
    public function getTermsConditions() {
        
        $terms = DB::table('page_terms_conditions')->latest()->first();
        return view('admin.web.terms-conditions',compact('terms'));
    }
    public function getTermsConditionsUpdate(Request $request, $id)
    {
        DB::table('page_terms_conditions')->where('id', $id)->update([
            'details_en' => $request->desc,
            'details_sl' => $request->desc1,
            'rules_en' => $request->rules_en,
            'rules_sl' => $request->rules_sl,
        ]);
        return redirect()->back()->with('flashMessageSuccess','Sucessfully Updated');
    }
    public function getPrivacyPolicy() {
        $privacy = DB::table('page_privacy_policy')->latest()->first();
        return view('admin.web.privacy-policy',compact('privacy'));
    }
    public function getPrivacyPolicyUpdate(Request $request, $id)
    {
        DB::table('page_privacy_policy')->where('id', $id)->update([
            'details_en' => $request->desc,
            'details_sl' => $request->desc1,
            'rules_en' => $request->rules_en,
            'rules_sl' => $request->rules_sl,
        ]);
        return redirect()->back()->with('flashMessageSuccess','Sucessfully Updated');
    }
    public function getQuickRules() {
        $quickrules = DB::table('quick_rules')->latest()->first();
        // dd($quickrules);
        return view('admin.web.quick-rules', compact('quickrules'));
    }
    public function getQuickRulesUpdate(Request $request, $id)
    {
        DB::table('quick_rules')->where('id', $id)->update([
            'title_en' => $request->title_en,
            'sub_title_en' => $request->sub_title_en,
            'one_en' => $request->one_en,
            'two_en' => $request->two_en,
            'three_en' => $request->three_en,
            'four_en' => $request->four_en,
            'five_en' => $request->five_en,
            'six_en' => $request->six_en,
            'seven_en' => $request->seven_en,
            'eight_en' => $request->eight_en,
            'nine_en' => $request->nine_en,
            'ten_en' => $request->ten_en,
            'title_sl' => $request->title_sl,
            'sub_title_sl' => $request->sub_title_sl,
            'one_sl' => $request->one_sl,
            'two_sl' => $request->two_sl,
            'three_sl' => $request->three_sl,
            'four_sl' => $request->four_sl,
            'five_sl' => $request->five_sl,
            'six_sl' => $request->six_sl,
            'seven_sl' => $request->seven_sl,
            'eight_sl' => $request->eight_sl,
            'nine_sl' => $request->nine_sl,
            'ten_sl' => $request->ten_sl,
            'created_at' => Carbon::now(),
            'updated_at' => Carbon::now(),
        ]);

        return redirect()->back()->with('flashMessageSuccess','Sucessfully Updated');

    }
    public function gethowtoSellFast() {
        $data           = array();
        $data['row']   = DB::table('page_how_sell_fast')->first();
        return view('admin.web.how-to-sell',compact('data'));
    }
    public function getWhyMembership() {
        $membership = DB::table('page_membership')->first();
        return view('admin.web.why-membership',compact('membership'));
    }

    public function getWhyMembershipUpdate(Request $request, $id)
    {
        DB::table('page_membership')->where('id', $id)->update([
            'description' => $request->desc,
            'description_sl' => $request->desc1,
        ]);
        return redirect()->back()->with('flashMessageSuccess','Sucessfully Updated');
    }
    public function getMailConfig() {
        $data           = array();
        //$this->resp     = $this->cityInt->getPaginatedList($request, 20);
        //$data['data']   = $this->resp->data;
        return view('admin.web.mail-config',compact('data'));
    }
    public function getFooter() {
        $data           = array();
        //$this->resp     = $this->cityInt->getPaginatedList($request, 20);
        //$data['data']   = $this->resp->data;
        $site_settings = DB::table('site_settings')->latest()->first();
        return view('admin.web.footer',compact('data', 'site_settings'));
    }

    public function getFooterUpdate(Request $request, $id)
    {
        DB::table('site_settings')->where('id', $id)->update([
            'section_one_name_en' => $request->section_one_name_en,
            'section_one_name_sl' => $request->section_one_name_sl,
            'about_en' => $request->about_en,
            'contact_us_en' => $request->contact_us_en,
            'terms_conditions_en' => $request->terms_conditions_en,
            'privacy_policy_en' => $request->privacy_policy_en,
            'sitemap_en' => $request->sitemap_en,
            'about_sl' => $request->about_sl,
            'contact_us_sl' => $request->contact_us_sl,
            'terms_conditions_sl' => $request->terms_conditions_sl,
            'privacy_policy_sl' => $request->privacy_policy_sl,
            'sitemap_sl' => $request->sitemap_sl,
            'section_two_en' => $request->section_two_en,
            'section_two_sl' => $request->section_two_sl,
            'how_to_sell_fast_en' => $request->how_to_sell_fast_en,
            'membership_en' => $request->membership_en,
            'promote_your_ad_en' => $request->promote_your_ad_en,
            'promotions_en' => $request->promotions_en,
            'faq_en' => $request->faq_en,
            'how_to_sell_fast_sl' => $request->how_to_sell_fast_sl,
            'membership_sl' => $request->membership_sl,
            'promote_your_ad_sl' => $request->promote_your_ad_sl,
            'promotions_sl' => $request->promotions_sl,
            'faq_sl' => $request->faq_sl,
            'section_three_name_en' => $request->section_three_name_en,
            'section_three_name_sl' => $request->section_three_name_sl,
            'facebook_en' => $request->facebook_en,
            'instagram_en' => $request->instagram_en,
            'twitter_en' => $request->twitter_en,
            'linkedin_en' => $request->linkedin_en,
            'whatsapp_en' => $request->whatsapp_en,
            'youtube_en' => $request->youtube_en,
            'facebook_sl' => $request->facebook_sl,
            'instagram_sl' => $request->instagram_sl,
            'twitter_sl' => $request->twitter_sl,
            'linkedin_sl' => $request->linkedin_sl,
            'whatsapp_sl' => $request->whatsapp_sl,
            'youtube_sl' => $request->youtube_sl,
            'facebook_link' => $request->facebook_link,
            'instagram_link' => $request->instagram_link,
            'twitter_link' => $request->twitter_link,
            'linkedin_link' => $request->linkedin_link,
            'whatsapp_link' => $request->whatsapp_link,
            'youtube_link' => $request->youtube_link,
            'section_four_en' => $request->section_four_en,
            'section_four_sl' => $request->section_four_sl,
            'content_en' => $request->content_en,
            'content_sl' => $request->content_sl,
        ]);

        return redirect()->back()->with('flashMessageSuccess','Sucessfully Updated');

    }

     public function getCopyRight() {
        $data           = array();
        //$this->resp     = $this->cityInt->getPaginatedList($request, 20);
        //$data['data']   = $this->resp->data;
        $site_settings = DB::table('site_settings')->latest()->first();
        return view('admin.web.copy-right', compact('data', 'site_settings'));
    }

    public function getCopyRightUpdate(Request $request, $id)
    {
        DB::table('site_settings')->where('id', $id)->update([
            'copyright' => $request->copyright, 
        ]);

        return redirect()->back()->with('flashMessageSuccess','Sucessfully Updated');

    }
    // public function site_setting(){
    //     return view('admin.site-setting.index');
    // }
    public function site_setting_store(Request $request){
        $setting = SiteSetting::first();
        if($setting){
            $setting->website_title = $request->website_title;
            $setting->meta_keyword = $request->meta_keyword;
            $setting->meta_description = $request->meta_description;
            if($request->hasFile('logo')) {
                $image = $request->logo;
                $filename = $image->getClientOriginalName();
                $filename = preg_replace('/\s+/', '-', $filename);
                $folder = 'uploads/'.date('Y').'/'.date('m');
                if (!file_exists($folder)) {
                    mkdir($folder, 0777, true);
                }
                $user_img = $folder.'/'. time() . '-' . $filename;
                Image::make($image)->save($user_img);
                $setting->logo = $user_img;
            }
            if($request->hasFile('favicon')) {
                $image = $request->favicon;
                $filename = $image->getClientOriginalName();
                $filename = preg_replace('/\s+/', '-', $filename);
                $folder = 'uploads/'.date('Y').'/'.date('m');
                if (!file_exists($folder)) {
                    mkdir($folder, 0777, true);
                }
                $user_img = $folder.'/'. time() . '-' . $filename;
                Image::make($image)->save($user_img);
                $setting->favicon = $user_img;
            }
            $setting->save();
        }else{
            $setting = new SiteSetting();
            $setting->website_title = $request->website_title;
            $setting->meta_keyword = $request->meta_keyword;
            $setting->meta_description = $request->meta_description;
            if($request->hasFile('logo')) {
                $image = $request->logo;
                $filename = $image->getClientOriginalName();
                $filename = preg_replace('/\s+/', '-', $filename);
                $folder = 'uploads/'.date('Y').'/'.date('m');
                if (!file_exists($folder)) {
                    mkdir($folder, 0777, true);
                }
                $user_img = $folder.'/'. time() . '-' . $filename;
                Image::make($image)->save($user_img);
                $setting->logo = $user_img;
            }
            if($request->hasFile('favicon')) {
                $image = $request->favicon;
                $filename = $image->getClientOriginalName();
                $filename = preg_replace('/\s+/', '-', $filename);
                $folder = 'uploads/'.date('Y').'/'.date('m');
                if (!file_exists($folder)) {
                    mkdir($folder, 0777, true);
                }
                $user_img = $folder.'/'. time() . '-' . $filename;
                Image::make($image)->save($user_img);
                $setting->favicon = $user_img;
            }
            $setting->save();
        }

        return redirect()->back()->with('flashMessageSuccess','Sucessfully Saved');
    }
    //Angcon


    public function site_ads_store(Request $request)
    {
        $this->resp = $this->ads->postStore($request);

        return redirect()->route($this->resp->redirect_to)->with($this->resp->redirect_class, $this->resp->msg);

    }


    public function site_website()
    {
        $setting = SiteSetting::first();
        // dd($setting);
        return view('admin.site-setting.website', compact('setting'));
    }
    public function websiteUpdate(Request $request, $id)
    {

        DB::table('site_settings')->where('id', $id)->update([
            'website_email' => $request->website_email,
            'phone' => $request->phone,
            'address' => $request->address,
            'map_address' => $request->map_address,
            'facebook_link' => $request->facebook_link,
            'twitter_link' => $request->twitter_link,
            'instagram_link' => $request->instagram_link,
            'linkedin_link' => $request->linkedin_link,
            'whatsapp_link' => $request->whatsapp_link,
            'youtube_link' => $request->youtube_link,
        ]);

        return redirect()->back()->with('flashMessageSuccess','Sucessfully Saved');

    }

    public function websiteUpdateSocile(Request $request, $id)
    {
        DB::table('site_settings')->where('id', $id)->update([
            'facebook_link' => $request->facebook_link,
            'twitter_link' => $request->twitter_link,
            'instagram_link' => $request->instagram_link,
            'linkedin_link' => $request->linkedin_link,
            'whatsapp_link' => $request->whatsapp_link,
            'youtube_link' => $request->youtube_link,
        ]);

        return redirect()->back()->with('flashMessageSuccess','Sucessfully Saved');

    }

    public function site_system()
    {
         return view('admin.site-setting.system');
    }

    public function site_mail()
    {
       return view('admin.site-setting.mail');
    }

    public function site_payment()
    {
       return view('admin.site-setting.payment');
    }

    public function site_seo()
    {
        return view('admin.site-setting.seo');
    }

    public function site_cms()
    {
        return view('admin.site-setting.cms');
    }


    public function site_ads_create()
    {
         return view('admin.site-setting.web_ad_create');
    }

    public function adsList()
    {
        $data = Ads::orderBy('name','asc')->get();
        return view('admin.site-setting.web_ad_index', compact('data'));
    }

    public function site_ads_edit($id)
    {
        $data = Ads::where('pk_no',$id)->first();
        $dataDetail = AdDetails::where('prd_ad_id',$id)->get();
        return view('admin.site-setting.web_ad_edit', compact('data','dataDetail'));
    }

    public function site_ads_update(Request $request, $id)
    {
        $this->resp = $this->ads->postUpdate($request,$id);
        return redirect()->route($this->resp->redirect_to)->with($this->resp->redirect_class, $this->resp->msg);

    }
    public function site_ads_deletephoto($id)
    {
        $this->resp = $this->ads->deletePhoto($id);
        return redirect()->back()->with($this->resp->redirect_class, $this->resp->msg);

    }
    public function site_ads_delete($id)
    {
        $this->resp = $this->ads->adDelete($id);
        return redirect()->back()->with($this->resp->redirect_class, $this->resp->msg);

    }



    // public function site_ads_create()
    // {
    //      return view('admin.site-setting.ads_create');
    // }









}
