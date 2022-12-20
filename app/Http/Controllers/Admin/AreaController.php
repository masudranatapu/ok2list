<?php

namespace App\Http\Controllers\Admin;

use App\Models\Area;
use App\Models\City;
use App\Models\Division;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\BaseController;
use App\Http\Requests\Admin\AreaRequest;

use Illuminate\Support\Facades\Redirect;
use App\Repositories\Admin\Area\AreaInterface;

class AreaController extends BaseController
{
    
    protected $city;
    protected $division;
    protected $areaInt;
     
    public function __construct(AreaInterface $areaInt, City $city, Division $division)
     {
         $this->areaInt     = $areaInt;
         $this->city        = $city;
         $this->division    = $division;

     }

    public function getIndex(Request $request)
    {
        $this->resp = $this->areaInt->getPaginatedList($request, 100000);
        return view('admin.area.index')->withRows($this->resp->data);
       

    }

    public function getCreate() {
        $data                   = array(); 
        $data['city_combo']     = $this->city->getCityCombo();  
        $data['division_combo'] = $this->division->getDivisionCombo();  
        return view('admin.area.create')->withData($data);
    }

     public function postStore(AreaRequest $request) {

        $this->resp = $this->areaInt->postStore($request);
        return redirect()->back()->with($this->resp->redirect_class, $this->resp->msg);
     }

     public function getEdit(Request $request, $id){
        
        $data                   = array();
        $data['city_combo']     = $this->city->getCityCombo();  
        $data['division_combo'] = $this->division->getDivisionCombo();
        $this->resp             = $this->areaInt->findOrThrowException($id);
        $data['data']           = $this->resp->data;

        return view('admin.area.edit', compact('data'));

     }

    public function postUpdate(AreaRequest $request, $id)
    {
        $this->resp = $this->areaInt->postUpdate($request, $id);
        return redirect()->back()->with($this->resp->redirect_class, $this->resp->msg);
    }

    public function getDelete($pk_no)
    {
        // $this->resp = $this->areaInt->delete($id);
        // return redirect()->back()->with($this->resp->redirect_class, $this->resp->msg);
        $checkExistence =  DB::table('prd_master')->where('area_id', $pk_no)->count();
        // dd($checkExistence);
        
        if ($checkExistence > 0){
            return Redirect::back()->with('flashMessageWarning', 'Can not be deleted');
        }else{
            Area::where('pk_no', $pk_no)->delete();
            return redirect()->back()->with('flashMessageSuccess', 'Deleted successfully');
        }
    }


}
