
(function ($) {


    new Vue({
        el: '#bravo-checkout-page',
        data: {
            onSubmit: false,
            message: {
                content: '',
                type: false
            }
        },
        methods: {
            doCheckout() {
                var me = this;

                if (this.onSubmit) return false;

                if (!this.validate()) return false;

                this.onSubmit = true;

                $.ajax({
                    url: bookingCore.url + '/agent/booking/doCheckout',
                    data: $('.booking-form').find('input,textarea,select').serialize(),
                    method: "post",
                    success: function (res) {
                        console.log("from agent", res);
                        if (!res.status && !res.url) {
                            me.onSubmit = false;
                        }

                        if (res.elements) {
                            for (var k in res.elements) {
                                $(k).html(res.elements[k]);
                            }
                        }

                        if (res.message) {
                            me.message.content = res.message;
                            me.message.type = res.status;
                        }

                        if (res.url) {
                            console.log(res);
                            var old_url = res.url;
                            // Use a regular expression to match the part after "booking/"
                            var matchbooking = old_url.match(/\/booking\/([^\/]+)$/);
                            // Check if a match is found
                            if (matchbooking && matchbooking[1]) {
                                var booking_code = matchbooking[1];
                                console.log(matchbooking[1]);
                                var newUrl = bookingCore.url + '/agent/booking/detail/' + booking_code;
                                window.location.href = newUrl;
                            } else {
                                var booking_code = "";
                                window.location.href = old_url;
                            }
                        }

                        if (res.errors && typeof res.errors == 'object') {
                            var html = '';
                            for (var i in res.errors) {
                                html += res.errors[i] + '<br>';
                            }
                            me.message.content = html;
                        }
                        if (typeof BravoReCaptcha != "undefined") {
                            BravoReCaptcha.reset('booking');
                        }

                    },
                    error: function (e) {
                        me.onSubmit = false;
                        if (e.responseJSON) {
                            me.message.content = e.responseJSON.message ? e.responseJSON.message : 'Can not booking';
                            me.message.type = false;
                        } else {
                            if (e.responseText) {
                                me.message.content = e.responseText;
                                me.message.type = false;
                            }
                        }
                        if (typeof BravoReCaptcha != "undefined") {
                            BravoReCaptcha.reset('booking');
                        }
                    }
                })
            },
            validate() {
                return true;
            }
        }
    })
})(jQuery)
$('#confirmRegister').change(function () {
    if ($(this).prop('checked')) {
        $('#confirmRegisterContent').removeClass('d-none');
    } else {
        $('#confirmRegisterContent').addClass('d-none');
    }
});
