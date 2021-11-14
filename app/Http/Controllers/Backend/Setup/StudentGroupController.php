<?php

namespace App\Http\Controllers\Backend\Setup;

use App\Http\Controllers\Controller;
use App\Models\StudentGroup;
use Illuminate\Http\Request;

class StudentGroupController extends Controller
{
    public function StudentGroupView(){
        $allgroups = StudentGroup::all();
        return view('backend.setup.student_group.index',compact('allgroups'));
    }

    public function StudentGroupAdd(){
        return view('backend.setup.student_group.create');
    }

    public function StudentGroupStore(Request $request){
        $validate_data = $request->validate([
            'name'=>'required|unique:student_groups,name',
        ]);
        StudentGroup::create($request->all());

        $notification = array(
            'message'=>'Student Group Inserted Successfully',
            'alert-type' => 'success',
        );
        return redirect()->route('student.group.view')->with($notification);
    }

    public function StudentGroupEdit($id){
        $edit_group = StudentGroup::find($id);
        return view('backend.setup.student_group.edit', compact('edit_group'));
    }

    public function StudentGroupUpdate(Request $request, $id){
        $edit_group = StudentGroup::find($id);

        $validate_data = $request->validate([
            'name'=>'required|unique:student_groups,name,'.$edit_group->id,
        ]);
        $edit_group->name = $request->name;
        $edit_group->save();

        $notification = array(
            'message'=>'Student Group Updated Successfully',
            'alert-type' => 'info',
        );
        return redirect()->route('student.group.view')->with($notification);
    }

    public function StudentGroupDelete($id){
        StudentGroup::find($id)->delete();

        $notification = array(
            'message'=>'Student Group deleted Successfully',
            'alert-type' => 'warning',
        );
        return redirect()->route('student.group.view')->with($notification);
    }
}

