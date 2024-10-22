@extends('admin.layouts.app')
@section('content')
    <div class="container-fluid">
        <div class="d-flex justify-content-between mb20">
            <h1 class="title-bar">{{ !empty($boatDestinations) ? __('Destination') : __('All Destinations') }}</h1>
            <div class="title-actions">
                @if (empty($recovery))
                    <a href="{{ route('boat.admin.destinationCreate') }}"
                        class="btn btn-primary">{{ __('Add new Destination') }}</a>
                @endif
            </div>
        </div>
        @include('admin.message')
        <div class="filter-div d-flex justify-content-between ">
            <div class="col-left">
                @if (!empty($rows))
                    <form method="post" action="{{ route('boat.admin.bulkEdit') }}"
                        class="filter-form filter-form-left d-flex justify-content-start">
                        {{ csrf_field() }}
                        <select name="action" class="form-control">
                            <option value="">{{ __(' Bulk Actions ') }}</option>

                            @if (!empty($boatDestinations))
                                <option value="edit">{{ __(' Edit ') }}</option>
                                <option value="delete">{{ __(' Delete ') }}</option>
                            @endif
                        </select>
                        <button data-confirm="{{ __('Do you want to delete?') }}"
                            class="btn-info btn btn-icon dungdt-apply-form-btn" type="button">{{ __('Apply') }}</button>
                    </form>
                @endif
            </div>

        </div>
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
                                    <th>Image</th>
                                    <th>Banner Image</th>
                                    <th> {{ __('Title') }}</th>
                                    <th width="200px"> {{ __('Slug') }}</th>
                                    <th width="130px"> {{ __('status') }}</th>
                                    <th width="130px"> {{ __('Date') }}</th>
                                    <th class="text-center">Action</th>

                                </tr>
                            </thead>
                            <tbody>
                                @if ($boatDestinations->count() > 0)
                                    @foreach ($boatDestinations as $key => $row)
                                        <tr class="{{ $row->status }}">
                                            <td>{{ $key + 1 }}</td>
                                            <td>
                                                <img src="{{ asset($row->image) }}" height="50px" width="50px"
                                                    alt="">
                                            </td>
                                            <td>
                                                <img src="{{ asset($row->banner_image ?? 'images/avatar.png') }}" alt="" height="50px" width="100px">
                                            </td>
                                            <td class="title">
                                                {{ $row->title ?? 'N/A' }}

                                            </td>
                                            <td class="title">
                                                {{ $row->slug ?? 'N/A' }}

                                            </td>



                                            <td><span class="badge badge-{{ $row->status }}">{{ $row->status }}</span>
                                            </td>

                                            <td>{{ display_date($row->updated_at) }}</td>
                                            <td class="text-center">
                                                <a href="{{ route('boat.admin.destinationEdit', $row->id) }}"
                                                    class="btn btn-primary"><i class="fa fa-edit"></i>edit</a>
                                                <a href="{{ route('boat.admin.destinationDelete', $row->id) }}"
                                                    class="btn btn-danger"><i class="fa fa-trash"></i>delete</a>
                                            </td>
                                        </tr>
                                    @endforeach
                                @else
                                    <tr>
                                        <td colspan="7">{{ __('No boat found') }}</td>
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
