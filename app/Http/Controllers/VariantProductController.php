<?php

namespace App\Http\Controllers;

use App\Models\variant_product;
use App\Models\product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller;

class VariantProductController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api');
    }
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $product = product::all();
        foreach ($product as $key => $item) {
            $variant = variant_product::where('product_id', $item->id)->get();
            $item->variant = $variant;
        }
        if(!$product->isEmpty()) {
            return response()->json([
                'message' => 'successfully',
                'data' => $product
            ]);
        } else {
            return response()->json([
                'message' => 'successfully',
                'data' => 'tidak ada data'
            ]);
        }
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'variant_name' => 'required|string|max:255',
            'additional_price' => 'required|integer',
            'product_id' => 'required',
        ]);

        $variant = variant_product::create([
            'product_id' => $request->product_id,
            'variant_name' => $request->variant_name,
            'additional_price' => $request->additional_price,
        ]);

        return response()->json([
            'message' => ' created successfully',
            'data' => $variant
        ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(variant_product $variant_product)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(variant_product $variant_product)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        $request->validate([
            'variant_name' => 'required|string|max:255',
            'additional_price' => 'required|integer',
            'product_id' => 'required',
        ]);
        $data = variant_product::where('id', $id)->first();
        $status = $data->update($request->all());

        if($status) {
            return response()->json([
                'message' => 'successfully edited',
                'data' => $data
            ]);
        } else {
            return response()->json([
                'message' => 'failed edit',
                'data' => $data
            ]);
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $data = variant_product::find($id);
        $status = $data->delete();
        if($status) {
            return response()->json([
                'message' => 'successfully delete',
            ]);
        } else {
            return response()->json([
                'message' => 'failed delete',
            ]);
        }
    }
}
