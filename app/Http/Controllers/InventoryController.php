<?php

namespace App\Http\Controllers;

use App\Models\inventory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller;

class InventoryController extends Controller
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
        $data = inventory::all();
        if(!$data->isEmpty()) {
            return response()->json([
                'message' => 'successfully',
                'data' => $data
            ]);
        } else {
            return response()->json([
                'message' => 'failed',
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
            'name' => 'required|string|max:255',
            'price' => 'required|integer',
            'amount' => 'required|integer',
            'unit' => 'required|string|max:255',
        ]);

        $inv = inventory::create([
            'name' => $request->name,
            'price' => $request->price,
            'amount' => $request->amount,
            'unit' => $request->unit,
        ]);

        return response()->json([
            'message' => ' created successfully',
            'data' => $inv
        ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(inventory $inventory)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(inventory $inventory)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'price' => 'required|integer',
            'amount' => 'required|integer',
            'unit' => 'required|string|max:255',
        ]);
        $data = inventory::where('id', $id)->first();
        $data->update($request->all());

        if($data) {
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
        $data = inventory::find($id);
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
