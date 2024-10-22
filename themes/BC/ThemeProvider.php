<?php
namespace Themes\BC;

use Database\Seeders\DatabaseSeeder;

class ThemeProvider extends \Themes\Base\ThemeProvider
{

    public static $version = '0.1';
    public static $name = 'Resort Bazar';
    public static $seeder = DatabaseSeeder::class;

    public function register()
    {
        parent::register();
        $this->app->register(\Themes\BC\Core\ModuleProvider::class);
    }
}
