<?php
namespace Modules\Booking;

use Illuminate\Support\Facades\Event;
use Modules\Booking\Events\BookingCreatedEvent;
use Modules\Booking\Events\BookingUpdatedEvent;
use Modules\Booking\Events\SetPaidAmountEvent;
use Modules\Booking\Listeners\BookingCreatedListen;
use Modules\Booking\Listeners\BookingUpdateListen;
use Modules\Booking\Listeners\SetPaidAmountListen;
use Modules\Core\Helpers\SitemapHelper;
use Modules\ModuleServiceProvider;
use Modules\News\Models\News;
use Modules\Page\Models\Page;
use Modules\User\Helpers\PermissionHelper;

class ModuleProvider extends ModuleServiceProvider
{
    public function boot(SitemapHelper $sitemapHelper)
    {
        $this->loadMigrationsFrom(__DIR__ . '/Migrations');
        Event::listen(BookingCreatedEvent::class,BookingCreatedListen::class);
        Event::listen(BookingUpdatedEvent::class,BookingUpdateListen::class);
        Event::listen(SetPaidAmountEvent::class,SetPaidAmountListen::class);

        $this->loadMigrationsFrom(__DIR__.'/Database/Migrations');


        PermissionHelper::add([
            'booking_manual'
        ]);

    }

    /**
     * Register bindings in the container.
     *
     * @return void
     */
    public function register()
    {
        $this->app->register(RouterServiceProvider::class);
        $this->app->register(EventServiceProvider::class);
    }


    public static function getTemplateBlocks(){

        return [

            'manual_booking_search_form'=>"\\Modules\\Booking\\Blocks\\ManualBookingSearchForm",
        ];

    }


    public static function getAdminMenu(){

        $options = [
            "position" => 10,
            'url'        => route('booking.manual'),
            'title'      => __('Booking'),
            'icon'       => 'icon ion-ios-contacts',
            'permission' => 'booking_manual',
            'group'    => 'system',
            'children'   => [
                'booking'=>[
                    'url'        => route('booking.manual'),
                    'title'      => __('Make Booked'),
                ],
            ]
        ];

        return [
            'agent'=> $options
        ];

    }


}
