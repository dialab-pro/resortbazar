@extends('admin.layouts.app')
@section('content')
    <div class="container-fluid">
        <div class="d-flex justify-content-between mb20">
            <h1 class="title-bar">Boat Cabin</h1>
            <div class="title-actions">
                <a href="{{ route('boatCabin.admin.create') }}" class="btn btn-primary">{{ __('Add New Cabin') }}</a>
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
                                    <th>Boat Name</th>
                                    <th>Cabin Name</th>
                                    <th>Cabin slug</th>
                                    <th>Cabin Type</th>
                                    <th>Price</th>
                                    <th class="text-center">Action</th>

                                </tr>
                            </thead>
                            <tbody>
                                @if ($boatCabins->count() > 0)
                                    @foreach ($boatCabins as $key => $row)
                                        <tr class="">
                                            <td>{{ $key + 1 }}</td>
                                            <td>{{ $row->boat->title ?? 'N/A' }}</td>
                                            <td class="title">
                                                {{ $row->title ?? 'N/A' }}
                                            </td>
                                            <td class="title">
                                                {{ $row->slug ?? 'N/A' }}
                                            </td>
                                            <td>{{ $row->type ?? 'N/A' }}</td>
                                            <td>{{ $row->price ?? 'N/A' }}</td>
                                            <td class="text-center">
                                                <a href="{{ route('boatCabin.admin.edit', $row->id) }}"
                                                    class="btn btn-primary"><i class="fa fa-edit"></i>edit</a>
                                                <a href="{{ route('boatCabin.admin.delete', $row->id) }}"
                                                    class="btn btn-danger"><i class="fa fa-trash"></i>delete</a>
                                            </td>
                                        </tr>
                                    @endforeach
                                @else
                                    <tr>
                                        <td colspan="7">{{ __('No boat Cabin found') }}</td>
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
