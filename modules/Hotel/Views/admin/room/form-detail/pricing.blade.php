@if (is_default_lang())

    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <label>{{ __('Price') }} <span class="text-danger">*</span></label>
                <input type="number" required value="{{ $row->price }}" min="1" placeholder="{{ __('Price') }}"
                    name="price" class="form-control">
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <label>{{ __('Discount Price') }} <span class="text-danger"></span></label>
                <input type="number" value="{{ $row->discount_price }}" min="1"
                    placeholder="{{ __('Discount Price') }}" name="discount_price" class="form-control">
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <label>{{ __('Offer Name') }} <span class="text-danger"></span></label>
                <input type="text" value="{{ $row->offer_name ?? '' }}" placeholder="{{ __('Offer Name') }}"
                    name="offer_name" class="form-control">
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <label>{{ __('Offer Start Date') }} <span class="text-danger"></span></label>
                <input type="date" value="{{ $row->discount_start_date ?? '' }}"
                    placeholder="{{ __('Discount Start Date') }}" name="discount_start_date" class="form-control">
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <label>{{ __('Offer End Date') }} <span class="text-danger"></span></label>
                <input type="date" value="{{ $row->discount_end_date ?? '' }}"
                    placeholder="{{ __('Discount End Date') }}" name="discount_end_date" class="form-control">
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <label>{{ __('Number of room') }} <span class="text-danger">*</span></label>
                <input type="number" required value="{{ $row->number ?? 1 }}" min="1" max="100"
                    placeholder="{{ __('Number') }}" name="number" class="form-control">
            </div>
        </div>


        <div class="col-md-12">

            <div class="form-group @if (!is_default_lang()) d-none @endif">
                <label>
                    <input type="checkbox" name="enable_extra_price" @if (!empty($row->enable_extra_price)) checked @endif
                        value="1"> {{ __('Enable extra price') }}
                </label>
            </div>

            <div class="form-group-item @if (!is_default_lang()) d-none @endif"
                data-condition="enable_extra_price:is(1)">
                <label class="control-label">{{ __('Extra Price') }}</label>

                <div class="g-items-header">
                    <div class="row">
                        <div class="col-md-5">{{ __('Name') }}</div>
                        <div class="col-md-3">{{ __('Price') }}</div>
                        <div class="col-md-3">{{ __('Type') }}</div>
                        <div class="col-md-1"></div>
                    </div>
                </div>

                <div class="g-items">
                    @if (!empty($row->extra_price))
                        @php  $languages = \Modules\Language\Models\Language::getActive();  @endphp
                        @foreach ($row->extra_price as $key => $extra_price)
                            <div class="item" data-number="{{ $key }}">
                                <div class="row">
                                    <div class="col-md-5">
                                        @if (!empty($languages) && setting_item('site_enable_multi_lang') && setting_item('site_locale'))
                                            @foreach ($languages as $language)
                                                <?php $key_lang = setting_item('site_locale') != $language->locale ? '_' . $language->locale : ''; ?>
                                                <div class="g-lang">
                                                    <div class="title-lang">{{ $language->name }}</div>
                                                    <input type="text"
                                                        name="extra_price[{{ $key }}][name{{ $key_lang }}]"
                                                        class="form-control"
                                                        value="{{ $extra_price['name' . $key_lang] ?? '' }}"
                                                        placeholder="{{ __('Extra price name') }}">
                                                </div>
                                            @endforeach
                                        @else
                                            <input type="text" name="extra_price[{{ $key }}][name]"
                                                class="form-control" value="{{ $extra_price['name'] ?? '' }}"
                                                placeholder="{{ __('Extra price name') }}">
                                        @endif
                                    </div>
                                    <div class="col-md-3">
                                        <input type="number" @if (!is_default_lang()) disabled @endif
                                            min="0" name="extra_price[{{ $key }}][price]"
                                            class="form-control" value="{{ $extra_price['price'] }}">
                                    </div>
                                    <div class="col-md-3">
                                        <select name="extra_price[{{ $key }}][type]" class="form-control"
                                            @if (!is_default_lang()) disabled @endif>
                                            <option @if ($extra_price['type'] == 'one_time') selected @endif value="one_time">
                                                {{ __('One-time') }}</option>
                                            <option @if ($extra_price['type'] == 'per_day') selected @endif value="per_day">
                                                {{ __('Per day') }}</option>
                                        </select>
                                        <label>
                                            <input type="checkbox" min="0"
                                                name="extra_price[{{ $key }}][per_person]" value="on"
                                                @if ($extra_price['per_person'] ?? '') checked @endif>
                                            {{ __('Price per person') }}
                                        </label>
                                    </div>
                                    <div class="col-md-1">
                                        @if (is_default_lang())
                                            <span class="btn btn-danger btn-sm btn-remove-item"><i
                                                    class="fa fa-trash"></i></span>
                                        @endif
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    @endif
                </div>

                <div class="text-right">
                    @if (is_default_lang())
                        <span class="btn btn-info btn-sm btn-add-item">
                            <i class="icon ion-ios-add-circle-outline"></i>
                            {{ __('Add item') }}
                        </span>
                    @endif
                </div>

                <div class="g-more hide">
                    <div class="item" data-number="__number__">
                        <div class="row">
                            <div class="col-md-5">
                                @if (!empty($languages) && setting_item('site_enable_multi_lang') && setting_item('site_locale'))
                                    @foreach ($languages as $language)
                                        <?php $key = setting_item('site_locale') != $language->locale ? '_' . $language->locale : ''; ?>
                                        <div class="g-lang">
                                            <div class="title-lang">{{ $language->name }}</div>
                                            <input type="text"
                                                __name__="extra_price[__number__][name{{ $key }}]"
                                                class="form-control" value=""
                                                placeholder="{{ __('Extra price name') }}">
                                        </div>
                                    @endforeach
                                @else
                                    <input type="text" __name__="extra_price[__number__][name]"
                                        class="form-control" value=""
                                        placeholder="{{ __('Extra price name') }}">
                                @endif
                            </div>
                            <div class="col-md-3">
                                <input type="number" min="0" __name__="extra_price[__number__][price]"
                                    class="form-control" value="">
                            </div>
                            <div class="col-md-3">
                                <select __name__="extra_price[__number__][type]" class="form-control">
                                    <option value="one_time">{{ __('One-time') }}</option>
                                    <option value="per_day">{{ __('Per day') }}</option>
                                </select>
                                <label>
                                    <input type="checkbox" min="0"
                                        __name__="extra_price[__number__][per_person]" value="on">
                                    {{ __('Price per person') }}
                                </label>
                            </div>
                            <div class="col-md-1">
                                <span class="btn btn-danger btn-sm btn-remove-item"><i class="fa fa-trash"></i></span>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

            @if (is_default_lang() and (!empty(setting_item('hotel_allow_vendor_can_add_service_fee')) or is_admin()))
                <hr>
                <h3 class="panel-body-title app_get_locale">{{ __('Service fee') }}</h3>
                <div class="form-group app_get_locale">
                    <label>
                        <input type="checkbox" name="enable_service_fee"
                            @if (!empty($row->enable_service_fee)) checked @endif value="1">
                        {{ __('Enable service fee') }}
                    </label>
                </div>

                <div class="form-group-item" data-condition="enable_service_fee:is(1)">
                    <label class="control-label">{{ __('Buyer Fees') }}</label>
                    <div class="g-items-header">
                        <div class="row">
                            <div class="col-md-5">{{ __('Name') }}</div>
                            <div class="col-md-3">{{ __('Price') }}</div>
                            <div class="col-md-3">{{ __('Type') }}</div>
                            <div class="col-md-1"></div>
                        </div>
                    </div>

                    <div class="g-items">
                        <?php $languages = \Modules\Language\Models\Language::getActive(); ?>
                        @if (!empty(($service_fee = $row->service_fee)))
                            @foreach ($service_fee as $key => $item)
                                <div class="item" data-number="{{ $key }}">
                                    <div class="row">
                                        <div class="col-md-5">
                                            @if (!empty($languages) && setting_item('site_enable_multi_lang') && setting_item('site_locale'))
                                                @foreach ($languages as $language)
                                                    <?php $key_lang = setting_item('site_locale') != $language->locale ? '_' . $language->locale : ''; ?>
                                                    <div class="g-lang">
                                                        <div class="title-lang">{{ $language->name }}</div>
                                                        <input type="text"
                                                            name="service_fee[{{ $key }}][name{{ $key_lang }}]"
                                                            class="form-control"
                                                            value="{{ $item['name' . $key_lang] ?? '' }}"
                                                            placeholder="{{ __('Fee name') }}">
                                                        <input type="text"
                                                            name="service_fee[{{ $key }}][desc{{ $key_lang }}]"
                                                            class="form-control"
                                                            value="{{ $item['desc' . $key_lang] ?? '' }}"
                                                            placeholder="{{ __('Fee desc') }}">
                                                    </div>
                                                @endforeach
                                            @else
                                                <input type="text" name="service_fee[{{ $key }}][name]"
                                                    class="form-control" value="{{ $item['name'] ?? '' }}"
                                                    placeholder="{{ __('Fee name') }}">
                                                <input type="text" name="service_fee[{{ $key }}][desc]"
                                                    class="form-control" value="{{ $item['desc'] ?? '' }}"
                                                    placeholder="{{ __('Fee desc') }}">
                                            @endif
                                        </div>
                                        <div class="col-md-3">
                                            <input type="number" min="0" step="0.1"
                                                name="service_fee[{{ $key }}][price]" class="form-control"
                                                value="{{ $item['price'] ?? '' }}">
                                            <select name="service_fee[{{ $key }}][unit]"
                                                class="form-control">
                                                <option @if (($item['unit'] ?? '') == 'fixed') selected @endif
                                                    value="fixed">{{ __('Fixed') }}</option>
                                                <option @if (($item['unit'] ?? '') == 'percent') selected @endif
                                                    value="percent">{{ __('Percent') }}</option>
                                            </select>
                                        </div>
                                        <div class="col-md-3">
                                            <select name="service_fee[{{ $key }}][type]"
                                                class="form-control d-none">
                                                <option @if ($item['type'] ?? '' == 'one_time') selected @endif
                                                    value="one_time">{{ __('One-time') }}</option>
                                            </select>
                                            <label>
                                                <input type="checkbox" min="0"
                                                    name="service_fee[{{ $key }}][per_person]"
                                                    value="on" @if ($item['per_person'] ?? '') checked @endif>
                                                {{ __('Price per person') }}
                                            </label>
                                        </div>
                                        <div class="col-md-1">
                                            <span class="btn btn-danger btn-sm btn-remove-item"><i
                                                    class="fa fa-trash"></i></span>
                                        </div>
                                    </div>
                                </div>
                            @endforeach
                        @endif
                    </div>

                    <div class="text-right">
                        <span class="btn btn-info btn-sm btn-add-item"><i class="icon ion-ios-add-circle-outline"></i>
                            {{ __('Add item') }}</span>
                    </div>

                    <div class="g-more hide">
                        <div class="item" data-number="__number__">
                            <div class="row">
                                <div class="col-md-5">
                                    @if (!empty($languages) && setting_item('site_enable_multi_lang') && setting_item('site_locale'))
                                        @foreach ($languages as $language)
                                            <?php $key = setting_item('site_locale') != $language->locale ? '_' . $language->locale : ''; ?>
                                            <div class="g-lang">
                                                <div class="title-lang">{{ $language->name }}</div>
                                                <input type="text"
                                                    __name__="service_fee[__number__][name{{ $key }}]"
                                                    class="form-control" value=""
                                                    placeholder="{{ __('Fee name') }}">
                                                <input type="text"
                                                    __name__="service_fee[__number__][desc{{ $key }}]"
                                                    class="form-control" value=""
                                                    placeholder="{{ __('Fee desc') }}">
                                            </div>
                                        @endforeach
                                    @else
                                        <input type="text" __name__="service_fee[__number__][name]"
                                            class="form-control" value="" placeholder="{{ __('Fee name') }}">
                                        <input type="text" __name__="service_fee[__number__][desc]"
                                            class="form-control" value="" placeholder="{{ __('Fee desc') }}">
                                    @endif
                                </div>
                                <div class="col-md-3">
                                    <input type="number" min="0" step="0.1"
                                        __name__="service_fee[__number__][price]" class="form-control"
                                        value="">
                                    <select __name__="service_fee[__number__][unit]" class="form-control">
                                        <option value="fixed">{{ __('Fixed') }}</option>
                                        <option value="percent">{{ __('Percent') }}</option>
                                    </select>
                                </div>
                                <div class="col-md-3">
                                    <select __name__="service_fee[__number__][type]" class="form-control d-none">
                                        <option value="one_time">{{ __('One-time') }}</option>
                                    </select>
                                    <label>
                                        <input type="checkbox" min="0"
                                            __name__="service_fee[__number__][per_person]" value="on">
                                        {{ __('Price per person') }}
                                    </label>
                                </div>
                                <div class="col-md-1">
                                    <span class="btn btn-danger btn-sm btn-remove-item"><i
                                            class="fa fa-trash"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            @endif

        </div>

    </div>
    <hr>

    @if (is_default_lang())
        <div class="row">
            <div class="col-lg-12">
                <div class="form-group">
                    <label class="control-label">{{ __('Minimum day stay requirements') }}</label>
                    <input type="number" name="min_day_stays" class="form-control"
                        value="{{ $row->min_day_stays }}" placeholder="{{ __('Ex: 2') }}">
                    <i>{{ __('Leave blank if you dont need to set minimum day stay option') }}</i>
                </div>
            </div>
        </div>
        <hr>
    @endif
    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <label>{{ __('Number of beds') }} </label>
                <input type="number" value="{{ $row->beds ?? 1 }}" min="1" max="10"
                    placeholder="{{ __('Number') }}" name="beds" class="form-control">
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <label>{{ __('Room Size') }} </label>
                <div class="input-group mb-3">
                    <input type="text" class="form-control" name="size" value="{{ $row->size ?? 0 }}"
                        placeholder="{{ __('Room size') }}">
                    <div class="input-group-append">
                        <span class="input-group-text">{!! size_unit_format() !!}</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <label>{{ __('Max Adults') }} </label>
                <input type="number" min="1" value="{{ $row->adults ?? 1 }}" name="adults"
                    class="form-control">
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <label>{{ __('Max Children') }} </label>
                <input type="number" min="0" value="{{ $row->children ?? 0 }}" name="children"
                    class="form-control">
            </div>
        </div>
    </div>
    <hr>

@endif
