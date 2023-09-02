<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class variant_product extends Model
{
    use HasFactory;
    protected $table = 'variant_products';
    protected $fillable = [
        'product_id',
        'variant_name',
        'additional_price'
    ];

    /**
     * Get the product that owns the variant_product
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function product(): BelongsTo
    {
        return $this->belongsTo(product::class, 'product_id', 'id');
    }
}
