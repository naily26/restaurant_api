<?php

namespace App\Http\Controllers;

use App\Models\sales;
use App\Models\cart;
use App\Models\cart_detail;
use App\Models\product;
use App\Models\variant_product;
use Illuminate\Http\Request;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller;

class SalesController extends Controller
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
        $data = sales::all();
        foreach ($data as $key => $value) {
           $cart = cart::where('sales_id', $value->id)->get();
           $cart_arr = [];
           foreach ($cart as $key2 => $item) {
            $detail = cart_detail::where('cart_id', $item->id)->get();
            $product = product::select('name', 'price')->where('id', $item->product_id)->first();
            $product->qty = $item->qty;
            $product->product_id = $item->product_id;
            $cart_arr[$key2] = $product;
            $variant_arr = [];
            foreach ($detail as $key3 => $det) {
                $variant = variant_product::select('variant_name', 'additional_price')->where('id', $det->variant_product_id)->first();
                $variant_arr[$key3] = $variant;
            }
            $cart_arr[$key2]->variant =  $variant_arr;
            $value->cart = $cart_arr;
           }
           
        }
        return response()->json([
            'message' => 'successfully',
            'data' => $data
        ]);
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

        $sale = sales::create([
            'payment_method' => $request->payment_method,
            'created_at' => Carbon::now()
        ]);

        $total = 0;
        foreach ($request->product_id as $key => $value) {
            $cart = cart::create([
                'sales_id' => $sale->id,
                'product_id' => $value,
                'qty' => $request->qty[$key]
            ]);
            $price = product::where('id', $cart->product_id)->first();
            $total += ($price->price * $cart->qty);
            if(isset($request->variant_product_id[$key])) {
                $var = $request->variant_product_id[$key];
                foreach ($var as $num => $value) {
                    $detail = cart_detail::create([
                        'cart_id' => $cart->id,
                        'variant_product_id' => $value
                    ]);
                    $price2 = variant_product::where('id', $detail->variant_product_id)->first();
                    $total += $price2->additional_price;
                }
                
            }
        }
        $sale->total_price = $total;
        $sale->save();

        return response()->json([
            'message' => ' created successfully',
            'data' => $sale
        ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(sales $sales)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(sales $sales)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, sales $sales)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        //
    }
}
