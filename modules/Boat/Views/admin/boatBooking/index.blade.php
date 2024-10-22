@extends('admin.layouts.app')
@section('content')

    <div class="container-fluid">
        <div class="d-flex justify-content-between mb20">
            <h1 class="title-bar">Boat Booking List</h1>

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
                                    <th>Booking Id</th>
                                    <th>Boat</th>
                                    <th>Destination</th>
                                    <th>User</th>
                                    <th>Booked Date</th>
                                    <th>Booking Status</th>
                                    <th>Payment Status</th>
                                    <th class="text-center">Action</th>

                                </tr>
                            </thead>
                            <tbody>
                                @if ($boatBookings->count() > 0)
                                    @foreach ($boatBookings as $key => $row)
                                        <tr class="">
                                            <td>{{ $key + 1 }}</td>
                                            <td>{{ $row->booking_id ?? 'N/A' }}</td>
                                            <td>{{ $row->boat->title ?? 'N/A' }}</td>
                                            <td>{{ $row->boat->destination->title ?? 'N/A' }}</td>
                                            <td>{{ $row->user->name ?? 'N/A' }}</td>
                                            <td>{{ $row->booked_date ?? 'N/A' }}</td>
                                            <td>{{ $row->booking_status ?? 'N/A' }}</td>
                                            <td>{{ $row->payment_status ?? 'N/A' }}</td>
                                            <td class="text-center">
                                                <a href="{{ route('booking.admin.view', $row->id) }}"
                                                    class="btn btn-primary"><i class="fa fa-eye"></i>View</a>
                                                <a href="{{ route('booking.admin.printInvoice', $row->id) }}"
                                                    class="btn btn-secondary"><i class="fa fa-eye"></i>Print</a>
                                                <a href="{{ route('booking.admin.delete', $row->id) }}"
                                                    class="btn btn-danger"><i class="fa fa-trash"></i>delete</a>
                                            </td>
                                        </tr>
                                    @endforeach
                                @else
                                    <tr>
                                        <td colspan="7">{{ __('No boat Booking found') }}</td>
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
