<?php

namespace App;

use App\Models\Customer;
use Illuminate\Database\Eloquent\Model;

class Review extends Model
{
    public function reviewBy()
    {
        return $this->hasOne(Customer::class, 'id', 'user_id');
    }
}
