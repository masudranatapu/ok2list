<?php

namespace App;

use App\Models\Customer;
use App\Models\Package;
use Illuminate\Database\Eloquent\Model;
use Auth;
use App\Product;
class Payments extends Model
{

    protected $table            = 'sls_payments';
    protected $primaryKey       = 'pk_no';
    protected $fillable         = ['customer_pk_no', 'amount','status','validation_on','created_by','expired_on','f_customer_pk_no','f_package_pk_no','validated_on', 'add_limit', 'order_id', 'payment_type'];


    public static function boot()
       {
          parent::boot();
          static::creating(function($model)
          {
              $user = Auth::user();
              if(!empty($user)){
                $model->created_by = $user->id;
              }

          });

          static::updating(function($model)
          {
              $user = Auth::user();
              if(!empty($user)){
                $model->updated_by = $user->id;
              }

          });
      }


public function package(){
  return $this->belongsTo(Package::class,'f_package_pk_no');
}
public function customer(){
  return $this->belongsTo(Customer::class,'f_customer_pk_no');
}






}
