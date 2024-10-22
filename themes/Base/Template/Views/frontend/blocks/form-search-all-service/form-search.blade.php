@if (empty($hide_form_search))
    <div class="g-form-control">
        {{-- <a href="{{ route('boat.front.index') }}" class="btn btn-primary">HouseBoat</a> --}}
        <ul class="nav nav-tabs" role="tablist">
            {{-- @dd($service_types); --}}
            @if (!empty($service_types))
                @php $number = 0; @endphp
                @foreach ($service_types as $service_type)
                    @php
                        $allServices = get_bookable_services();
                        if (empty($allServices[$service_type])) {
                            continue;
                        }
                        $module = new ($allServices[$service_type])();
                    @endphp
                    <li role="bravo_{{ $service_type }}" @if ($service_type == 'boat') style="display:none;" @endif>
                        <a href="#bravo_{{ $service_type }}" class="@if ($number == 0) active @endif"
                            aria-controls="bravo_{{ $service_type }}" role="tab" data-toggle="tab">
                            <i class=""></i>
                            {{ !empty($modelBlock['title_for_' . $service_type]) ? $modelBlock['title_for_' . $service_type] : $module->getModelName() }}
                        </a>
                    </li>

                    @php $number++; @endphp
                @endforeach
            @endif
        </ul>

        <div class="tab-content">
            @if (!empty($service_types))
                @php $number = 0; @endphp
                @foreach ($service_types as $service_type)
                    @php
                        $allServices = get_bookable_services();
                        if (empty($allServices[$service_type])) {
                            continue;
                        }
                        $module = new ($allServices[$service_type])();
                    @endphp

                    <div role="tabpanel" class="tab-pane @if ($number == 0) active @endif"
                        id="bravo_{{ $service_type }}">
                        @include(ucfirst($service_type) . '::frontend.layouts.search.form-search')
                    </div>

                    @php $number++; @endphp
                @endforeach
            @endif
        </div>

    </div>
@endif
