<?php

namespace App\Http\Controllers\Backend\Setup;

use App\Http\Controllers\Controller;
use App\Models\StudentClass;
use Illuminate\Http\Request;

class StudentClassController extends Controller
{
    public function StudentClassView(){
        $allclasses = StudentClass::all();
        return view('backend.setup.student_class.index',compact('allclasses'));
    }

    public function StudentClassAdd(){
        return view('backend.setup.student_class.create');
    }

    public function StudentClassStore(Request $request){
        $validate_data = $request->validate([
            'name'=>'required|unique:student_classes,name',
        ]);
        StudentClass::create($request->all());

        $notification = array(
            'message'=>'Student Class Inserted Successfully',
            'alert-type' => 'success',
        );
        return redirect()->route('student.class.view')->with($notification);
    }

    public function StudentClassEdit($id){
        $edit_class = StudentClass::find($id);
        return view('backend.setup.student_class.edit', compact('edit_class'));
    }

    public function StudentClassUpdate(Request $request, $id){
        $edit_class = StudentClass::find($id);

        $validate_data = $request->validate([
            'name'=>'required|unique:student_classes,name,'.$edit_class->id,
        ]);
        $edit_class->name = $request->name;
        $edit_class->save();

        $notification = array(
            'message'=>'Student Class Updated Successfully',
            'alert-type' => 'info',
        );
        return redirect()->route('student.class.view')->with($notification);
    }

    public function StudentClassDelete($id){
        StudentClass::find($id)->delete();

        $notification = array(
            'message'=>'Student Class deleted Successfully',
            'alert-type' => 'warning',
        );
        return redirect()->route('student.class.view')->with($notification);
    }

}
