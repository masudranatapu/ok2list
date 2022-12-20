<?php
namespace App\Repositories\Admin\AdminUser;

use DB;
use File;
use App\Models\Auth;
use App\Models\AuthRole;
use App\Models\AdminUser;
use App\Models\UserGroup;
use App\Traits\RepoResponse;
use App\Models\AdminUser as User;
use Illuminate\Support\Facades\Hash;
use App\Repositories\Admin\Auth\AuthAbstract;

class AdminUserAbstract implements AdminUserInterface
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
        $data = AdminUser::where('user_type','!=',1)
            ->join('auth_role', 'auth_role.auth_id', '=', 'auths.id')
            ->leftJoin ('roles', 'roles.id', '=', 'auth_role.role_id')
            ->leftJoin ('user_groups', 'user_groups.id', '=', 'auth_role.user_group_id')
            ->select('auths.*','user_groups.group_name','roles.role_name')
            ->get();
            // dd($data);

        return $this->formatResponse(true, '', 'admin', $data);
    }

    public function postStore($request)
    {
        DB::beginTransaction();

        try {

            $auth = new AdminUser();
            $auth->first_name = $request->first_name;
            $auth->mobile_no = $request->mobile_no;
            $auth->email = $request->email;
            $auth->last_name = $request->last_name;
            $auth->designation = $request->designation;
            $auth->username = $request->username;
            $auth->gender = $request->gender;
            $auth->can_login = $request->can_login;


            $file_name = 'profile_'. date('dmY'). '_' .time(). '.' . $request->profile_pic->getClientOriginalExtension();
            $request->profile_pic->move(public_path('media/images/profile/'), $file_name);
            $auth->profile_pic_url = url('media/images/profile/'.$file_name);
            $auth->profile_pic = $file_name;
            $auth->status = $request->status;
            $auth->save();

            if($request->user_group != "")
            {
                $userGroup  = UserGroup::where('id',$request->user_group)->first();

                $roleAuth   = new AuthRole();
                $roleAuth->auth_id = $auth->id;
                $roleAuth->role_id = $userGroup->role_id;
                $roleAuth->user_group_id = $request->user_group;
                $roleAuth->save();
            }else{
                $roleAuth = new AuthRole();
                $roleAuth->auth_id = $auth->id;
                $roleAuth->role_id = 0;
                $roleAuth->user_group_id = 0;
                $roleAuth->save();
            }



        } catch (\Exception $e) {
            DB::rollback();
            dd($e);
            return $this->formatResponse(false, 'Unable to create admin user !', 'admin.admin-user');
        }

        DB::commit();

        return $this->formatResponse(true, 'Admin User has been created successfully !', 'admin.admin-user');
    }

    public function postUpdate($request, int $id)
    {
        DB::beginTransaction();

        try {

            // $this->auth->postUpdate($request, $id);

            $auth = AdminUser::where('id', $id)->first();

            $auth->username = $request->username;
            $auth->mobile_no = $request->mobile_no;
            $auth->email = $request->email;
            if($request->password){
                $auth->password = Hash::make($request->password);
            }
            $auth->gender = $request->gender;
            $auth->can_login = $request->can_login;
            $auth->first_name = $request->first_name;
            $auth->last_name = $request->last_name;
            $auth->designation = $request->designation;

            if ($request->profile_pic != '') {

                if(File::exists(public_path('media/images/profile/'.$auth->profile_pic))) {
                    File::delete(public_path('media/images/profile/'.$auth->profile_pic));
                }

                $file_name = 'profile_'. date('dmY'). '_' .time(). '.' . $request->profile_pic->getClientOriginalExtension();
                $request->profile_pic->move(public_path('media/images/profile/'), $file_name);
                $auth->profile_pic_url = url('media/images/profile/'.$file_name);
                $auth->profile_pic = $file_name;
            }

            $auth->status = $request->status;
            $auth->update();

            if($request->user_group  && ($id > 1) )
            {
                $userGroup = UserGroup::where('id',$request->user_group)->first();
                $roleAuth = AuthRole::where('auth_id',$id)->first();
                $roleAuth->role_id = $userGroup->role_id;
                $roleAuth->user_group_id = $request->user_group;
                $roleAuth->update();
            }

            /*$roleAuth = AuthRole::where('Auth_id',$id)->first();
            $roleAuth->role_id = $request->role;
            $roleAuth->update();*/

        } catch (\Exception $e) {
            DB::rollback();
            dd($e);

            return $this->formatResponse(false, 'Unable to update admin user !', 'admin.admin-user');
        }

        DB::commit();

        return $this->formatResponse(true, 'Admin User has been updated successfully !', 'admin.admin-user');

    }

    public function getShow(int $id)
    {
        $data =  AdminUser::select('*')
            // ->join('admin_users as au', 'au.auth_id', '=', 'auths.id')
            // ->join('auth_role', 'auth_role.auth_id', '=', 'auths.id')
            ->where('auths.id', $id)
            ->first();

        //prixt($data,1);

        if (!empty($data)) {
            return $this->formatResponse(true, '', 'admin.admin-user.admin-user', $data);
        }

        return $this->formatResponse(false, 'Did not found data !', 'admin.admin-user', null);
    }

    public function delete(int $id)
    {
        DB::begintransaction();

        try {

            User::where('auth_id', $id)->delete();
            Auth::where('id',$id)->delete();

        } catch (\Exception $e) {
            DB::rollback();

            return $this->formatResponse(false, 'Unable to delete admin user !', 'admin.admin-user');
        }

        DB::commit();

        return $this->formatResponse(true, 'Successfully delete admin user !', 'admin.admin-user');
    }

    public function getSearchList($request)
    {
        $string = trim($request->search_string);
        //exit;
        $data = Auth::where('user_type','!=',1 )
                ->where('auths.email', 'LIKE', '%' . $string . '%')->orWhere('auths.username', 'LIKE', '%' . $string . '%')
            ->join('admin_users', 'admin_users.auth_id', '=', 'auths.id')
            ->join('auth_role', 'auth_role.auth_id', '=', 'auths.id')
            ->leftJoin ('roles', 'roles.id', '=', 'auth_role.role_id')
            ->leftJoin ('user_groups', 'user_groups.id', '=', 'auth_role.USER_GROUP_ID')
            ->select('auths.username','auths.email','auths.mobile_no','auths.can_login','admin_users.first_name','admin_users.last_name','admin_users.designation','admin_users.auth_id','admin_users.profile_pic_url','admin_users.status', 'user_groups.group_name','roles.role_name')->get();
        //prixt($data,1);
        return $this->formatResponse(true, '', 'admin', $data);
    }
}
