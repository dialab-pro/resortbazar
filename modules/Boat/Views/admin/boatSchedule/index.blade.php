@extends('admin.layouts.app')
@section('content')
    <div class="container-fluid">
        <div class="d-flex justify-content-between mb20">
            <h1 class="title-bar">Boat Schedules List</h1>
            <div class="title-actions">
                <a href="{{ route('schedule.admin.create') }}" class="btn btn-primary">{{ __('Add New Schedule') }}</a>
            </div>
        </div>
        @include('admin.message')

        <div class="text-right">
            <p><i>{{ __('Found :total items', ['total' => 'eikhaen total hobe']) }}</i></p>
        </div>
        <div class="panel">
            <div class="panel-body">
                <form action="" class="bravo-form-item">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>SL.</th>
                                    <th>Boat</th>

                                    <th class="text-center">Action</th>

                                </tr>
                            </thead>
                            <tbody>
                                @if ($schedules->count() > 0)
                                    @foreach ($schedules as $key => $row)
                                        <tr class="">
                                            <td>{{ $key + 1 }}</td>
                                            <td>{{ $row->boat->title ?? 'N/A' }}</td>


                                            <td class="text-center">
                                                <a href="{{ route('schedule.admin.edit', $row->id) }}"
                                                    class="btn btn-primary"><i class="fa fa-edit"></i>edit</a>
                                                <a href="{{ route('schedule.admin.delete', $row->id) }}"
                                                    class="btn btn-danger"><i class="fa fa-trash"></i>delete</a>
                                            </td>
                                        </tr>
                                    @endforeach
                                @else
                                    <tr>
                                        <td colspan="7">{{ __('No boat Schedule found') }}</td>
                                    </tr>
                                @endif
                            </tbody>
                        </table>
                    </div>
                </form>
                {{-- {{ $rows->appends(request()->query())->links() }} --}}
            </div>
        </div>
    </div>
@endsection
