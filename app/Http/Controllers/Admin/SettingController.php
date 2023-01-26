<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Support\Facades\Auth;
use Intervention\Image\Facades\Image;
use Carbon\Carbon;
use App\Models\Ads;
use App\Models\City;
use App\SiteSetting;
use App\Models\Country;
use App\Models\AdDetails;
use Illuminate\Http\Request;
use App\Http\Requests\AdsRequest;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\BaseController;
use App\Http\Requests\Admin\CityRequest;
use App\Repositories\Admin\City\CityInterface;

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
            'mission_en' => $request->mission_en,
            'vision_en' => $request->vision_en,
            'our_values_en' => $request->our_values_en,
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
            'rules_en' => $request->rules_en,
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
            'rules_en' => $request->rules_en,
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
            'about_en' => $request->about_en,
            'contact_us_en' => $request->contact_us_en,
            'terms_conditions_en' => $request->terms_conditions_en,
            'privacy_policy_en' => $request->privacy_policy_en,
            'sitemap_en' => $request->sitemap_en,
            'section_two_en' => $request->section_two_en,
            'how_to_sell_fast_en' => $request->how_to_sell_fast_en,
            'membership_en' => $request->membership_en,
            'promote_your_ad_en' => $request->promote_your_ad_en,
            'promotions_en' => $request->promotions_en,
            'faq_en' => $request->faq_en,
            'section_three_name_en' => $request->section_three_name_en,
            'facebook_en' => $request->facebook_en,
            'instagram_en' => $request->instagram_en,
            'twitter_en' => $request->twitter_en,
            'linkedin_en' => $request->linkedin_en,
            'whatsapp_en' => $request->whatsapp_en,
            'youtube_en' => $request->youtube_en,
            'facebook_link' => $request->facebook_link,
            'instagram_link' => $request->instagram_link,
            'twitter_link' => $request->twitter_link,
            'linkedin_link' => $request->linkedin_link,
            'whatsapp_link' => $request->whatsapp_link,
            'youtube_link' => $request->youtube_link,
            'section_four_en' => $request->section_four_en,
            'content_en' => $request->content_en,
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
            'email_verification' => $request->email_verification,
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
    public function websitepaymentUpdate(Request $request, $id)
    {

        DB::table('site_settings')->where('id', $id)->update([
            'paystack_public_key' => $request->paystack_public_key,
            'paystack_secret_key' => $request->paystack_secret_key,
            'paystack_curency' => $request->paystack_curency,
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
