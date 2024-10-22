@if (is_default_lang())
    <div class="panel">
        <div class="panel-title"><strong>{{ __('Discount Pricing') }}</strong></div>
        <div class="panel-body">

            @if (is_default_lang())
                <div class="row">
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label class="control-label">{{ __('Discount Type') }}</label>
                            <select class="discountHotelType form-control" name="discount_type" id=""
                                class="form-control">
                                <option disabled selected>Discount Type</option>
                                <option value="flat" @if ($row->discount_type == 'flat') selected @endif>Flat</option>
                                <option value="percentage" @if ($row->discount_type == 'percentage') selected @endif>Percentage
                                </option>
                            </select>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label class="control-label">{{ __('Discount Amount/ Percent') }}</label>
                            <input type="number" step="any" min="0" name="discount_amount"
                                class="form-control discountHotelPrice" value="{{ $row->discount_amount ?? '' }}"
                                placeholder="{{ __('Discount Amount') }}">
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label class="control-label">{{ __('Before Discount') }}</label>
                            <input type="number" step="any" min="0" disabled
                                class="form-control currentWithoutDiscountPrice" value="{{ $row->price }}"
                                placeholder="{{ __('Hotel Price') }}">
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label class="control-label">{{ __('After Discount') }}</label>
                            <input type="number" step="any" readonly min="0" name="after_discount"
                                class="form-control afterDiscountAmount" value="{{ $row->after_discount ?? '' }}"
                                placeholder="{{ __('After Discount Price') }}">
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label class="control-label">{{ __('Discount Start Date') }}</label>
                            <input type="date" name="discount_start_date" class="form-control"
                                value="{{ $row->discount_start_date ?? '' }}">
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label class="control-label">{{ __('Discount End Date') }}</label>
                            <input type="date" name="discount_end_date" class="form-control"
                                value="{{ $row->discount_end_date ?? '' }}">
                        </div>
                    </div>

                </div>
            @endif

@endif
