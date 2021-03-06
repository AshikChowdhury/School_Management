@extends('admin.admin_master')

@section('admin')
<!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
            <div class="container-full">
                <section class="content">
                    <!-- Basic Forms -->
                    <div class="box">
                        <div class="box-header with-border">
                            <h4 class="box-title">Add User</h4>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <div class="row">
                                <div class="col">
                                    <form method="POST" action="{{route('user.update', $user->id)}}">
                                        @csrf
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <h5>User Role<span class="text-danger">*</span></h5>
                                                            <div class="controls">
                                                                <select name="usertype" id="select" required="" class="form-control">
                                                                    <option value="" selected="" disabled="">Select Role</option>
                                                                    <option value="Admin" {{$user->usertype == "Admin" ? "selected" : ""}}>Admin</option>
                                                                    <option value="User" {{$user->usertype == "User" ? "selected" : ""}}>User</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <h5>User Name <span class="text-danger">*</span></h5>
                                                            <div class="controls">
                                                                <input type="text" name="name" class="form-control" value="{{$user->name}}" required="">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <h5>User Email<span class="text-danger">*</span></h5>
                                                            <div class="controls">
                                                                <input type="email" name="email" class="form-control" value="{{$user->email}}" required="">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="text-xs-right">
                                            <input class="btn btn-rounded btn-info" type="submit" value="Update">
                                        </div>
                                    </form>

                                </div>
                                <!-- /.col -->
                            </div>
                            <!-- /.row -->
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->

                </section>
            </div>
        </div>
<!-- /.content-wrapper -->
@endsection
