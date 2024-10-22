<?php

namespace Modules\Boat;

use Modules\Boat\Models\Boat;
use Modules\ModuleServiceProvider;
use Modules\User\Helpers\PermissionHelper;

class ModuleProvider extends ModuleServiceProvider
{

    public function boot()
    {

        $this->mergeConfigFrom(__DIR__ . '/Configs/boat.php', 'boat');
        $this->loadMigrationsFrom(__DIR__ . '/Migrations');

        PermissionHelper::add([
            // Boat
            'boat_view',
            'boat_create',
            'boat_update',
            'boat_delete',
            'boat_manage_others',
            'boat_manage_attributes',
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
    }

    public static function getAdminMenu()
    {

        return [
            'boat' => [
                "position" => 45,
                'url'        => route('boat.admin.index'),
                'title'      => __('Boat'),
                'icon'       => 'ion-md-boat',
                'permission' => 'boat_view',
                'children'   => [
                    'destination' => [
                        'url'        => route('boat.admin.destination'),
                        'title'      => __('Boat Destination'),
                        'permission' => 'boat_view',
                    ],
                    'add' => [
                        'url'        => route('boat.admin.index'),
                        'title'      => __('All Boats'),
                        'permission' => 'boat_view',
                    ],
                    'create' => [
                        'url'        => route('boat.admin.create'),
                        'title'      => __('Add new Boat'),
                        'permission' => 'boat_create',
                    ],
                    'cabins' => [
                        'url' => route('boatCabin.admin.index'),
                        'title' => 'Boat Cabin',
                        'permission' => 'boat_view',
                    ],
                    'feature' => [
                        'url' => route('feature.admin.index'),
                        'title' => 'Boat Features',
                        'permission' => 'boat_view',
                    ],
                    'schedule' => [
                        'url' => route('schedule.admin.index'),
                        'title' => 'Boat Schedule',
                        'permission' => 'boat_view',
                    ],
                    'Booking' => [
                        'url' => route("booking.admin.index"),
                        'title' => "Boat Booking",
                    ]


                    // 'attribute' => [
                    //     'url'        => route('boat.admin.attribute.index'),
                    //     'title'      => __('Attributes'),
                    //     'permission' => 'boat_manage_attributes',
                    // ],
                    // 'availability' => [
                    //     'url'        => route('boat.admin.availability.index'),
                    //     'title'      => __('Availability'),
                    //     'permission' => 'boat_create',
                    // ],
                    // 'recovery' => [
                    //     'url'        => route('boat.admin.recovery'),
                    //     'title'      => __('Recovery'),
                    //     'permission' => 'boat_view',
                    // ],
                ]
            ]
        ];
    }

    public static function getBookableServices()
    {

        return [
            'boat' => Boat::class
        ];
    }

    public static function getMenuBuilderTypes()
    {

        return [
            'boat' => [
                'class' => Boat::class,
                'name'  => __("Boat"),
                'items' => Boat::searchForMenu(),
                'position' => 51
            ]
        ];
    }

    public static function getUserMenu()
    {
        $res = [];

        $res['boat'] = [
            'url'   => route('boat.vendor.index'),
            'title'      => __("Manage Boat"),
            // 'icon'       => Boat::getServiceIconFeatured(),
            'position'   => 70,
            'permission' => 'boat_view',
            'children' => [
                [
                    'url'   => route('boat.vendor.index'),
                    'title'  => __("All Boats"),
                ],
                [
                    'url'   => route('boat.vendor.create'),
                    'title'      => __("Add Boat"),
                    'permission' => 'boat_create',
                ],
                [
                    'url'        => route('boat.vendor.availability.index'),
                    'title'      => __("Availability"),
                    'permission' => 'boat_create',
                ],
                [
                    'url'   => route('boat.vendor.recovery'),
                    'title'      => __("Recovery"),
                    'permission' => 'boat_create',
                ],
            ]
        ];

        return $res;
    }

    public static function getTemplateBlocks()
    {

        return [
            'form_search_boat' => "\\Modules\\Boat\\Blocks\\FormSearchBoat",
            'list_boat' => "\\Modules\\Boat\\Blocks\\ListBoat",
        ];
    }
}