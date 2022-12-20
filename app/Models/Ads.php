<?php

namespace App\Models;

use DB;
use App\Models\AdDetails;
use App\Traits\RepoResponse;
use Illuminate\Support\Facades\Auth;
use Illuminate\Database\Eloquent\Model;
use Image;

class Ads extends Model
{
    use RepoResponse;

    protected $table        = 'prd_ads';
    protected $primaryKey   = 'pk_no';

    protected $fillable = [
        'pk_no',
        'prd_ad_id',
        'name',
        'is_active',
        'p_name',
        'img',
    ];

    public function postStore($request){
        DB::beginTransaction();
        try {
            $ad             = new Ads;
            $ad->name       = $request->position;
            $ad->is_active  = $request->status;
            $ad->created_by = Auth::user()->pk_no;
            $ad->save();
            $ad_id          = $ad->pk_no;
            // dd($ad);
            if($request->hasFile('photo')) {
                $images = $request->photo;
                foreach ($images as $key => $image) {
                    $detail = new AdDetails();
                    $detail->name = $request->photo_name[$key];
                    $detail->link = $request->link[$key];
                    $detail->prd_ad_id = $ad_id;
                    $detail->is_active = 1;
                    $detail->created_by = Auth::user()->pk_no;
                    $filename = $image->getClientOriginalName();
                    $filename = preg_replace('/\s+/', '-', $filename);
                    $folder = 'uploads/ads';
                    if (!file_exists($folder)) {
                        mkdir($folder, 0777, true);
                    }
                    $user_img = $folder.'/'. time() . '-' . $filename;
                    Image::make($image)->save($user_img);
                    $detail->photo = $user_img;
                    $detail->save();
                }

            }
        } catch (\Exception $e) {
            DB::rollback();
            // dd($e);
            // return redirect()->back()->withErrors($e->getMessage());
            return $this->formatResponse(false, $e->getMessage(), 'site.ads.create');
        }
        DB::commit();
        return $this->formatResponse(true, 'your ad has been created successfully !', 'site.ads');
    }


    public function postUpdate($request,$id){
        DB::beginTransaction();
        try {
            $ad             = Ads::find($id);
            $ad->name       = $request->position;
            $ad->is_active  = $request->status;
            $ad->updated_by = Auth::user()->pk_no;
            $ad->update();

            $ad_id          = $ad->pk_no;
            if($request->hasFile('photo')) {
                $images = $request->photo;
                foreach ($images as $key => $image) {
                    $detail = new AdDetails();
                    $detail->name = $request->photo_name[$key];
                    $detail->link = $request->link[$key];
                    $detail->prd_ad_id = $ad_id;
                    $detail->is_active = 1;
                    $detail->created_by = Auth::user()->pk_no;
                    $filename = $image->getClientOriginalName();
                    $filename = preg_replace('/\s+/', '-', $filename);
                    $folder = 'uploads/ads';
                    if (!file_exists($folder)) {
                        mkdir($folder, 0777, true);
                    }
                    $user_img = $folder.'/'. time() . '-' . $filename;
                    Image::make($image)->save($user_img);
                    $detail->photo = $user_img;
                    // dd($detail);
                    $detail->save();
                }

            }

            if($request->old_photo_name) {
                foreach ($request->old_photo_name as $key => $old_photo_name) {
                    $detail = AdDetails::find($request->photo_id[$key]);
                    $detail->name = $request->old_photo_name[$key];
                    $detail->link = $request->old_link[$key];
                    $detail->prd_ad_id = $ad_id;
                    $detail->is_active = 1;
                    $detail->updated_by = Auth::user()->pk_no;

                    $old_image = $request->old_photo[$key] ?? null;

                    if($old_image){
                        $filename = $old_image->getClientOriginalName();
                        $filename = preg_replace('/\s+/', '-', $filename);
                        $folder = 'uploads/ads';
                        if (!file_exists($folder)) {
                            mkdir($folder, 0777, true);
                        }
                        $user_img = $folder.'/'. time() . '-' . $filename;
                        Image::make($old_image)->save($user_img);
                        $detail->photo = $user_img;
                    }

                    $detail->update();
                }

            }


        } catch (\Exception $e) {
            DB::rollback();
            dd($e);
            return redirect()->back()->withErrors($e->getMessage());
        }
        DB::commit();
        return $this->formatResponse(true, 'your ad has been created successfully !', 'site.ads');
    }

    public function deletePhoto($id){
        DB::beginTransaction();
        try {

            AdDetails::where('pk_no',$id)->delete();

        } catch (\Exception $e) {
            DB::rollback();
            dd($e);
            return redirect()->back()->withErrors($e->getMessage());
        }
        DB::commit();
        return $this->formatResponse(true, 'your ad photo has been deleted successfully !', 'site.ads');
    }
    public function adDelete($id){
        DB::beginTransaction();
        try {

            Ads::where('pk_no',$id)->delete();

        } catch (\Exception $e) {
            DB::rollback();
            dd($e);
            return redirect()->back()->withErrors($e->getMessage());
        }
        DB::commit();
        return $this->formatResponse(true, 'your ad has been deleted successfully !', 'site.ads');
    }


    public function photos() {
        return $this->hasMany('App\Models\AdDetails', 'prd_ad_id')->orderBy('name','ASC');
    }



}
