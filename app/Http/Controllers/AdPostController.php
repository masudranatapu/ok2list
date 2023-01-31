<?php

namespace App\Http\Controllers;

use Str;
use App\Area;
use App\City;
use App\Brand;
use App\Package;
use App\Product;
use App\Category;
use App\Division;
use App\Payments;
use App\ProductType;
use App\ProductModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Requests\postAdRequest;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\Auth;
use App\Http\Requests\postJobRequest;
use App\Http\Requests\postPropertyRequest;
use App\Http\Requests\postAdServiceRequest;
use App\Mail\UserAdPostAdminGetMail;
use App\Mail\UserAdPostMail;
use Illuminate\Support\Facades\Mail;
use Carbon\Carbon;

class AdPostController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    protected $category;
    protected $brand;
    protected $prodModel;
    protected $city;
    protected $division;
    protected $area;
    protected $prod_model;
    protected $package;

    public function __construct(Category $category, Brand $brand, Product $prodModel, City $city, Division $division, Area $area, ProductModel $prod_model, Package $package)
    {
        $this->middleware('auth');
        $this->categoryModel     = $category;
        $this->brandModel        = $brand;
        $this->productModel      = $prodModel;
        $this->cityModel         = $city;
        $this->divisionModel     = $division;
        $this->areaModel         = $area;
        $this->prod_model        = $prod_model;
        $this->package           = $package;
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function getAdPost(Request $request, string $subcategory = null)
    {
        // return $request;
        $data = array();
        $data['category']       = $this->categoryModel->getCategory();
        $data['subcategory']    = $this->categoryModel->getAllSubCategory();

        if ($request->category != null) {
            $data['subcat_info'] = $this->categoryModel->getSubCategoryInfo($subcategory);
        }

        $package = Payments::where('f_customer_pk_no', Auth::user()->id)->orderBy('pk_no', 'desc')->first();
        if ($subcategory) {
            $data['brand_combo']            = $this->brandModel->getBrandBySubCat($request->category, 'list');
            $data['model_combo']            = null;
            $data['city_combo']             = $this->cityModel->getCityCombo('list');
            $data['division_combo']         = $this->divisionModel->getDivisionCombo('list');
            $data['selected_area_combo']    = Area::where('city_pk_no', 5)->pluck('name', 'pk_no');
            $data['product_type_combo']     = ProductType::where('scat_pk_no', $request->category)->pluck('name', 'pk_no');
            $data['remaining_post']         = $this->package->getRemainingPost();

            if (request()->get('type') == 'property') {
                return view('ad_post.ad_post_property', compact('data', 'package'));
            } elseif (request()->get('type') == 'jobs') {
                return view('ad_post.ad_post_job', compact('data', 'package'));
            } elseif (request()->get('type') == 'matrimony-services') {
                return view('ad_post.ad_post_matrimony', compact('data', 'package'));
            } else {
                return view('ad_post.ad_post', compact('data', 'package'));
            }
        }

        return view('ad_post.ad_post_category_selection', compact('data'));
    }

    public function getPostLike($id)
    {
        $check = DB::table('prd_like_count')->where('customer_id', Auth::id())->where('prd_id', $id)->first();

        if ($check) {
            //update
            DB::table('prd_like_count')->where('customer_id', Auth::id())->where('prd_id', $id)->update(['counter' => 1]);
        } else {
            //insert
            DB::table('prd_like_count')->insert(['prd_id' => $id, 'customer_id' => Auth::id(), 'counter' => 1]);
        }


        Toastr::success('Liked successfully', 'Success', ["positionClass" => "toast-top-right"]);
        return redirect()->back();
    }

    public function getPostDislike($id)
    {

        DB::table('prd_like_count')->where('customer_id', Auth::id())->where('prd_id', $id)->update(['counter' => 0]);
        Toastr::success('Disliked successfully', 'Success', ["positionClass" => "toast-top-right"]);
        return redirect()->back();
    }


    public function postAdGeneral(postAdRequest $request)
    {

        if (setting()->app_mode == "live") {

            $check_mobile_number = $this->productModel->checkMobileNumber($request);
            if ($check_mobile_number === false) {
                $msg        = 'Your Mobile number is not valid';
                $msg_title  = 'Invalid Data';
                Toastr::success($msg, $msg_title, ["positionClass" => "toast-top-right"]);
                return redirect()->back()->withInput($request->input());
            }
        }

        $this->resp     = $this->productModel->postAdGeneral($request);
        $msg            = $this->resp->msg;
        $msg_title      = $this->resp->msg_title;

        Toastr::success($msg, $msg_title, ["positionClass" => "toast-top-right"]);

        $id = $this->resp->data->pk_no;

        // return redirect()->route($this->resp->redirect_to)->with($this->resp->redirect_class, $this->resp->msg);

        if ($this->resp->status) {
            return redirect()->route('promoted-ads.create', $id)->with($this->resp->redirect_class, $this->resp->msg);
        } else {
            return redirect()->route($this->resp->redirect_to)->with($this->resp->redirect_class, $this->resp->msg);
        }

        // return redirect()->route('promoted-ads.create',$row->pk_no);

    }

    public function postAdJob(postJobRequest $request)
    {
        $setting = setting();
        $check_mobile_number = $this->productModel->checkMobileNumber($request);

        if ($check_mobile_number === false) {
            $msg        = 'Your Mobile number is not valid';
            $msg_title  = 'Invalid Data';
            Toastr::error($msg, $msg_title, ["positionClass" => "toast-top-right"]);
            return redirect()->back()->withInput($request->input());
        }

        $this->resp     = $this->productModel->postAdJob($request);
        $msg            = $this->resp->msg;
        $msg_title      = $this->resp->msg_title;

        if (Auth::user()) {

            $user = Auth::user();

            $details = [
                'subject' => 'Message from '. ' ' . $setting->website_title,
                'greeting' => 'Hi ' . $user->name . ', ',
                'body' => 'You posted a job ads on '. ' ' .$setting->website_title,
                'email' => 'Your email is : ' . $user->email,
                'thanks' => 'Thank you for using '. ' ' .$setting->website_title,
                'site_url' => route('home'),
                'site_name' => $setting->website_title,
                'copyright' => Carbon::now()->format('Y') . ' ' .$setting->copyright . ' ' . $setting->website_title . ' ' . 'All rights reserved.',
            ];

            Mail::to($user->email)->send(new UserAdPostMail($details));

        }

        $admin = DB::table('auths')->where('id', 1)->first();

        if ($admin) {

            $user = Auth::user();

            $admindetails = [
                'subject' => 'Message from '. ' ' . $setting->website_title,
                'greeting' => 'Hi ' . $admin->username . ', ',
                'body' => $user->name . ' was posted on'.' '.$setting->website_title.'. '.'Please see what he posted on'.' '.$setting->website_title.' '.'And Approved ' . $user->name . ' ads.',
                'email' => 'His email is : ' . $user->email,
                'thanks' => 'Thank you for using '. ' ' .$setting->website_title,
                'site_url' => route('home'),
                'site_name' => $setting->website_title,
                'copyright' => Carbon::now()->format('Y') . ' ' .$setting->copyright . ' ' . $setting->website_title . ' ' . 'All rights reserved.',
            ];

            Mail::to($admin->email)->send(new UserAdPostAdminGetMail($admindetails));

        }

        Toastr::success($msg, $msg_title, ["positionClass" => "toast-top-right"]);

        $id = $this->resp->data->prod_pk_no;

        if ($this->resp->status) {
            return redirect()->route('promoted-ads.create', $id)->with($this->resp->redirect_class, $this->resp->msg);
        } else {
            return redirect()->route($this->resp->redirect_to)->with($this->resp->redirect_class, $this->resp->msg);
        }

    }

    public function postAdProperty(postPropertyRequest $request)
    {
        $setting = setting();
        $check_mobile_number = $this->productModel->checkMobileNumber($request);

        if ($check_mobile_number === false) {
            $msg        = 'Your Mobile number is not valid';
            $msg_title  = 'Invalid Data';
            Toastr::success($msg, $msg_title, ["positionClass" => "toast-top-right"]);
            return redirect()->back()->withInput($request->input());
        }

        $this->resp     = $this->productModel->postAdProperty($request);
        $msg            = $this->resp->msg;
        $msg_title      = $this->resp->msg_title;

        if (Auth::user()) {

            $user = Auth::user();

            $details = [
                'subject' => 'Message from '. ' ' . $setting->website_title,
                'greeting' => 'Hi ' . $user->name . ', ',
                'body' => 'You posted a property ads on '. ' ' .$setting->website_title,
                'email' => 'Your email is : ' . $user->email,
                'thanks' => 'Thank you for using '. ' ' .$setting->website_title,
                'site_url' => route('home'),
                'site_name' => $setting->website_title,
                'copyright' => Carbon::now()->format('Y') . ' ' .$setting->copyright . ' ' . $setting->website_title . ' ' . 'All rights reserved.',
            ];

            Mail::to($user->email)->send(new UserAdPostMail($details));
        }

        $admin = DB::table('auths')->where('id', 1)->first();

        if ($admin) {

            $user = Auth::user();

            $admindetails = [
                'subject' => 'Message from '. ' ' . $setting->website_title,
                'greeting' => 'Hi ' . $admin->username . ', ',
                'body' => $user->name . ' was posted an property on'.' '.$setting->website_title.'. '.'Please see what he posted on'.' '.$setting->website_title.' '.'And Approved ' . $user->name . ' ads.',
                'email' => 'His email is : ' . $user->email,
                'thanks' => 'Thank you for using '. ' ' .$setting->website_title,
                'site_url' => route('home'),
                'site_name' => $setting->website_title,
                'copyright' => Carbon::now()->format('Y') . ' ' .$setting->copyright . ' ' . $setting->website_title . ' ' . 'All rights reserved.',
            ];

            Mail::to($admin->email)->send(new UserAdPostAdminGetMail($admindetails));

        }

        Toastr::success($msg, $msg_title, ["positionClass" => "toast-top-right"]);


        $id = $this->resp->data->pk_no;

        if ($this->resp->status) {
            return redirect()->route('promoted-ads.create', $id)->with($this->resp->redirect_class, $this->resp->msg);
        } else {
            return redirect()->route($this->resp->redirect_to)->with($this->resp->redirect_class, $this->resp->msg);
        }
    }


    public function postAdService(postAdServiceRequest $request)
    {
        $setting = setting();
        $check_mobile_number = $this->productModel->checkMobileNumber($request);

        if ($check_mobile_number === false) {
            $msg        = 'Your Mobile number is not valid';
            $msg_title  = 'Invalid Data';
            Toastr::success($msg, $msg_title, ["positionClass" => "toast-top-right"]);
            return redirect()->back()->withInput($request->input());
        }

        $this->resp     = $this->productModel->postAdService($request);
        $msg            = $this->resp->msg;
        $msg_title      = $this->resp->msg_title;

        if (Auth::user()) {

            $user = Auth::user();

            $details = [
                'subject' => 'Message from '. ' ' . $setting->website_title,
                'greeting' => 'Hi ' . $user->name . ', ',
                'body' => 'You posted a service ads on '. ' ' .$setting->website_title,
                'email' => 'Your email is : ' . $user->email,
                'thanks' => 'Thank you for using '. ' ' .$setting->website_title,
                'site_url' => route('home'),
                'site_name' => $setting->website_title,
                'copyright' => Carbon::now()->format('Y') . ' ' .$setting->copyright . ' ' . $setting->website_title . ' ' . 'All rights reserved.',
            ];

            Mail::to($user->email)->send(new UserAdPostMail($details));

        }

        $admin = DB::table('auths')->where('id', 1)->first();

        if ($admin) {

            $user = Auth::user();

            $admindetails = [
                'subject' => 'Message from '. ' ' . $setting->website_title,
                'greeting' => 'Hi ' . $admin->username . ', ',
                'body' => $user->name . ' was posted on'.' '.$setting->website_title.'. '.'Please see what he posted on'.' '.$setting->website_title.' '.'And Approved ' . $user->name . ' ads.',
                'email' => 'His email is : ' . $user->email,
                'thanks' => 'Thank you for using '. ' ' .$setting->website_title,
                'site_url' => route('home'),
                'site_name' => $setting->website_title,
                'copyright' => Carbon::now()->format('Y') . ' ' .$setting->copyright . ' ' . $setting->website_title . ' ' . 'All rights reserved.',
            ];

            Mail::to($admin->email)->send(new UserAdPostAdminGetMail($admindetails));
        }

        Toastr::success($msg, $msg_title, ["positionClass" => "toast-top-right"]);


        $id = $this->resp->data->prod_pk_no;

        if ($this->resp->status) {
            return redirect()->route('promoted-ads.create', $id)->with($this->resp->redirect_class, $this->resp->msg);
        } else {
            return redirect()->route($this->resp->redirect_to)->with($this->resp->redirect_class, $this->resp->msg);
        }
    }

    public function updatePostAdService(postAdServiceRequest $request, $id)
    {
        $setting = setting();
        $check_mobile_number = $this->productModel->checkMobileNumber($request);

        if ($check_mobile_number === false) {
            $msg        = 'Your Mobile number is not valid';
            $msg_title  = 'Invalid Data';
            Toastr::success($msg, $msg_title, ["positionClass" => "toast-top-right"]);
            return redirect()->back()->withInput($request->input());
        }

        $this->resp     = $this->productModel->updatePostAdService($request, $id);
        $msg            = $this->resp->msg;
        $msg_title      = $this->resp->msg_title;

        if (Auth::user()) {

            $user = Auth::user();

            $details = [
                'subject' => 'Message from '. ' ' . $setting->website_title,
                'greeting' => 'Hi ' . $user->name . ', ',
                'body' => 'You updated an ads on '. ' ' .$setting->website_title,
                'email' => 'Your email is : ' . $user->email,
                'thanks' => 'Thank you for using '. ' ' .$setting->website_title,
                'site_url' => route('home'),
                'site_name' => $setting->website_title,
                'copyright' => Carbon::now()->format('Y') . ' ' .$setting->copyright . ' ' . $setting->website_title . ' ' . 'All rights reserved.',
            ];

            Mail::to($user->email)->send(new UserAdPostMail($details));

        }

        Toastr::success($msg, $msg_title, ["positionClass" => "toast-top-right"]);
        return redirect()->route($this->resp->redirect_to)->with($this->resp->redirect_class, $this->resp->msg);
    }



    public function updatePostGeneral(postAdRequest $request, $id)
    {
        $setting = setting();
        $this->resp     = $this->productModel->updatePostGeneral($request, $id);
        $msg            = $this->resp->msg;
        $msg_title      = $this->resp->msg_title;

        if (Auth::user()) {

            $user = Auth::user();

            $details = [
                'subject' => 'Message from '. ' ' . $setting->website_title,
                'greeting' => 'Hi ' . $user->name . ', ',
                'body' => 'You updated an ads on '. ' ' .$setting->website_title,
                'email' => 'Your email is : ' . $user->email,
                'thanks' => 'Thank you for using '. ' ' .$setting->website_title,
                'site_url' => route('home'),
                'site_name' => $setting->website_title,
                'copyright' => Carbon::now()->format('Y') . ' ' .$setting->copyright . ' ' . $setting->website_title . ' ' . 'All rights reserved.',
            ];

            Mail::to($user->email)->send(new UserAdPostMail($details));

        }

        Toastr::success($msg, $msg_title, ["positionClass" => "toast-top-right"]);
        return redirect()->route($this->resp->redirect_to)->with($this->resp->redirect_class, $this->resp->msg);
    }

    public function updatePostProperty(postPropertyRequest $request, $id)
    {
        $setting = setting();
        $check_mobile_number = $this->productModel->checkMobileNumber($request);

        if ($check_mobile_number === false) {
            $msg        = 'Your Mobile number is not valid';
            $msg_title  = 'Invalid Data';
            Toastr::success($msg, $msg_title, ["positionClass" => "toast-top-right"]);
            return redirect()->back()->withInput($request->input());
        }

        $this->resp     = $this->productModel->updatePostProperty($request, $id);
        $msg            = $this->resp->msg;
        $msg_title      = $this->resp->msg_title;

        if (Auth::user()) {
            $user = Auth::user();

            $details = [
                'subject' => 'Message from '. ' ' . $setting->website_title,
                'greeting' => 'Hi ' . $user->name . ', ',
                'body' => 'You updated an ads on '. ' ' .$setting->website_title,
                'email' => 'Your email is : ' . $user->email,
                'thanks' => 'Thank you for using '. ' ' .$setting->website_title,
                'site_url' => route('home'),
                'site_name' => $setting->website_title,
                'copyright' => Carbon::now()->format('Y') . ' ' .$setting->copyright . ' ' . $setting->website_title . ' ' . 'All rights reserved.',
            ];

            Mail::to($user->email)->send(new UserAdPostMail($details));
        }

        Toastr::success($msg, $msg_title, ["positionClass" => "toast-top-right"]);
        return redirect()->route($this->resp->redirect_to)->with($this->resp->redirect_class, $this->resp->msg);
    }
    public function updatePostJob(postJobRequest $request, $id)
    {
        $setting = setting();
        $check_mobile_number = $this->productModel->checkMobileNumber($request);

        if ($check_mobile_number === false) {
            $msg        = 'Your Mobile number is not valid';
            $msg_title  = 'Invalid Data';
            Toastr::success($msg, $msg_title, ["positionClass" => "toast-top-right"]);
            return redirect()->back()->withInput($request->input());
        }

        $this->resp     = $this->productModel->updatePostJob($request, $id);
        $msg            = $this->resp->msg;
        $msg_title      = $this->resp->msg_title;

        if (Auth::user()) {

            $user = Auth::user();

            $details = [
                'subject' => 'Message from '. ' ' . $setting->website_title,
                'greeting' => 'Hi ' . $user->name . ', ',
                'body' => 'You updated an ads on '. ' ' .$setting->website_title,
                'email' => 'Your email is : ' . $user->email,
                'thanks' => 'Thank you for using '. ' ' .$setting->website_title,
                'site_url' => route('home'),
                'site_name' => $setting->website_title,
                'copyright' => Carbon::now()->format('Y') . ' ' .$setting->copyright . ' ' . $setting->website_title . ' ' . 'All rights reserved.',
            ];

            Mail::to($user->email)->send(new UserAdPostMail($details));

        }

        Toastr::success($msg, $msg_title, ["positionClass" => "toast-top-right"]);
        return redirect()->route($this->resp->redirect_to)->with($this->resp->redirect_class, $this->resp->msg);
    }

    public function getMyAds(Request $request)
    {
        $data = array();
        $data['my_ads'] = $this->productModel->getMyAds(Auth::user()->id);
        return view('users.my_ads', compact('data'));
    }

    public function getMyAdDelete($id)
    {
        $setting = setting();
        $this->resp     = $this->productModel->getMyAdDelete($id);
        $msg            = $this->resp->msg;
        $msg_title      = $this->resp->msg_title;

        if (Auth::user()) {

            $user = Auth::user();

            $details = [
                'subject' => 'Message from '. ' ' . $setting->website_title,
                'greeting' => 'Hi ' . $user->name . ', ',
                'body' => 'You ware deleted an ads form '. ' ' .$setting->website_title,
                'email' => 'Your email is : ' . $user->email,
                'thanks' => 'Thank you for using '. ' ' .$setting->website_title,
                'site_url' => route('home'),
                'site_name' => $setting->website_title,
                'copyright' => Carbon::now()->format('Y') . ' ' .$setting->copyright . ' ' . $setting->website_title . ' ' . 'All rights reserved.',
            ];

            Mail::to($user->email)->send(new UserAdPostMail($details));

        }

        $admin = DB::table('auths')->where('id', 1)->first();

        if ($admin) {

            $user = Auth::user();

            $admindetails = [
                'subject' => 'Message from '. ' ' . $setting->website_title,
                'greeting' => 'Hi ' . $admin->username . ', ',
                'body' => $user->name . ' was deleted an ads from '.' '.$setting->website_title,
                'email' => 'His email is : ' . $user->email,
                'thanks' => 'Thank you for using '. ' ' .$setting->website_title,
                'site_url' => route('home'),
                'site_name' => $setting->website_title,
                'copyright' => Carbon::now()->format('Y') . ' ' .$setting->copyright . ' ' . $setting->website_title . ' ' . 'All rights reserved.',
            ];

            Mail::to($admin->email)->send(new UserAdPostAdminGetMail($admindetails));

        }

        Toastr::success($msg, $msg_title, ["positionClass" => "toast-top-right"]);

        return redirect()->route($this->resp->redirect_to)->with($this->resp->redirect_class, $this->resp->msg);
    }

    public function getEditAds($id, $subcat_slug =  null)
    {
        $data           = array();
        $this->resp     = $this->productModel->getEditAds($id);
        $data['row']    = $this->resp->data;
        $data['category']       = $this->categoryModel->getCategory();
        $data['subcategory']    = $this->categoryModel->getAllSubCategory();
        if ($subcat_slug == null) {
            return view('ad_post.edit_post_category_selection', compact('data'));
        }

        if ($this->resp->status == true) {

            $subcategory_id                 = $this->resp->data->f_scat_pk_no;
            $category_id                    = $this->resp->data->f_cat_pk_no;
            $brand_id                       = $this->resp->data->f_brand;
            $data['subcat_info']            = $this->categoryModel->getSubCategoryInfo($subcat_slug);
            $data['brand_combo']            = $this->brandModel->getBrandCombo($category_id, 'list');
            $data['model_combo']            = $this->prod_model->getProdModel($brand_id, 'list');
            $data['city_combo']             = $this->cityModel->getCityCombo('list');
            $data['division_combo']         = $this->divisionModel->getDivisionCombo('list');
            if ($this->resp->data->city_division == 'city') {
                $city_divi_col = 'city_pk_no';
            }
            if ($this->resp->data->city_division == 'division') {
                $city_divi_col = 'division_pk_no';
            }
            $data['selected_area_combo']    = Area::where($city_divi_col, $this->resp->data->city_division_pk_no)->pluck('name', 'pk_no');

            $data['product_type_combo']     = ProductType::where('scat_pk_no', request()->get('category'))->pluck('name', 'pk_no');


            if (request()->get('type') == 'property') {
                return view('ad_post.edit_post_property', compact('data'));
            } elseif (request()->get('type') == 'matrimony-services') {
                return view('ad_post.edit_post_matrimony', compact('data'));
            } elseif (request()->get('type') == 'jobs') {
                return view('ad_post.edit_post_job', compact('data'));
            } else {
                return view('ad_post.edit_post', compact('data'));
            }
        } else {
            $msg            = $this->resp->msg;
            $msg_title      = $this->resp->msg_title;
            Toastr::success($msg, $msg_title, ["positionClass" => "toast-top-right"]);
            return redirect()->route($this->resp->redirect_to)->with($this->resp->redirect_class, $this->resp->msg);
        }
    }


    public function getDeleteImage($id)
    {
        $this->resp = $this->productModel->deleteImage($id);
        return response()->json($this->resp);
    }



    public function getProductModel($brand_id)
    {
        $prod_model = $this->prod_model->getProdModel($brand_id);
        return response()->json($prod_model);
    }


    public function test()
    {
        return view('ad_post.old_ad_post');
    }
    public function adExpired($id)
    {
        $ads = DB::table('prd_master')->where('pk_no', $id)->first();
        return view('users.ad_expired', compact('ads'));
    }
    public function expiredUpdate(Request $request)
    {
        DB::table('prd_master')->where('pk_no', $request->ad_id)->update(['is_delete' => $request->is_delete]);
        Toastr::success('Update Successfully :-)', 'Success');
        return redirect()->route('my-ads');
    }
}
