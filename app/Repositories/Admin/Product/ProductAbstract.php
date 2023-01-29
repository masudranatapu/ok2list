<?php
namespace App\Repositories\Admin\Product;

use DB;
use Auth;
use File;
use Auth as MyInfo;
use App\Models\AuthRole;
use App\Models\Customer;
use App\Models\UserGroup;
use App\Models\ProdImgLib;
use App\Traits\RepoResponse;
use App\Models\ProductVariant;
use App\Models\AdminUser as User;
use App\Models\Product as Product;
use Illuminate\Broadcasting\Channel;
use Illuminate\Support\Facades\Notification;
use App\Notifications\UserPostAdNotification;
use App\Repositories\Admin\Auth\AuthAbstract;

class ProductAbstract implements ProductInterface
{
    use RepoResponse;

    protected $user;
    protected $auth;
    protected $auth_role;

    public function __construct(User $user, AuthRole $auth_role, AuthAbstract $auth)
    {
        $this->user = $user;
        $this->auth = $auth;
        $this->auth_role = $auth_role;
    }

    public function getPaginatedList($request)
    {


        if($request->ad_promotion_type == 'Top'){
            $data = Product::where('promotion', 'Top')->orderBy('is_active','desc')->get();
        }elseif($request->ad_promotion_type == 'Feature'){
            $data = Product::where('promotion', 'Feature')->orderBy('is_active','desc')->get();
        }elseif($request->ad_promotion_type == 'Urgent'){
            $data = Product::where('promotion', 'Urgent')->orderBy('is_active','desc')->get();
        }elseif($request->ad_promotion_type == 'Basic'){
            $data = Product::where('promotion', 'Basic')->orderBy('is_active','desc')->get();
        }else{
            $data = Product::orderBy('is_active','desc')->get();
        }

        return $this->formatResponse(true, '', 'admin', $data);
    }

    public function postStore($request)
    {

    }




    public function postUpdate($request, int $id)
    {



        DB::beginTransaction();
        try{
            $product = Product::find($id);
            $check  = Product::where('pk_no', '!=', $id)->where('url_slug',$request->url_slug)->first();
            if(!empty($check)){
                 return $this->formatResponse(false, 'Url slug already existed in the product list !', 'admin.product.list');
            }
        if($request->is_active == '2'){
            $product->comments            = $request->rejected_reason;
        }

        $product->is_active           = $request->is_active;
        $product->is_delete          = $request->is_delete;
        if($request->is_delete == 1){
            $product->deleted_by   = Auth::user()->pk_no;
        }
        $product->url_slug            = $request->url_slug;
        // $product->promotion           = $request->promotion;
        $product->approved_by         = MyInfo::user()->id;
        $product->approved_at         = date('Y-m-d H:i:s');
        $product->update();
        } catch (\Exception $e) {
            DB::rollback();
            return $this->formatResponse(false, 'Unable to update product !', 'admin.product.list');
        }
        DB::commit();

        $product = Product::findOrFail($id);
        $active = $product->is_active;
        if ($active) {
            if ($active == 1) {
                $status = "Activeted";
            } elseif ($active == 2) {
                $status = "Expired";
            } elseif ($active == 3) {
                $status = "Draft";
            } else {
                $status = "Pending";
            }
            $user = Customer::where('id', $product->customer_pk_no)->first();
            $details = [
                'subject' => 'Message from ok2list',
                'greeting' => 'Hi ' . $user->name . ', ',
                'body' => $user->name . ' your posted ads status is now '. $status,
                'email' => 'Your email is : ' . $user->email,
                'thanks' => 'Thank you and stay with ok2list.lk',
            ];

            Notification::send($user, new UserPostAdNotification($details));
            // Notification::route('mail', $user->email)->notify(new UserPostAdNotification($details));
        }


        if ($request->is_delete == 1) {
            $user = Customer::find($product->customer_pk_no);
            $details = [
                'subject' => 'Message from ok2list',
                'greeting' => 'Hi ' . $user->name . ', ',
                'body' => $user->name . ' your posted ads was delete by ok2list authority. The resion is ' . $request->rejected_reason . ' Please ads a post with our trams and condition.',
                'email' => 'Your email is : ' . $user->email,
                'thanks' => 'Thank you and stay with ok2list.lk',
            ];
            Notification::send($user, new UserPostAdNotification($details));
           // Notification::route('mail', $user->email)->notify(new UserPostAdNotification($details));
        }

        return $this->formatResponse(true, 'Product updated successfully !', 'admin.product.list');
    }

    public function getShow(int $id)
    {

        $data =  Product::find($id);

        if (!empty($data)) {
            return $this->formatResponse(true, '', 'admin.product.edit', $data);
        }

        return $this->formatResponse(false, 'Did not found data !', 'admin.product.list', null);
    }
    /*

    public function postUrlSlugUpdate($request)
    {

        DB::beginTransaction();

        try {
            $product = Product::find($request->prod_pk_no);

            $check  = Product::where('pk_no', '!=', $product->pk_no)->where('url_slug',$request->q)->first();
            if(!empty($check)){
                 return $this->formatResponse(false, 'Url slug already existed in the product list !', 'admin.product.list');
            }

            $product->url_slug = $request->q;
            $product->update();

        } catch (\Exception $e) {


            DB::rollback();
            return $this->formatResponse(false, 'Unable to update url slug !', 'admin.product.list');

        }
        DB::commit();

        return $this->formatResponse(true, 'Url slug updated successfully !', 'admin.product.list');
    }
    */

    public function delete(int $id)
    {
        $data =  Product::find($id);

        $data->delete();
        return $this->formatResponse(true, 'Product deleted successfully !', 'admin.product.list');

    }

    public function getSearchList($request)
    {

    }


    public function deleteImage(int $id)
    {

    }



    public function postStoreProductVariant($request)
    {

    }


    public function postUpdateProductVariant($request, int $id)
    {

    }




}
