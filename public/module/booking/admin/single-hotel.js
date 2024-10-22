(function ($) {

    // Date Picker Range
    $('.checkAbilityDatepicker').each(function () {

        var roomId = $('.ids', this).val();
        var hotel_id = $('.ids', this).data('hotel_id');
        var me = this;
        var $this = $(this);

        if (roomId && hotel_id) {
            var data = {
                room_id: roomId,
                hotel_id: hotel_id,
            };
            var booked = [];
            var houseFull = [];
            $.ajax({
                url: bookingCore.module.hotel + '/getBookedDates',
                dataType: "json",
                data: data,
                method: 'post',
                beforeSend: function () {
                    $('.checkAbilityDatepicker').addClass("loading");
                },
                success: function (json) {

                    var rooms_hold_data = json.rooms;
                    var rooms_booked_data = json.full_booked_rooms;


                    rooms_hold_data.forEach(function (bookedDate) {
                        bookedDate.date_range.forEach(function (date) {
                            booked.push(date);
                        });
                    });

                    rooms_booked_data.forEach(function (fullBookedDate) {
                        fullBookedDate.date_range.forEach(function (full_date) {
                            houseFull.push(full_date);
                        });
                    });

                    $('.checkAbilityDatepicker').removeClass("loading");
                },
                error: function (e) {
                    console.log(e);
                    console.log("Can not get availability");
                }
            });
        }

        // Initialize datepicker with options
        var options = {
            singleDatePicker: false, // or true if you want single date selection
            autoApply: true,
            disabledPast: true,
            customClass: '',
            widthSingle: 300,
            onlyShowCurrentMonth: true,
            minDate: new Date(), // Today's date
            opens: bookingCore.rtl ? 'right' : 'left',
            locale: {
                format: "YYYY-MM-DD",
                direction: bookingCore.rtl ? 'rtl' : 'ltr',
                firstDay: daterangepickerLocale.first_day_of_week
            },
            isCustomDate: function (ele) {

                var formattedDate = moment(ele._d).format('YY-MM-DD');
                if (booked.indexOf(formattedDate) !== -1) {
                    return ['hold'];
                } else if (houseFull.indexOf(formattedDate) !== -1) {
                    return ['housefull'];
                }
                return [''];
            },
            isInvalidDate: function (ele) {
                var formattedDate = moment(ele._d).format('YY-MM-DD');
                if (booked.indexOf(formattedDate) !== -1) {
                    return true;;
                } else if (houseFull.indexOf(formattedDate) !== -1) {
                    return true;;
                }
                return false;
            }
        };
        if (typeof daterangepickerLocale == 'object') {
            options.locale = _.merge(daterangepickerLocale, options.locale);
        }
        // Initialize the datepicker
        $(me).daterangepicker(options, function (start, end, label) {
            $('.check-in-input', me).val(start.format(bookingCore.date_format));
            $('.check-in-render', me).html(start.format(bookingCore.date_format));
            $('.check-out-input', me).val(end.format(bookingCore.date_format));
            $('.check-out-render', me).html(end.format(bookingCore.date_format));
        });
        $this.daterangepicker(options).on('apply.daterangepicker', function (ev, picker) {

            if (picker.endDate.diff(picker.startDate, 'day') <= 0) {
                picker.endDate.add(1, 'day');
            }
            $('.check-in-input', me).val(picker.startDate.format(bookingCore.date_format));
            $('.check-out-input', me).val(picker.endDate.format(bookingCore.date_format));
            $('.check-in-render', me).html(picker.startDate.format(bookingCore.date_format));
            $('.check-out-render', me).html(picker.endDate.format(bookingCore.date_format));


            var startDate = picker.startDate.format('YYYY-MM-DD');
            var endDate = picker.endDate.format('YYYY-MM-DD');


            var form = me.closest('.hotel_room_form');

            if (form.length) {
                var $form = $(form);

                // Select children input element using jQuery
                var childrenInput = $form.find('.childrenInput');
                var adultsInput = $form.find('.adultsInput');

                var children = childrenInput.val();
                var adults = adultsInput.val();


                $.ajax({
                    url: bookingCore.module.hotel + '/getRoomDataAvailability',

                    data: {
                        hotel_id: hotel_id,
                        room_id: roomId,
                        start_date: startDate,
                        end_date: endDate,
                        adults: adults,
                        children: children,
                    },

                    method: 'post',

                    success: function (result) {

                        if (result.message) {

                            var selectElement = $form.find('.custom-select');
                            selectElement.empty();
                            selectElement.addClass('d-none');
                            bookingCoreApp.showAjaxMessage(result);

                            updateTotalForm();

                        } else {

                            var selectElement = $form.find('.custom-select');
                            var priceElement = $form.find('.price');
                            selectElement.removeClass('d-none');
                            selectElement.empty();
                            priceElement.empty();
                            priceElement.html(result.price_html);

                            var emptyOption = $('<option></option>').attr('value', '').text('Select Please');
                            selectElement.append(emptyOption);

                            for (var i = 1; i <= result.number; i++) {
                                var price = i * result.price;
                                var option = $('<option></option>')
                                    .attr('value', i)
                                    .attr('data-price', result.price)
                                    .text(i + ' ' + (i > 1 ? 'rooms' : 'room') + ' (' + window.bravo_format_money(price) + ')');

                                // Set the selected attribute for the first item
                                if (i === 1) {
                                    option.prop('selected', true);
                                }

                                selectElement.append(option);
                            }

                            updateTotalForm();

                        }


                    },
                    error: function (e) {
                        me.firstLoad = false;
                        bookingCoreApp.showAjaxError(e);
                    }

                })


            }
        })
    });
    $(window).on("load", function () {

        updateTotalForm();

        var urlHash = window.location.href.split("#")[1];
        if (urlHash && $('.' + urlHash).length) {
            var offset_other = 70
            if (urlHash === "review-list") {
                offset_other = 330;
            }
            $('html,body').animate({
                scrollTop: $('.' + urlHash).offset().top - offset_other
            }, 1000);
        }
        $(document).find('[data-toggle=tooltip]').tooltip();
    });
    $(".bravo-button-book-mobile").click(function () {
        //$('.bravo_single_book_wrap').modal('show');
    });
    $(".bravo_detail_space .g-faq .item .header").click(function () {
        $(this).parent().toggleClass("active");
    });
    $(".btn-show-all").click(function () {
        $(this).parent().find(".d-none").removeClass("d-none");
        $(this).addClass("d-none");
    });
    $(".start_room_sticky").each(function () {
        var $this_list_room = $(this).closest(".hotel_rooms_form");

        $(window).scroll(function () {
            var window_height = $(window).height();
            var windowTop = $(window).scrollTop();
            var stickyTop = $('.start_room_sticky').offset().top + 100 - window_height;
            var stickyBottom = stickyTop + $this_list_room.height() - 300;
            if (stickyTop < windowTop && windowTop < stickyBottom) {
                $(document).find(".hotel_room_book_status").addClass("sticky").css("width", $this_list_room.width());
                $(document).find(".end_room_sticky").css("min-height", $(document).find(".hotel_room_book_status").height() + 32 + 20);

                setTimeout(function () {
                    $(document).find(".hotel_room_book_status").addClass("active");
                }, 100);
            } else {
                $(document).find(".hotel_room_book_status").removeClass("sticky").css("width", "auto");
                $(document).find(".end_room_sticky").css("min-height", "auto");
                $(document).find(".hotel_room_book_status").removeClass("active");
            }
        });
    });
    function updateTotalForm() {
        var grand_total = 0;
        var adults_total = 0;
        var total_days_total = 0;
        var total_room = 0;

        $(".hotel_room_form").each(function () {
            var selectElement = $(this).find('.custom-select');

            var selectedOption = selectElement.find('option:selected').filter(function () {
                return $(this).val() !== '';
            });

            if (selectedOption.length > 0) {

                total_room += 1;

                // Room Price & Number
                var priceData = selectedOption.data('price');
                var roomNumber = selectedOption.val();
                var line_total = priceData * roomNumber;
                grand_total += line_total;

                // Person Calculation
                var childrenInput = $(this).find('.childrenInput');
                var adultsInput = $(this).find('.adultsInput');
                var children = childrenInput.val();
                var adults = adultsInput.val();
                adults_total += parseFloat(adults);

                // Date Calculation
                var startDateStr = $(this).find('.check-in-input').val();
                var endDateStr = $(this).find('.check-out-input').val();
                var startDate = new Date(startDateStr);
                var endDate = new Date(endDateStr);
                var timeDifference = endDate.getTime() - startDate.getTime();
                var total_days = Math.ceil(timeDifference / (1000 * 3600 * 24));
                total_days_total += parseFloat(total_days);


            }
        });

        // Extra Price Calculation
        var extraPrice = getExtraPrice(total_days_total, adults_total);

        grand_total += extraPrice;

        var totalServiceFee = getServiceFee(grand_total, adults_total);

        grand_total += totalServiceFee;

        if (total_room > 0) {
            var row_total_priceElement = $('.hotel_room_book_status');
            $('.total_rooms').text(total_room);
            $('.total_price_html').text(window.bravo_format_money(grand_total));

            row_total_priceElement.removeClass('d-none');
        } else {
            $('.total_rooms').text(0);
            $('.total_price_html').text(0);
            var row_total_priceElement = $('.hotel_room_book_status');
            row_total_priceElement.addClass('d-none');
        }

    }
    function getExtraPrice(total_days, adults) {
        var totalExtraPrice = 0;

        $(".extra-item").each(function () {
            var extra_price_item_checkElement = $(this).find('.extra_price_item_check');
            var isChecked = extra_price_item_checkElement.is(':checked');

            if (isChecked) {
                var extra_price_typeElement = $(this).find('.extra_price_type');
                var per_personElement = $(this).find('.per_person');
                var extra_priceElement = $(this).find('.extra_price');

                var extra_price_type = extra_price_typeElement.val();
                var per_person = per_personElement.val();
                var extra_price = parseFloat(extra_priceElement.val());

                if (extra_price_type == "one_time") {
                    if (per_person == "on") {
                        totalExtraPrice += extra_price * adults;
                    } else {
                        totalExtraPrice += extra_price;
                    }
                }

                if (extra_price_type == "per_day") {
                    if (per_person == "on") {
                        var extra_price_for_day = extra_price * total_days;
                        var price_for_all_day = extra_price_for_day * adults;
                        totalExtraPrice += price_for_all_day;
                    } else {
                        var extra_price_for_one_day = extra_price;
                        var price_for_all_day = extra_price_for_one_day * total_days;
                        totalExtraPrice += price_for_all_day;
                    }
                }

            }
        });

        return totalExtraPrice;
    }
    function getServiceFee(total_amount, adults_total) {
        var totalServiceFee = 0;

        if (total_amount > 0) {
            $(".enable_service_fee").each(function () {

                var service_fee_typeElement = $(this).find('.service_fee_type');
                var service_feeElement = $(this).find('.service_fee');
                var service_fee_per_personElement = $(this).find('.service_fee_per_person');

                var service_fee = parseFloat(service_feeElement.val());
                var service_fee_type = service_fee_typeElement.val();
                var service_fee_per_person = service_fee_per_personElement.val();

                if (service_fee_type == "percent") {

                    if (service_fee_per_person == "on") {
                        var total_service_fee = (total_amount * service_fee) / 100;
                        var service_fee_for_per_person = total_service_fee * adults_total;
                        totalServiceFee += service_fee_for_per_person;
                    } else {
                        totalServiceFee += (total_amount * service_fee) / 100;
                    }

                }

                if (service_fee_type == "fixed") {

                    if (service_fee_per_person == "on") {
                        var service_fee_for_per_person = service_fee * adults_total;
                        totalServiceFee += service_fee_for_per_person;
                    } else {
                        totalServiceFee += service_fee
                    }

                }


            })
        }

        return totalServiceFee;
    }
    function updateGuestCount(parentContainer) {
        var adultsOneElement = parentContainer.find('.adults .one');
        var adultsInput = parentContainer.find('.adultsInput');
        adultsOneElement.text(adultsInput.val());

        var childrenOneElement = parentContainer.find('.children .one');
        var childrenInput = parentContainer.find('.childrenInput');
        childrenOneElement.text(childrenInput.val());


    }
    $(".extra_price_item_check").click(function () {
        updateTotalForm();
    });

    $('.custom-select').on('change', function () {
        updateTotalForm();
    });
    $(".btn-minus2").click(function () {

        var parentContainer = $(this).closest('.val');
        var parentContainerForAll = $(this).closest('.form_for_guest_adult_child');
        var adultsInput = parentContainer.find('.adultsInput');
        var childrenInput = parentContainer.find('.childrenInput');
        var currentValue = parseInt(adultsInput.val());
        var childrenCurrentValue = parseInt(childrenInput.val());

        if (currentValue > 1) {
            adultsInput.val(currentValue - 1);
        }
        if (childrenCurrentValue > 0) {
            childrenInput.val(childrenCurrentValue - 1);
        }



        var me = this;
        var form = me.closest('.hotel_room_form');
        var $form = $(form);
        var roomId = $('.ids', $form).val();
        var hotel_id = $('.ids', $form).data('hotel_id');
        var startDateStr = $form.find('.check-in-input').val();
        var endDateStr = $form.find('.check-out-input').val();
        var startDateUF = new Date(startDateStr);
        var endDateUF = new Date(endDateStr);
        // Format start date
        var startDate = startDateUF.toISOString().split('T')[0];
        // Format end date
        var endDate = endDateUF.toISOString().split('T')[0];

        if (form.length) {

            // Select children input element using jQuery
            var childrenInput = $form.find('.childrenInput');
            var adultsInput = $form.find('.adultsInput');

            var children = childrenInput.val();
            var adults = adultsInput.val();


            $.ajax({
                url: bookingCore.module.hotel + '/getRoomDataAvailability',

                data: {
                    hotel_id: hotel_id,
                    room_id: roomId,
                    start_date: startDate,
                    end_date: endDate,
                    adults: adults,
                    children: children,
                },

                method: 'post',

                success: function (result) {

                    if (result.message) {
                        var selectElement = $form.find('.custom-select');
                        selectElement.empty();
                        selectElement.addClass('d-none');
                        bookingCoreApp.showAjaxMessage(result);

                        updateTotalForm();

                    } else {

                        updateGuestCount(parentContainerForAll);

                        var selectElement = $form.find('.custom-select');
                        var priceElement = $form.find('.price');
                        selectElement.removeClass('d-none');
                        selectElement.empty();
                        priceElement.empty();
                        priceElement.html(result.price_html);

                        var emptyOption = $('<option></option>').attr('value', '').text('Select Please');
                        selectElement.append(emptyOption);

                        for (var i = 1; i <= result.number; i++) {
                            var price = i * result.price;
                            var option = $('<option></option>')
                                .attr('value', i)
                                .attr('data-price', result.price)
                                .text(i + ' ' + (i > 1 ? 'rooms' : 'room') + ' (' + window.bravo_format_money(price) + ')');

                            // Set the selected attribute for the first item
                            if (i === 1) {
                                option.prop('selected', true);
                            }

                            selectElement.append(option);
                        }

                        updateTotalForm();

                    }


                },
                error: function (e) {
                    me.firstLoad = false;
                    bookingCoreApp.showAjaxError(e);
                }

            })


        }






    });
    $(".btn-add2").click(function () {
        var parentContainer = $(this).closest('.val');
        var parentContainerForAll = $(this).closest('.form_for_guest_adult_child');
        var adultsInput = parentContainer.find('input[type="number"]');
        var currentValue = parseInt(adultsInput.val());
        adultsInput.val(currentValue + 1);



        var me = this;
        var form = me.closest('.hotel_room_form');
        var $form = $(form);
        var roomId = $('.ids', $form).val();
        var hotel_id = $('.ids', $form).data('hotel_id');
        var startDateStr = $form.find('.check-in-input').val();
        var endDateStr = $form.find('.check-out-input').val();
        var startDateUF = new Date(startDateStr);
        var endDateUF = new Date(endDateStr);
        // Format start date
        var startDate = startDateUF.toISOString().split('T')[0];
        // Format end date
        var endDate = endDateUF.toISOString().split('T')[0];

        if (form.length) {

            // Select children input element using jQuery
            var childrenInput = $form.find('.childrenInput');
            var adultsInput = $form.find('.adultsInput');

            var children = childrenInput.val();
            var adults = adultsInput.val();


            $.ajax({
                url: bookingCore.module.hotel + '/getRoomDataAvailability',

                data: {
                    hotel_id: hotel_id,
                    room_id: roomId,
                    start_date: startDate,
                    end_date: endDate,
                    adults: adults,
                    children: children,
                },

                method: 'post',

                success: function (result) {

                    if (result.message) {
                        adultsInput.val(currentValue);
                        var selectElement = $form.find('.custom-select');
                        selectElement.empty();
                        selectElement.addClass('d-none');
                        bookingCoreApp.showAjaxMessage(result);

                        updateTotalForm();

                    } else {
                        updateGuestCount(parentContainerForAll);
                        var selectElement = $form.find('.custom-select');
                        var priceElement = $form.find('.price');
                        selectElement.removeClass('d-none');
                        selectElement.empty();
                        priceElement.empty();
                        priceElement.html(result.price_html);

                        for (var i = 1; i <= result.number; i++) {
                            var price = i * result.price;
                            var option = $('<option></option>')
                                .attr('value', i)
                                .attr('data-price', result.price)
                                .text(i + ' ' + (i > 1 ? 'rooms' : 'room') + ' (' + window.bravo_format_money(price) + ')');

                            selectElement.append(option);
                        }

                        updateTotalForm();

                    }


                },
                error: function (e) {
                    me.firstLoad = false;
                    bookingCoreApp.showAjaxError(e);
                }

            })


        }





    });

    var hotelRoomForms = [];
    var extraPriceForms = [];
    $("#submit_booking").click(function () {

        var hotel_id = $('#hotel_id').val();
        // Reset arrays before collecting form data
        hotelRoomForms = [];
        extraPriceForms = [];

        // Collect data from each hotel room form
        $('.hotel_room_form').each(function (index, form) {
            var selectedOption = $(form).find('select').val();
            if (selectedOption) {
                var roomData = {
                    id: $(form).find('.ids').val(),
                    start: $(form).find('.check-in-input').val(),
                    end: $(form).find('.check-out-input').val(),
                    adults: $(form).find('.adultsInput').val(),
                    children: $(form).find('.childrenInput').val(),
                    number_selected: selectedOption
                };
                hotelRoomForms.push(roomData);
            }
        });

        // Collect data from extra price forms
        $('.extra_price_form').each(function (index, form) {
            var isChecked = $(form).find('.extra_price_item_check:checked');
            if (isChecked.length > 0) {
                isChecked.each(function () {
                    var extraPriceData = {
                        type: $(this).siblings('.extra_price_type').val(),
                        price: $(this).siblings('.extra_price').val(),
                        per_person: $(this).siblings('.per_person').val(),
                        enable: '1',
                    };
                    extraPriceForms.push(extraPriceData);
                });
            }
        });


        $.ajax({
            // url:bookingCore.url+'/booking/addToCart',
            url: bookingCore.admin_url + '/module/booking/manual/addToCart',
            data: {
                rooms: hotelRoomForms,
                service_id: hotel_id,
                service_type: "hotel",
                extra_price: extraPriceForms,
            },
            dataType: 'json',
            type: 'post',
            success: function (res) {

                if (!res.status) {
                    me.onSubmit = false;
                }
                if (res.message) {
                    bookingCoreApp.showAjaxMessage(res);
                }
                if (res.step) {
                    me.step = res.step;
                }
                if (res.html) {
                    me.html = res.html
                }

                if (res.url) {
                    var booking_code = res.booking_code;
                    var newUrl = bookingCore.admin_url + '/module/booking/manual/' + booking_code + '/checkout';
                    window.location.href = newUrl
                }

                if (res.errors && typeof res.errors == 'object') {
                    var html = '';
                    for (var i in res.errors) {
                        html += res.errors[i] + '<br>';
                    }
                    me.message.content = html;

                    bookingCoreApp.showError(html);
                }
            },
            error: function (e) {

                // me.onSubmit = false;

                bravo_handle_error_response(e);

                if (e.status == 401) {
                    //$('.bravo_single_book_wrap').modal('hide');
                }
                if (e.status != 401 && e.responseJSON) {
                    me.message.content = e.responseJSON.message ? e.responseJSON.message : 'Can not booking';
                    me.message.type = false;

                }
            }

        })
    })

})(jQuery);
