<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class product extends Model
{
    use HasFactory;
    protected $table = 'products';
    protected $fillable = [
        'name',
        'description',
        'price'
    ];
    /**
     * The variant_product that belong to the product
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     */
    public function variant_product(): BelongsToMany
    {
        return $this->belongsToMany(variant_product::class, 'variant_product_table', 'id', 'product_id');
    }
}
