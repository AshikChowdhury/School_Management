@extends('admin.admin_master')

@section('admin')
<!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
            <div class="container-full">
                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <div class="col-12">
                            <div class="box">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Student Year List</h3>
                                    <a class="btn btn-rounded btn-success mb-5 float-right" href="{{route('student.year.add')}}">Add Student Year</a>
                                </div>
                                <!-- /.box-header -->
                                <div class="box-body">
                                    <div class="table-responsive">
                                        <table id="example1" class="table table-bordered table-striped">
                                            <thead>
                                            <tr>
                                                <th width="5%">SL</th>
                                                <th>Year</th>
                                                <th width="25%">Action</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            @foreach($allyears as $year)
                                            <tr>
                                                <td>{{ $loop->iteration}}</td>
                                                <td>{{$year->name}}</td>
                                                <td>
                                                    <a class="btn btn-info" href="{{route('student.year.edit', $year->id)}}">Edit</a>
                                                    <a class="btn btn-danger" id="delete" href="{{route('student.year.delete', $year->id)}}">Delete</a>
                                                </td>
                                            </tr>
                                             @endforeach
                                            </tbody>
                                            <tfoot>

                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
                                <!-- /.box-body -->
                            </div>
                            <!-- /.box -->
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->
                </section>
                <!-- /.content -->

            </div>
        </div>
<!-- /.content-wrapper -->
@endsection
