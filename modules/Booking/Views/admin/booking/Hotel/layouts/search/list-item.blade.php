<div class="row">

    <div class="col-lg-12 col-md-12">
        <div class="bravo-list-item">
            <div class="topbar-search">
                <h2 class="text result-count">
                    @if($rows->total() > 1)
                        {{ __(":count hotels found",['count'=>$rows->total()]) }}
                    @else
                        {{ __(":count hotel found",['count'=>$rows->total()]) }}
                    @endif
                </h2>
            </div>

            <div class="ajax-search-result">
                @include('Booking::admin.booking.Hotel.ajax.search-result')
            </div>

        </div>
    </div>


</div>
