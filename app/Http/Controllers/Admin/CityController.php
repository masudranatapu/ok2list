<?php

namespace App\Http\Controllers\Admin;

use App\Models\Area;
use App\Models\City;
use App\Models\Country;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use App\Http\Controllers\BaseController;
use App\Http\Requests\Admin\CityRequest;
use Illuminate\Support\Facades\Redirect;
use App\Repositories\Admin\City\CityInterface;
       


class CityController extends BaseController
{
    protected $cityInt;
    protected $city;
    protected $country;

    public function __construct(CityInterface $cityInt, Country $country, City $city)
    {
        $this->cityInt  = $cityInt;
        $this->city     = $city;
        $this->country  = $country;
    }

    public function getIndex(Request $request)
    {
        $data           = array();
        $this->resp     = $this->cityInt->getPaginatedList($request, 100000);
        $data['data']   = $this->resp->data;
        return view('admin.city.index',compact('data'));

    }

    public function getCreate() {
        $data                   = array();
        $data['country_combo']  = $this->country->getCountryCombo();
        return view('admin.city.create',compact('data'));
    }

    public function postStore(CityRequest $request) {

        $this->resp = $this->cityInt->postStore($request);

        return redirect()->route($this->resp->redirect_to)->with($this->resp->redirect_class, $this->resp->msg);
    }

    public function getEdit(Request $request, $id){

        $this->resp = $this->cityInt->findOrThrowException($id);
        $country  = $this->country->getCountryCombo();
        return view('admin.city.edit')->withCity($this->resp->data)->withCountry($country);

    }

    public function postUpdate(CityRequest $request, $id)
    {
        //dd($id);
        $this->resp = $this->cityInt->postUpdate($request, $id);
        //dd($this->resp->data);

    }

    public function getDelete($pk_no)
    {
        // $this->resp = $this->cityInt;
        
        // return redirect()->route($this->redirect_to)->with($this->redirect_class, $this->msg);
        $checkExistence =  DB::table('ss_areas')->where('city_pk_no', $pk_no)->count();
        
        if ($checkExistence > 0){
            return Redirect::back()->with('flashMessageWarning', 'Can not be deleted');
        }else{
            City::destroy($pk_no);
            return redirect()->back()->with('flashMessageSuccess', 'Deleted successfully');
        }
    }

    public function getAreaByLocation($cityOrDivision, $cityOrDivisionId)
    {
        $areas = $this->city->getAreaByLocation($cityOrDivision, $cityOrDivisionId);
        return response()->json($areas);
    }


}
