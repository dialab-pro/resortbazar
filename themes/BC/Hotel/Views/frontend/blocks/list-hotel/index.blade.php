<div class="list-full-width">
    <div class="container">
        <div class="bravo-list-hotel layout_{{ $style_list }}">

            @if ($title)
                <div class="sub-title">
                    {{ $title }}
                </div>
            @endif

            @if ($desc)
                <div class="title">
                    {{ $desc }}
                </div>
            @endif

            <div class="list-item">
                @if ($style_list === 'normal')
                    <div class="row">
                        @foreach ($rows as $row)
                            <div class="col-lg-{{ $col ?? 4 }} col-md-6">
                                @include('Hotel::frontend.layouts.search.loop-grid')
                            </div>
                        @endforeach
                    </div>
                @endif
                @if ($style_list === 'carousel')
                    <div class="owl-carousel">
                        @foreach ($rows as $row)
                            @include('Hotel::frontend.layouts.search.loop-grid')
                        @endforeach
                    </div>
                @endif
            </div>


            <div class="text-center">
                <a href="{{ $link_more ?? "#" }}" class="btn btn-default">
                    {{ $link_title ?? '' }}
                </a>

            </div>

        </div>
    </div>

    <div class="img-cover bravo-list-hotel-bg" style="background: url('{{ $background_image ?? '' }}')"></div>
</div>
