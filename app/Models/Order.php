<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    protected $table  = 'orders';

    public function product()
    {
        return $this->hasOne(Product::class, 'pk_no', 'product_id');
    }
    public function user()
    {
        return $this->hasOne(Customer::class, 'id', 'user_id');
    }
    public function seller()
    {
        return $this->hasOne(Customer::class, 'id', 'seller_id');
    }
}
