<?php

namespace  Modules\Agent;

use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Modules\Core\Abstracts\BaseSettingsClass;

class SettingClass extends BaseSettingsClass {

    public static function getSettingPages(){
        $configs = [
            'agent' =>[
                'id'        => 'agent',
                'title'     => __("Agent Settings"),
                'position'  => 50,
                'view'      => "Agent::admin.settings.agent",
                "keys"      => [
                    'agent_enable',
                    'agent_commission_type',
                    'agent_commission_amount',
                    'agent_auto_approved',
                    'agent_role',
                    'agent_show_email',
                    'agent_show_phone',
                    'agent_payout_methods',
                    'agent_payout_booking_status',
                    'agent_term_conditions',

                    'disable_payout',

                    'enable_mail_agent_registered',
                    'agent_subject_email_registered',
                    'agent_content_email_registered',
                    'admin_enable_mail_agent_registered',
                    'admin_subject_email_agent_registered',
                    'admin_content_email_agent_registered',

                    'agent_team_enable',
                    'agent_team_auto_approved',
                ],
                'html_keys' => [

                ],
                'filter_values_callback'=>[SettingClass::class,'filterValuesBeforeSaving']
            ]
        ];
        return apply_filters(Hook::AGENT_SETTING_CONFIG,$configs);
    }

    public static function filterValuesBeforeSaving($setting_values, Request $request) {

        $all = [];

        if(!empty($setting_values['agent_payout_methods']) and is_array($setting_values['agent_payout_methods'])){
            foreach ($setting_values['agent_payout_methods'] as $key=>$method){
                if(empty($method['name']) or empty($method['id'])){
                    unset($setting_values['agent_payout_methods'][$key]);
                    continue;
                }
                $setting_values['agent_payout_methods'][$key]['id'] = Str::slug($method['id'],'_');

                if(in_array($setting_values['agent_payout_methods'][$key]['id'],$all))
                {
                    unset($setting_values['agent_payout_methods'][$key]);
                    continue;
                }

                $all[] = $setting_values['agent_payout_methods'][$key]['id'];
            }

            $setting_values['agent_payout_methods'] = array_values($setting_values['agent_payout_methods']);
        }
        return $setting_values;
    }

}
