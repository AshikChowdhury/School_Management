<?php

namespace App\Http\Controllers\Backend\Setup;

use App\Http\Controllers\Controller;
use App\Models\StudentYear;
use Illuminate\Http\Request;

class StudentYearController extends Controller
{
    public function StudentYearView(){
        $allyears = StudentYear::all();
        return view('backend.setup.student_year.index',compact('allyears'));
    }

    public function StudentYearAdd(){
        return view('backend.setup.student_year.create');
    }

    public function StudentYearStore(Request $request){
        $validate_data = $request->validate([
            'name'=>'required|unique:student_years,name',
        ]);
        StudentYear::create($request->all());

        $notification = array(
            'message'=>'Student Year Inserted Successfully',
            'alert-type' => 'success',
        );
        return redirect()->route('student.year.view')->with($notification);
    }

    public function StudentYearEdit($id){
        $edit_year = StudentYear::find($id);
        return view('backend.setup.student_year.edit', compact('edit_year'));
    }

    public function StudentYearUpdate(Request $request, $id){
        $edit_year = StudentYear::find($id);

        $validate_data = $request->validate([
            'name'=>'required|unique:student_years,name,'.$edit_year->id,
        ]);
        $edit_year->name = $request->name;
        $edit_year->save();

        $notification = array(
            'message'=>'Student Year Updated Successfully',
            'alert-type' => 'info',
        );
        return redirect()->route('student.year.view')->with($notification);
    }

    public function StudentYearDelete($id){
        StudentYear::find($id)->delete();

        $notification = array(
            'message'=>'Student Year deleted Successfully',
            'alert-type' => 'warning',
        );
        return redirect()->route('student.year.view')->with($notification);
    }
}

