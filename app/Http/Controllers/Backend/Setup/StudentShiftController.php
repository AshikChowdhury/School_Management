<?php

namespace App\Http\Controllers\Backend\Setup;

use App\Http\Controllers\Controller;
use App\Models\StudentShift;
use Illuminate\Http\Request;

class StudentShiftController extends Controller
{
    public function StudentShiftView(){
        $allshifts = StudentShift::all();
        return view('backend.setup.student_shift.index',compact('allshifts'));
    }

    public function StudentShiftAdd(){
        return view('backend.setup.student_shift.create');
    }

    public function StudentShiftStore(Request $request){
        $validate_data = $request->validate([
            'name'=>'required|unique:student_shifts,name',
        ]);
        StudentShift::create($request->all());

        $notification = array(
            'message'=>'Student Shift Inserted Successfully',
            'alert-type' => 'success',
        );
        return redirect()->route('student.shift.view')->with($notification);
    }

    public function StudentShiftEdit($id){
        $edit_shift = StudentShift::find($id);
        return view('backend.setup.student_shift.edit', compact('edit_shift'));
    }

    public function StudentShiftUpdate(Request $request, $id){
        $edit_shift = StudentShift::find($id);

        $validate_data = $request->validate([
            'name'=>'required|unique:student_shifts,name,'.$edit_shift->id,
        ]);
        $edit_shift->name = $request->name;
        $edit_shift->save();

        $notification = array(
            'message'=>'Student Shift Updated Successfully',
            'alert-type' => 'info',
        );
        return redirect()->route('student.shift.view')->with($notification);
    }

    public function StudentShiftDelete($id){
        StudentShift::find($id)->delete();

        $notification = array(
            'message'=>'Student Shift deleted Successfully',
            'alert-type' => 'warning',
        );
        return redirect()->route('student.shift.view')->with($notification);
    }
}

