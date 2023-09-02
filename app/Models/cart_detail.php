<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class cart_detail extends Model
{
    use HasFactory;
    protected $table = 'cart_details';
    protected $fillable = [
        'cart_id',
        'variant_product_id'
    ];
}
