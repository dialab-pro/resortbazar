@php
    $translation = $row->translate();
@endphp
<div class="item-loop item-loop-wrap {{$wrap_class ?? ''}}">

    @if($row->is_featured == "1")
        <div class="featured">
            {{__("Featured")}}
        </div>
    @endif
    <div class="thumb-image ">
        <a @if(!empty($blank)) target="_blank" @endif href="{{$row->getDetailUrl($include_param ?? true)}}">
            @if($row->image_url)
                @if(!empty($disable_lazyload))
                    <img src="{{$row->image_url}}" class="img-responsive" alt="">
                @else
                    {!! get_image_tag($row->image_id,'medium',['class'=>'img-responsive','alt'=>$row->title]) !!}
                @endif
            @endif
        </a>
        <div class="service-wishlist {{$row->isWishList()}}" data-id="{{$row->id}}" data-type="{{$row->type}}">
            <i class="fa fa-heart-o"></i>
        </div>
    </div>
    <div class="item-title">
        <a @if(!empty($blank)) target="_blank" @endif href="{{$row->getDetailUrl($include_param ?? true)}}">
            @if($row->is_instant)
                <i class="fa fa-bolt d-none"></i>
            @endif
                {{$translation->title}}
        </a>
        @if($row->discount_percent)
            <div class="sale_info">{{$row->discount_percent}}</div>
        @endif
    </div>
    <div class="location">
        @if(!empty($row->location->name))
            @php $location =  $row->location->translate() @endphp
            {{$location->name ?? ''}}
        @endif
    </div>


    @if($row->star_rate)
        <div class="star-rate">
            <div class="list-star">
                <ul class="booking-item-rating-stars">
                    @for ($star = 1 ;$star <= $row->star_rate ; $star++)
                        <li><i class="fa fa-star"></i></li>
                    @endfor
                </ul>
            </div>
        </div>
    @endif

    @if(setting_item('car_enable_review'))
        <?php
            $reviewData = $row->getScoreReview();
            // $statsData = $row->getReviewStats();
            $score_total = $reviewData['score_total'];
        ?>

        <div class="service-review">
            <span class="rate">
                @if($reviewData['total_review'] > 0) {{$score_total}} @endif <span>({{ $reviewData['total_review'] }})</span>
            </span>

            {{-- <span class="review">
                @if($reviewData['total_review'] > 1)
                    {{ __(":number Reviews",["number"=>$reviewData['total_review'] ]) }}
                @else
                    {{ __(":number Review",["number"=>$reviewData['total_review'] ]) }}
                @endif
            </span> --}}

        </div>
    @endif


    <div class="amenities">
        <div class="row mb-2">
            <div class="col-md-4 pr-0">
                @if($row->passenger)
                    <span class="amenity total" data-toggle="tooltip"  title="{{ __("Passenger") }}">
                        <i class="input-icon field-icon icon-passenger  "></i>
                        <span class="text">
                            {{$row->passenger}} Seat
                        </span>

                    </span>
                @endif
            </div>
            <div class="col-md-4 pr-0">
                @if($row->gear)
                    <span class="amenity bed" data-toggle="tooltip" title="{{__("Gear Shift")}}">
                        <i class="input-icon field-icon icon-gear"></i>
                        <span class="text">
                            {{$row->gear}}
                        </span>
                    </span>
                @endif
            </div>
            <div class="col-md-4">
                @if($row->baggage)
                    <span class="amenity bath" data-toggle="tooltip" title="{{__("Baggage")}}" >
                        <i class="input-icon field-icon icon-baggage"></i>
                        <span class="text">
                            {{$row->baggage}}
                        </span>
                    </span>
                @endif
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                @if($row->door)
                    <span class="amenity size" data-toggle="tooltip" title="{{__("Door")}}" >
                        <i class="input-icon field-icon icon-door"></i>
                        <span class="text">
                            {{$row->door}} Door
                        </span>
                    </span>
                @endif
            </div>
        </div>




    </div>


    <div class="info">
        <div class="g-price">

            <div class="price">
                <span class="onsale">{{ $row->display_sale_price }}</span>
                <span class="text-price">{{ $row->display_price }} <span class="unit">{{__("/day")}}</span></span>
            </div>
        </div>

        <div class="g-price">
            <a @if(!empty($blank)) target="_blank" @endif href="{{$row->getDetailUrl()}}" class="btn btn-default">
                Rent Car
            </a>
        </div>
    </div>
</div>
