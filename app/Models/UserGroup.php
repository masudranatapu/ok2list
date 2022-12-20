<?php

namespace App\Models;

use DB;
use App\Traits\RepoResponse;
use Illuminate\Database\Eloquent\Model;

class UserGroup extends Model
{
    use RepoResponse;
    protected $table = 'user_groups';

    public function role() {
        return $this->belongsTo('App\Models\Role', 'role_id', 'id');
    }


    public function getList()
    {
        return DB::table('user_groups')->pluck('group_name', 'id');
    }


    public function postStore($request)
    {
        DB::beginTransaction();
        try {
            $userGroup = new UserGroup();
            $userGroup->group_name = $request->user_group_name;
            $userGroup->role_id = $request->role;
            $userGroup->status = 1;
            $userGroup->save();

        } catch (\Exception $e) {
            DB::rollback();
            return $this->formatResponse(false, 'Unable to create Admin User Group !', 'admin.user-group');
        }

        DB::commit();
        return $this->formatResponse(true, 'Admin User Group has been created successfully !', 'admin.user-group');

    }


    public function getDelete($id)
    {
        DB::begintransaction();
        try {
            UserGroup::where('id', $id)->delete();
        } catch (\Exception $e) {
            DB::rollback();

            return $this->formatResponse(false, 'Unable to delete admin User Group !', 'admin.user-group');
        }
        DB::commit();

        return $this->formatResponse(true, 'Successfully delete admin User Group !', 'admin.user-group');
    }

    public function getShow($id)
    {
        $data =  UserGroup::find($id);

        if (!empty($data)) {
            return $this->formatResponse(true, '', 'admin.user-group.edit', $data);
        }

        return $this->formatResponse(false, 'Did not found data !', 'admin.user-group', null);
    }


    public function postUpdate($request, int $id)
    {
        DB::beginTransaction();
        try {
            $userGroup = UserGroup::find($id);
            $userGroup->group_name = $request->user_group_name;
            $userGroup->role_id = $request->role;
            $userGroup->status = 1;
            $userGroup->update();

        } catch (\Exception $e) {
            DB::rollback();

            return $this->formatResponse(false, 'Unable to update admin User Group !', 'admin.user-group');
        }

        DB::commit();
        return $this->formatResponse(true, 'Admin User Group has been updated successfully !', 'admin.user-group');

    }



}
