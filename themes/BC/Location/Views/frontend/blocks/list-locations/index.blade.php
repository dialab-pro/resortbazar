<div class="container">
    <div class="bravo-list-locations @if(!empty($layout)) {{ $layout }} @endif">

        <div class="sub-title text-center">
            {{$title}}
        </div>

        @if(!empty($desc))
            <div class="title text-center">
                {{$desc}}
            </div>
        @endif


        @if(!empty($rows))
            <div class="list-item">

                @if (!empty($layout) and (  $layout == "style_5"))

                    <style>
                        .bravo_wrap .page-template-content .bravo-list-locations .list-item .destination-item{
                            min-height: 250px;
                        }
                        .bravo_wrap .page-template-content .bravo-list-locations .list-item .destination-item .image{
                            min-height: 250px;
                        }
                        .bravo_wrap .page-template-content .bravo-list-locations .list-item .destination-item .image .content{
                            left: 15px;
                            position: absolute;
                            right: 0;
                            text-align: left;
                            z-index: 1;
                            bottom: 15px;
                            top: unset;
                            transform: unset;
                        }
                        .bravo_wrap .page-template-content .bravo-list-locations .list-item .destination-item .image .content .desc{
                            background: unset;
                            border-radius: 100px;
                            color: #fff;
                            display: inline-block;
                            font-size: 14px !important;
                            margin-top: unset;
                            padding: unset;
                        }
                        .bravo_wrap .page-template-content .bravo-list-locations .list-item .destination-item .image .content .title{
                            font-size: 18px;
                        }
                    </style>

                    @php
                        $first_item  = '';
                        $second_item  = '';
                        $third_item  = '';
                        $four_item  = '';
                        $five_item  = '';
                        $six_item  = '';
                        foreach($rows as $key=>$row){
                            if($key == 0){
                                $first_item  = $row;
                            }
                            if($key == 1){
                                $second_item  = $row;
                            }
                            if($key == 2){
                                $third_item  = $row;
                            }
                            if($key == 3){
                                $four_item  = $row;
                            }
                            if($key == 4){
                                $five_item  = $row;
                            }
                            if($key == 5){
                                $six_item  = $row;
                            }
                        }
                    @endphp

                    <div class="row">
                        <div class="col-md-3">
                            <div class="row">
                                <div class="col-md-12">
                                    @include('Location::frontend.blocks.list-locations.single', ['row' => $first_item,'destination_style'=>'margin-bottom: 20px;','image_style'=>'min-height: 250px;'])
                                </div>
                                <div class="col-md-12">
                                    @include('Location::frontend.blocks.list-locations.single', ['row' => $second_item,'destination_style'=>'margin-bottom: 20px;','image_style'=>'min-height: 250px;'])
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="row">
                                <div class="col-md-12">
                                    @include('Location::frontend.blocks.list-locations.single', ['row' => $third_item,'destination_style'=>'margin-bottom: 0;','image_style'=>'min-height: 520px;'])
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <div class="row">
                                <div class="col-md-12">
                                    @include('Location::frontend.blocks.list-locations.single', ['row' => $four_item,'destination_style'=>'margin-bottom: 20px;','image_style'=>'min-height: 250px;'])
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-5">
                                    @include('Location::frontend.blocks.list-locations.single', ['row' => $five_item,'destination_style'=>'margin-bottom: 20px;','image_style'=>'min-height: 250px;'])
                                </div>
                                <div class="col-md-7">
                                    @include('Location::frontend.blocks.list-locations.single', ['row' => $six_item,'destination_style'=>'margin-bottom: 20px;','image_style'=>'min-height: 250px;'])
                                </div>
                            </div>
                        </div>
                    </div>

                @else

                    <div class="row">
                        @foreach($rows as $key=>$row)
                            <?php
                                $size_col = 4;
                                if(!empty($layout) and (  $layout == "style_2" or $layout == "style_3" or $layout == "style_4" )){
                                    $size_col = 4;
                                } elseif (!empty($layout) and (  $layout == "style_5")) {
                                    if($key == 0 or $key == 0){
                                        $size_col = 8;
                                    }
                                } else{
                                    if($key == 0){
                                        $size_col = 8;
                                    }
                                }
                            ?>
                            <div class="col-lg-{{$size_col}} col-md-6">
                                @include('Location::frontend.blocks.list-locations.loop')
                            </div>
                        @endforeach
                    </div>

                @endif


            </div>
        @endif

    </div>
</div>
