@php
    $translation = $row->translate();
@endphp
@php
    $currentDate = \Carbon\Carbon::now()->startOfDay();
    $discountStartDate = \Carbon\Carbon::parse($row->discount_start_date)->startOfDay();
    $discountEndDate = \Carbon\Carbon::parse($row->discount_end_date)->startOfDay();
    if ($row->discount_amount) {
        if ($currentDate->between($discountStartDate, $discountEndDate)) {
            // dd('milse', $currentDate, $discountStartDate, $discountEndDate);
            $html =
                '<div class="price">
                    <span class="text-price">
                        <del>' .
                $row->display_price .
                '</del> ' .
                $row->after_discount .
                '
                        <span class="unit">' .
                __('/Night') .
                '</span>
                    </span>
                 </div>';
            $discount =
                '
<div class="featured">
    ' .
                __(':discount', [
                    'discount' =>
                        $row->discount_type == 'flat'
                            ? $row->discount_amount . ' taka off'
                            : $row->discount_amount . '% off',
                ]) .
                '
</div>';
        } else {
            $html =
                '<div class="price">
                    <span class="text-price">
                       ' .
                $row->display_price .
                '
                        <span class="unit">' .
                __('/Night') .
                '</span>
                    </span>
                 </div>';

            $discount = '
<div class="featured d-none">

</div>';

            // dd('mile nai', $currentDate, $discountStartDate, $discountEndDate);
        }
    } else {
        $html =
            '<div class="price">
                    <span class="text-price">
                       ' .
            $row->display_price .
            '
                        <span class="unit">' .
            __('/Night') .
            '</span>
                    </span>
                 </div>';
        $discount = '
<div class="featured d-none">

</div>';
    }

@endphp
<div class="item-loop {{ $wrap_class ?? '' }}">
    {{-- @if ($row->is_featured == '1')
        <div class="featured">
            {{ __('Featured') }}
        </div>
    @endif --}}
    {!! $discount !!}
    <div class="thumb-image ">
        <a @if (!empty($blank)) target="_blank" @endif href="{{ $row->getDetailUrl() }}">
            @if ($row->image_url)
                @if (!empty($disable_lazyload))
                    <img src="{{ $row->image_url }}" class="img-responsive" alt="">
                @else
                    {!! get_image_tag($row->image_id, 'medium', ['class' => 'img-responsive', 'alt' => $translation->title]) !!}
                @endif
            @endif
        </a>

        <div class="service-wishlist {{ $row->isWishList() }}" data-id="{{ $row->id }}"
            data-type="{{ $row->type }}">
            <i class="fa fa-heart"></i>
        </div>
    </div>

    <div class="location">
        <i class="fa fa-location-arrow"></i>
        @if (!empty($row->location->name))
            @php $location =  $row->location->translate() @endphp
            {{ $location->name ?? '' }}
        @endif
    </div>




    <div class="item-title">
        <a @if (!empty($blank)) target="_blank" @endif href="{{ $row->getDetailUrl() }}">
            @if ($row->is_instant)
                <i class="fa fa-bolt d-none"></i>
            @endif
            {{ $translation->title }}
        </a>
        @if ($row->discount_percent)
            <div class="sale_info">{{ $row->discount_percent }}</div>
        @endif
    </div>



    @if ($row->star_rate)
        <div class="star-rate">
            <div class="list-star">
                <ul class="booking-item-rating-stars">
                    @for ($star = 1; $star <= $row->star_rate; $star++)
                        <li><i class="fa fa-star"></i></li>
                    @endfor
                </ul>
            </div>
        </div>
    @endif
    @if (setting_item('hotel_enable_review'))
        <?php
        $reviewData = $row->getScoreReview();
        $score_total = $reviewData['score_total'];
        ?>

        <div class="service-review">
            <span class="rate">
                @if ($reviewData['total_review'] > 0)
                    {{ $score_total }}
                @endif <span>({{ $reviewData['total_review'] }})</span>
            </span>
            {{-- <span class="review">
                @if ($reviewData['total_review'] > 1)
                    {{ __(":number Reviews",["number"=>$reviewData['total_review'] ]) }}
                @else
                    {{ __(":number Review",["number"=>$reviewData['total_review'] ]) }}
                @endif
            </span> --}}
        </div>
    @endif


    {{-- @dd($row->display_price, $row); --}}
    <div class="info">
        <div class="g-price">
            {{-- <div class="prefix">
                <span class="fr_text">{{__("from")}}</span>
            </div> --}}

            {!! $html !!}
        </div>

        <div class="g-price">
            <a @if (!empty($blank)) target="_blank" @endif href="{{ $row->getDetailUrl() }}"
                class="btn btn-default">
                Book Trip
            </a>
        </div>

    </div>
</div>
