
<div class="list-full-width">

    <div class="container">
        <div class="bravo-list-car layout_{{$style_list}}">
            @if($title)
                <div class="sub-title text-center">
                    {{$title}}
                </div>
            @endif
            @if($desc)
                <div class="title text-center">
                    {{$desc}}
                </div>
            @endif
            <div class="list-item">
                @if($style_list === "normal")
                    <div class="row">
                        @foreach($rows as $row)
                            <div class="col-lg-{{$col ?? 4}} col-md-6">
                                @include('Car::frontend.layouts.search.loop-grid')
                            </div>
                        @endforeach
                    </div>
                @endif
                @if($style_list === "carousel")
                    <div class="owl-carousel">
                        @foreach($rows as $row)
                            @include('Car::frontend.layouts.search.loop-grid')
                        @endforeach
                    </div>
                @endif
            </div>
        </div>
    </div>

    <div class="img-cover bravo-list-hotel-bg" style="background: url('{{ $background_image ?? "" }}')"></div>

</div>
