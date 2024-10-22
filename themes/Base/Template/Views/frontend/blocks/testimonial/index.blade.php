

@if($rows)
    <div class="bravo-testimonial">
        <div class="container">

            <div class="bravo-list-testimonial layout_{{$style_list}}">


                @if($title)
                    <div class="sub-title text-center">
                        {{$title}}
                    </div>
                @endif
                {{-- @if($desc)
                    <div class="title text-center">
                        {{$desc}}
                    </div>
                @endif --}}



                @if($style_list === "normal")
                    <div class="row">
                        @foreach($rows as $item)
                            <?php $avatar_url = get_file_url($item['avatar'], 'full') ?>
                            <div class="col-md-6 col-lg-4">
                                <div class="item has-matchHeight">
                                    <div class="author">
                                        <img src="{{$avatar_url}}" alt="{{$item['name']}}">
                                        <div class="author-meta">
                                            <h4>{{$item['name']}}</h4>
                                            @if(!empty($item['number_star']))
                                                <div class="star">
                                                    @for($i = 0 ; $i < $item['number_star'] ; $i++)
                                                        <i class="fa fa-star"></i>
                                                    @endfor
                                                </div>
                                            @endif
                                        </div>
                                    </div>
                                    <p>
                                        {{$item['desc']}}
                                    </p>
                                </div>
                            </div>
                        @endforeach
                    </div>
                @endif

                @if($style_list === "carousel")
                    <div class="owl-carousel">
                        @foreach($rows as $item)

                        <?php $avatar_url = get_file_url($item['avatar'], 'full') ?>

                            <div class="item-loop item-loop-wrap item has-matchHeight">
                                <div class="author">
                                    <img src="{{$avatar_url}}" alt="{{$item['name']}}">
                                    <div class="author-meta">
                                        <h4>{{$item['name']}}</h4>
                                        @if(!empty($item['number_star']))
                                            <div class="star">
                                                @for($i = 0 ; $i < $item['number_star'] ; $i++)
                                                    <i class="fa fa-star"></i>
                                                @endfor
                                            </div>
                                        @endif
                                    </div>
                                </div>
                                <p>
                                    {{$item['desc']}}
                                </p>
                            </div>
                        @endforeach
                    </div>
                @endif



            </div>

        </div>
    </div>
@endif

