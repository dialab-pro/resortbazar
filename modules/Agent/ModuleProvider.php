<?php
namespace Modules\Agent;

use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Modules\Core\Helpers\SitemapHelper;
use Modules\ModuleServiceProvider;
use Modules\User\Helpers\PermissionHelper;

use Illuminate\Support\Facades\Log;
use Modules\Agent\Chatify\ChatifyMessenger;

use Modules\Vendor\Models\VendorRequest;

class ModuleProvider extends ModuleServiceProvider {


    public function boot(SitemapHelper $sitemapHelper){

        $this->loadMigrationsFrom(__DIR__ . '/Migrations');

        PermissionHelper::add([
            'agent_booking'
        ]);
        PermissionHelper::add([
            'booking_manage_agent'
        ]);
        PermissionHelper::add([
            'dashboard_agent_access'
        ]);

    }

    /**
     * Register bindings in the container.
     *
     * @return void
     */
    public function register(){
        $this->app->register(RouterServiceProvider::class);
        $this->app->register(EventServiceProvider::class);
        $this->app->bind('ChatifyMessenger', function () {
            return new ChatifyMessenger();
        });
    }


    public static function getAdminMenu(){

        // $options = [
        //     "position" => 10,
        //     'url'        => route('agent.admin.index'),
        //     'title'      => __('Agents'),
        //     'icon'       => 'icon ion-ios-contacts',
        //     'permission' => 'agent_booking',
        //     'group'    => 'system',
        //     'children'   => [

        //         // 'agent'=>[
        //         //     'url'   => route('agent.admin.index'),
        //         //     'title' => __('All Agent'),
        //         // ],

        //         'booking'=>[
        //             'url'        => route('user.admin.role.index'),
        //             'title'      => __('Booking request'),
        //         ],

        //     ]
        // ];

        // return [
        //     'agent'=> $options
        // ];

        return [];

    }


    public static function getTemplateBlocks(){

        return [

            'agent_booking_search_form'=>"\\Modules\\Agent\\Blocks\\AgentBookingSearchForm",

            'agent_register_form'=>"\\Modules\\Agent\\Blocks\\AgentRegisterForm",
            'agent_list'=>"\\Modules\\Agent\\Blocks\\ListAgent",
        ];

    }


    public static function getUserMenu(){

        $res = [];

        $res['My Booking'] = [
            "position" => 10,
            'url'        => route('agent.booking.index'),
            'title'      => __('My Booking'),
            'icon'       => 'icon ion-ios-contacts',
            'permission' => 'booking_manage_agent',
            'group'    => 'system',
            'children'   => [
                'booking'=>[
                    'url'   => route('agent.booking.index'),
                    'title' => __('All Booking')
                ],

                'make_booking'=>[
                    'url'        => route('agent.make.booked'),
                    'title'      => __('Make Booked')
                ],

            ]
        ];

        if(!setting_item('disable_payout')){
            $res['agent-payout']= [
                'url'        => route('agent.payout.index'),
                'title'      => __("Payouts"),
                'icon'       => 'icon ion-md-card',
                'position'   => 90,
                'permission' => 'dashboard_agent_access',
            ];
        }

        return $res;

    }


}
