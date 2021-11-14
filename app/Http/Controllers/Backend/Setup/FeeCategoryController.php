<?php

namespace App\Http\Controllers\Backend\Setup;

use App\Http\Controllers\Controller;
use App\Models\FeeCategory;
use App\Models\StudentShift;
use Illuminate\Http\Request;

class FeeCategoryController extends Controller
{
    public function FeeCategoryView(){
        $feecategories = FeeCategory::all();
        return view('backend.setup.fee_category.index',compact('feecategories'));
    }

    public function FeeCategoryAdd(){
        return view('backend.setup.fee_category.create');
    }

    public function FeeCategoryStore(Request $request){
        $validate_data = $request->validate([
            'name'=>'required|unique:fee_categories,name',
        ]);
        FeeCategory::create($request->all());

        $notification = array(
            'message'=>'Fee Category Inserted Successfully',
            'alert-type' => 'success',
        );
        return redirect()->route('fee.category.view')->with($notification);
    }

    public function FeeCategoryEdit($id){
        $edit_fee_category = FeeCategory::find($id);
        return view('backend.setup.fee_category.edit', compact('edit_fee_category'));
    }

    public function FeeCategoryUpdate(Request $request, $id){
        $edit_fee_category = FeeCategory::find($id);

        $validate_data = $request->validate([
            'name'=>'required|unique:fee_categories,name,'.$edit_fee_category->id,
        ]);
        $edit_fee_category->name = $request->name;
        $edit_fee_category->save();

        $notification = array(
            'message'=>'Fee Category Updated Successfully',
            'alert-type' => 'info',
        );
        return redirect()->route('fee.category.view')->with($notification);
    }

    public function FeeCategoryDelete($id){
        FeeCategory::find($id)->delete();

        $notification = array(
            'message'=>'Fee Category deleted Successfully',
            'alert-type' => 'warning',
        );
        return redirect()->route('fee.category.view')->with($notification);
    }
}

