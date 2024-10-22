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
            console.log('roomId, hotelId check korteci', roomId, hotel_id, data, bookingCore, me);

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
                        var hold_date = bookedDate.hold_date;
                        booked.push(hold_date);

                    });

                    rooms_booked_data.forEach(function (fullBookedDate) {
                        var full_booked_date = fullBookedDate.full_booked_date
                        houseFull.push(full_booked_date);
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
            onlyShowCurrentMonth: false, // Set to true to show only the current month
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
                    return true;
                } else if (houseFull.indexOf(formattedDate) !== -1) {
                    return true;
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

            var startDate_for_input = picker.startDate.format('DD/MM/YYYY');
            var endDate_for_input = picker.endDate.format('DD/MM/YYYY');
            console.log("date picker apply start Date", startDate_for_input, endDate_for_input);

            $('.check-in-input', me).val(startDate_for_input);
            $('.check-out-input', me).val(endDate_for_input);
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
                        console.log("date range change result", result);

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
                            $(".showDiscountAmount").empty();
                            // $(".price").empty();
                            $(".priceField p").remove();
                            $(".priceField").append(`<p>${result?.discount_type == "flat" ? result?.discount_amount + " taka off" : result?.discount_amount + " % off"}</p>`);


                            var emptyOption = $('<option></option>').attr('value', '').text('Select Please');
                            selectElement.append(emptyOption);


                            for (var i = 1; i <= result.number; i++) {
                                var price = i * result.final_price;
                                var option = $('<option></option>')
                                    .attr('value', i)
                                    .attr('data-price', result.final_price)
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

    var element = document.getElementById('selected_rooms_form');

    const screenWidth = window.screen.width;


    $(".bravo_detail_space .g-faq .item .header").click(function () {
        $(this).parent().toggleClass("active");
    });
    $(".btn-show-all").click(function () {
        $(this).parent().find(".d-none").removeClass("d-none");
        $(this).addClass("d-none");
    });







    if (screenWidth > 600) {

        document.getElementById('minimizeButton').addEventListener('click', function () {
            const statusDiv = document.getElementById('hotelRoomBookStatus');
            const selectedRoomsForm = document.getElementById('rowSelectedRoomsForm');
            statusDiv.classList.toggle('minimized');
            // Change button text based on state
            if (statusDiv.classList.contains('minimized')) {
                selectedRoomsForm.classList.add('hidden');
            } else {
                selectedRoomsForm.classList.remove('hidden');
            }
        });


        $(".start_room_sticky").each(function () {
            var $this_list_room = $(this).closest(".hotel_rooms_form");
            $(window).on('scroll resize', function () {
                var window_height = $(window).height();
                var windowTop = $(window).scrollTop();
                var stickyTop = $('.start_room_sticky').offset().top + 100 - window_height;
                var stickyBottom = stickyTop + $this_list_room.height() - 330;

                if (stickyTop < windowTop && windowTop < stickyBottom) {
                    $(".hotel_room_book_status").addClass("sticky").css("width", $this_list_room.width());
                    // $(".end_room_sticky").css("min-height", $(".hotel_room_book_status").height() + 32 + 20);

                    setTimeout(function () {
                        $(".hotel_room_book_status").addClass("active");
                    }, 100);

                } else {
                    $(".hotel_room_book_status").removeClass("sticky").css("width", "auto");
                    $(".end_room_sticky").css("min-height", "auto");
                    $(".hotel_room_book_status").removeClass("active");
                }
            });

            // Initial check to handle the case when the page loads
            $(window).trigger('scroll');
        });


    } else {


        document.getElementById('minimizeButton').addEventListener('click', function () {
            const statusDiv = document.getElementById('hotelRoomBookStatus');
            const selectedRoomsForm = document.getElementById('rowSelectedRoomsForm');
            statusDiv.classList.toggle('minimized');
            // Change button text based on state
            if (statusDiv.classList.contains('minimized')) {
                element.style.height = '0vh';
            } else {
                element.style.height = '60vh';
            }
        });



        $(".start_room_sticky").each(function () {
            var $this_list_room = $(this).closest(".hotel_rooms_form");
            $(window).on('scroll resize', function () {
                // var window_height = $(window).height();
                // var windowTop = $(window).scrollTop();
                // var stickyTop = $('.start_room_sticky').offset().top + 100 - window_height;
                // var stickyBottom = stickyTop + $this_list_room.height() - 330;

                // if (stickyTop < windowTop && windowTop < stickyBottom) {
                $(".hotel_room_book_status").addClass("sticky").css("width", $this_list_room.width());
                $(".end_room_sticky").css("min-height", $(".hotel_room_book_status").height() + 32 + 20);

                setTimeout(function () {
                    $(".hotel_room_book_status").addClass("active");
                }, 100);

                // } else {
                //     $(".hotel_room_book_status").removeClass("sticky").css("width", "auto");
                //     $(".end_room_sticky").css("min-height", "auto");
                //     $(".hotel_room_book_status").removeClass("active");
                // }
            });

            // Initial check to handle the case when the page loads
            $(window).trigger('scroll');
        });


        // if (statusDiv.classList.contains('minimized')) {

        // }else{

        // }

        // minimized




        if (element) {


            element.style.height = '60vh';



            element.style.overflowY = 'scroll';
            element.style.overflowX = 'hidden';
            // element.style.width = '100%';
        }
    }


    function updateTotalForm(remove_id = null) {

        var grand_total = 0;
        var adults_total = 0;
        var total_days_total = 0;
        var total_room = 0;


        var totalExtraPrice = 0;
        var totalServiceFee = 0;

        let roomsArray = [];

        $(".hotel_room_form").each(function () {
            var selectElement = $(this).find('.custom-select');



            var room_id = $(this).data('room_id');

            if (remove_id && remove_id === room_id) {
                var selectedOption = selectElement.find('option:selected');
                if (selectedOption.length > 0) {
                    // Unselect the option
                    selectElement.val('');
                    selectElement.trigger('change'); // Trigger change event if necessary
                }
            }

            var selectedOption = selectElement.find('option:selected').filter(function () {
                return $(this).val() !== '';
            });


            if (selectedOption.length > 0) {


                total_room += 1;

                // Room Price & Number
                var priceData = selectedOption.data('price');
                var roomNumber = selectedOption.val();
                var line_total = priceData * roomNumber;


                // Person Calculation
                var childrenInput = $(this).find('.childrenInput');
                var adultsInput = $(this).find('.adultsInput');
                var children = childrenInput.val();
                var adults = adultsInput.val();
                adults_total += parseFloat(adults);

                // Date Calculation
                var startDateStr = $(this).find('.check-in-input').val();
                var endDateStr = $(this).find('.check-out-input').val();

                var parts = startDateStr.split('/');
                // Construct the date string in the format "MM/DD/YYYY"
                var formattedStartDateStr = parts[1] + '/' + parts[0] + '/' + parts[2];

                var parts_end = endDateStr.split('/');
                // Construct the date string in the format "MM/DD/YYYY"
                var formattedEndDateStr = parts_end[1] + '/' + parts_end[0] + '/' + parts_end[2];

                var startDate = new Date(formattedStartDateStr);
                var endDate = new Date(formattedEndDateStr);
                var timeDifference = endDate.getTime() - startDate.getTime();
                var total_days = Math.ceil(timeDifference / (1000 * 3600 * 24));
                total_days_total += parseFloat(total_days);


                // // // // // // // // // // // // //


                var room_name = $(this).find('.room-name').html();

                var roomTotalExtraPrice = 0;
                $(this).find('.room_extra_price').each(function () {
                    var extra_price_item_checkElement = $(this).find('.extra_price_item_check');
                    var isChecked = extra_price_item_checkElement.is(':checked');

                    if (isChecked) {
                        var extra_price_typeElement = $(this).find('.extra_price_type');
                        var per_personElement = $(this).find('.per_person');
                        var extra_priceElement = $(this).find('.extra_price');

                        var extra_price_type = extra_price_typeElement.val();
                        var extra_price = parseFloat(extra_priceElement.val());
                        var per_person = per_personElement.val();

                        if (extra_price_type == "one_time") {
                            if (per_person == "on") {
                                roomTotalExtraPrice += extra_price * adults;
                            } else {
                                roomTotalExtraPrice += extra_price;
                            }
                        }

                        if (extra_price_type == "per_day") {
                            if (per_person == "on") {
                                var extra_price_for_day = extra_price * total_days;
                                var price_for_all_day = extra_price_for_day * adults;
                                roomTotalExtraPrice += price_for_all_day;
                            } else {
                                var extra_price_for_one_day = extra_price;
                                var price_for_all_day = extra_price_for_one_day * total_days;
                                roomTotalExtraPrice += price_for_all_day;
                            }
                        }
                    }
                });
                totalExtraPrice += roomTotalExtraPrice;


                var roomServiceFee = 0;
                $(this).find('.room_service_fee').each(function () {
                    var service_fee_item_check = $(this).find('.service_fee_item_check');
                    var isChecked = service_fee_item_check.val();

                    if (isChecked == "1") {
                        var service_fee_typeElement = $(this).find('.service_fee_type');
                        var service_feeElement = $(this).find('.service_fee');
                        var service_fee_per_personElement = $(this).find('.service_fee_per_person');
                        var service_fee = parseFloat(service_feeElement.val());
                        var service_fee_type = service_fee_typeElement.val();
                        var service_fee_per_person = service_fee_per_personElement.val();

                        if (service_fee_type == "percent") {
                            if (service_fee_per_person == "on") {
                                var total_service_fee = (total_amount * service_fee) / 100;
                                var service_fee_for_per_person = total_service_fee * adults;
                                roomServiceFee += service_fee_for_per_person;
                            } else {
                                roomServiceFee += (total_amount * service_fee) / 100;
                            }
                        }

                        if (service_fee_type == "fixed") {
                            if (service_fee_per_person == "on") {
                                var service_fee_for_per_person = service_fee * adults;
                                roomServiceFee += service_fee_for_per_person;
                            } else {
                                roomServiceFee += service_fee;
                            }
                        }
                    }
                });
                totalServiceFee += roomServiceFee;




                line_total += roomServiceFee
                line_total += roomTotalExtraPrice


                grand_total += line_total;

                roomsArray.push({
                    room_id: $(this).data('room_id'),
                    room_name: room_name,
                    room_price: priceData,
                    roomNumber: roomNumber,
                    stay_day: total_days,
                    children: children,
                    adults: adults,
                    roomTotalExtraPrice: roomTotalExtraPrice,
                    roomServiceFee: roomServiceFee,
                    line_total: line_total
                });

            }

        });


        function isMobileDevice() {
            const userAgent = navigator.userAgent || navigator.vendor || window.opera;
            // Regex to check for common mobile device keywords in the user agent string
            return /android|webos|iphone|ipad|ipod|blackberry|iemobile|opera mini/i.test(userAgent);
        }

        // Loop through roomsArray and append HTML to .rooms_row div
        var html = '';
        const heading = document.getElementById('room_list_heading');
        if (screenWidth < 533) {
            heading.classList.add('d-none');

            roomsArray.forEach(function (room) {


                html += `<div class="flex-grow-1 text-center mt-1">
                                <strong>
                                    Rooms
                                </strong>
                                <br>
                                ${room.room_name}
                            </div>

                            <div class="flex-grow-1 text-center mt-1">
                                <strong>
                                    Price
                                </strong>
                                <br>
                                ${window.bravo_format_money(room.room_price)}/${room.stay_day} nights
                            </div>

                            <div class="flex-grow-1 text-center mt-1">
                                <strong>
                                    Total Room
                                </strong>
                                <br>
                                ${room.roomNumber}
                            </div>

                            <div class="flex-grow-1 text-center mt-1">
                                <strong>
                                    Extra price
                                </strong>
                                 <br>
                                 ${window.bravo_format_money(room.roomTotalExtraPrice)}
                            </div>

                            <div class="flex-grow-1 text-center mt-1">
                                <strong>
                                    Service free
                                </strong>
                                 <br>
                                 ${window.bravo_format_money(room.roomServiceFee)}
                            </div>

                            <div class="flex-grow-1 text-center mt-1">
                                <strong>
                                    Subtotal
                                </strong>
                                 <br>
                                 ${window.bravo_format_money(room.line_total)}
                            </div>

                            <div class="flex-grow-1 mt-1" style="text-align: center;">
                                <span data-remove_id="${room.room_id}" class="btn btn-danger btn-sm btn_remove_item_form_card" style="cursor: pointer;">
                                    <i class="fa fa-trash"></i>
                                </span>
                            </div> <hr>`;
            });


        } else {
            heading.classList.remove('d-none');

            roomsArray.forEach(function (room) {
                html += `<div class="extra-price-wrap d-flex justify-content-between mt-1">
                                <div class="flex-grow-1" style="width:30%;">${room.room_name}</div>
                                <div class="flex-grow-1 text-center" style="width:10%;">${window.bravo_format_money(room.room_price)}/${room.stay_day} nights</div>
                                <div class="flex-grow-1 text-center" style="width:10%;">${room.roomNumber}</div>
                                <div class="flex-grow-1 text-center" style="width:10%;">${window.bravo_format_money(room.roomTotalExtraPrice)}</div>
                                <div class="flex-grow-1 text-center" style="width:10%;">${window.bravo_format_money(room.roomServiceFee)}</div>
                                <div class="flex-grow-1 text-center" style="width:10%;">${window.bravo_format_money(room.line_total)}</div>
                                <div class="flex-grow-1" style="text-align: end;width:10%;">
                                    <span data-remove_id="${room.room_id}" class="btn btn-danger btn-sm btn_remove_item_form_card" style="cursor: pointer;">
                                        <i class="fa fa-trash"></i>
                                    </span>
                                </div>
                            </div>`;

            });

        }


        $(".rooms_row").html(html);



        grand_total += totalServiceFee;
        grand_total += totalExtraPrice;

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



        $(".btn_remove_item_form_card").click(function () {
            var remove_id = $(this).data('remove_id');
            updateTotalForm(remove_id);
        });

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


        var parts = startDateStr.split('/');
        // Construct the date string in the format "MM/DD/YYYY"
        var formattedStartDateStr = parts[1] + '/' + parts[0] + '/' + parts[2];

        var parts_end = endDateStr.split('/');
        // Construct the date string in the format "MM/DD/YYYY"
        var formattedEndDateStr = parts_end[1] + '/' + parts_end[0] + '/' + parts_end[2];

        var startDateUF = new Date(formattedStartDateStr);
        var endDateUF = new Date(formattedEndDateStr);
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
                        $(".showDiscountAmount").empty();
                        $(".priceField p").remove();
                        $(".priceField").append(`<p>${result?.discount_type == "flat" ? result?.discount_amount + " taka off" : result?.discount_amount + " % off"}</p>`);

                        var emptyOption = $('<option></option>').attr('value', '').text('Select Please');
                        selectElement.append(emptyOption);

                        for (var i = 1; i <= result.number; i++) {
                            var price = i * result.final_price;
                            var option = $('<option></option>')
                                .attr('value', i)
                                .attr('data-price', result.final_price)
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
        // console.log("parent container", parentContainer);
        // console.log("parent container for all", parentContainerForAll);
        // console.log("adult input", adultsInput);
        adultsInput.val(currentValue + 1);

        var me = this;
        var form = me.closest('.hotel_room_form');
        var $form = $(form);
        var roomId = $('.ids', $form).val();
        var hotel_id = $('.ids', $form).data('hotel_id');
        var startDateStr = $form.find('.check-in-input').val();
        var endDateStr = $form.find('.check-out-input').val();

        var parts = startDateStr.split('/');
        // Construct the date string in the format "MM/DD/YYYY"
        var formattedStartDateStr = parts[1] + '/' + parts[0] + '/' + parts[2];

        var parts_end = endDateStr.split('/');
        // Construct the date string in the format "MM/DD/YYYY"
        var formattedEndDateStr = parts_end[1] + '/' + parts_end[0] + '/' + parts_end[2];



        var startDateUF = new Date(formattedStartDateStr);
        var endDateUF = new Date(formattedEndDateStr);
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
                    console.log("result of add", result);

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
                        $(".showDiscountAmount").empty();
                        $(".priceField p").remove();
                        $(".priceField").append(`<p>${result?.discount_type == "flat" ? result?.discount_amount + " taka off" : result?.discount_amount + " % off"}</p>`);
                        var emptyOption = $('<option></option>').attr('value', '').text('Select Please');
                        selectElement.append(emptyOption);
                        for (var i = 1; i <= result.number; i++) {
                            var price = i * result?.final_price;
                            console.log("price vaiya", price, i);
                            var option = $('<option></option>')
                                .attr('value', i)
                                .attr('data-price', result?.final_price)
                                .text(i + ' ' + (i > 1 ? 'rooms' : 'room') + ' (' + window.bravo_format_money(price) + ')');
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

    var hotelRoomForms = [];
    var extraPriceForms = [];
    $("#submit_booking").click(function () {

        var hotel_id = $('#hotel_id').val();
        // Reset arrays before collecting form data
        hotelRoomForms = [];
        // extraPriceForms = [];

        // Collect data from each hotel room form
        $('.hotel_room_form').each(function (index, form) {
            var selectedOption = $(form).find('select').val();
            if (selectedOption) {

                let extraPrices = [];
                let serviceFees = [];

                // Collect extra prices
                $(form).find('.room_extra_price').each(function () {
                    var extra_price_item_checkElement = $(this).find('.extra_price_item_check');
                    var isChecked = extra_price_item_checkElement.is(':checked');

                    if (isChecked) {
                        var extra_price_typeElement = $(this).find('.extra_price_type');
                        var per_personElement = $(this).find('.per_person');
                        var extra_priceElement = $(this).find('.extra_price');
                        var extra_price_nameElement = $(this).find('.extra_price_name');

                        var extraPriceData = {
                            extra_price_name: extra_price_nameElement.val(),
                            type: extra_price_typeElement.val(),
                            per_person: per_personElement.val(),
                            price: parseFloat(extra_priceElement.val())
                        };

                        extraPrices.push(extraPriceData);
                    }
                });

                // Collect service fees
                $(form).find('.room_service_fee').each(function () {
                    var service_fee_item_check = $(this).find('.service_fee_item_check');
                    var isChecked = service_fee_item_check.val();

                    if (isChecked == "1") {
                        var service_fee_typeElement = $(this).find('.service_fee_type');
                        var service_feeElement = $(this).find('.service_fee');
                        var service_fee_per_personElement = $(this).find('.service_fee_per_person');
                        var service_fee_nameElement = $(this).find('.service_fee_name');

                        var serviceFeeData = {
                            service_name: service_fee_nameElement.val(),
                            type: service_fee_typeElement.val(),
                            per_person: service_fee_per_personElement.val(),
                            price: parseFloat(service_feeElement.val())
                        };

                        serviceFees.push(serviceFeeData);
                    }
                });


                var roomData = {
                    id: $(form).find('.ids').val(),
                    start: $(form).find('.check-in-input').val(),
                    end: $(form).find('.check-out-input').val(),
                    adults: $(form).find('.adultsInput').val(),
                    children: $(form).find('.childrenInput').val(),
                    number_selected: selectedOption,
                    extraPrices: extraPrices, // Include the extra prices array
                    serviceFees: serviceFees // Include the service fees array
                };
                hotelRoomForms.push(roomData);
            }
        });


        $.ajax({
            url: bookingCore.url + '/booking/addToCart',
            data: {
                rooms: hotelRoomForms,
                service_id: hotel_id,
                service_type: "hotel",
                // extra_price:extraPriceForms,
            },
            dataType: 'json',
            type: 'post',
            success: function (res) {

                if (res.message) {
                    bookingCoreApp.showAjaxMessage(res);
                }

                if (res.url) {
                    window.location.href = res.url
                }

                if (res.errors && typeof res.errors == 'object') {
                    var html = '';
                    for (var i in res.errors) {
                        html += res.errors[i] + '<br>';
                    }

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



function showGallery(event, id, gallery) {

    if (gallery !== null) {
        var targetRow = $(event.target).closest('.row');
        $('#modal_room_' + id).modal('show');
        targetRow.find('.fotorama').each(function () {
            $(this).fotorama();
        });

    }
}

