<?php
namespace Modules\Agent\Blocks;

use App\User;
use Modules\Template\Blocks\BaseBlock;

use Modules\Tour\Models\Tour;
use Modules\Tour\Models\TourCategory;
use Modules\Location\Models\Location;

class ListAgent extends BaseBlock {

    function getOptions(){
        return ([
            'settings' => [
                [
                    'id'        => 'title',
                    'type'      => 'input',
                    'inputType' => 'text',
                    'label'     => __('Title')
                ],
                [
                    'id'        => 'desc',
                    'type'      => 'input',
                    'inputType' => 'text',
                    'label'     => __('Desc')
                ],
                [
                    'id'        => 'number',
                    'type'      => 'input',
                    'inputType' => 'number',
                    'label'     => __('Number Item')
                ],
                [
                    'id'            => 'order',
                    'type'          => 'radios',
                    'label'         => __('Order'),
                    'values'        => [
                        [
                            'value'   => 'id',
                            'name' => __("Date Create")
                        ],
                    ]
                ],
                [
                    'id'            => 'order_by',
                    'type'          => 'radios',
                    'label'         => __('Order By'),
                    'values'        => [
                        [
                            'value'   => 'asc',
                            'name' => __("ASC")
                        ],
                        [
                            'value'   => 'desc',
                            'name' => __("DESC")
                        ],
                    ]
                ],
                [
                    'id'           => 'custom_ids',
                    'type'         => 'select2',
                    'label'        => __('List by IDs'),
                    'select2'      => [
                        'ajax'     => [
                            'url'      => route('user.admin.getForSelect2',['user_type'=>'agent']),
                            'dataType' => 'json'
                        ],
                        'width'    => '100%',
                        'multiple' => "true",
                        'placeholder' => __('-- Select --')
                    ],
                    'pre_selected' => route('user.admin.getForSelect2', [
                        'pre_selected' => 1
                    ])
                ],
            ],
            'category'=>__("Other Block")
        ]);
    }

    public function getName(){
        return __('List Agent');
    }

    public function content($model = []){
        $list = $this->query($model);
        $data = [
            'rows'       => $list,
            'title'      => $model['title'] ?? "",
            'desc'      => $model['desc'] ?? "",
        ];
        return view('Agent::frontend.blocks.list-agent.index', $data);
    }

    public function contentAPI($model = []){
        $rows = $this->query($model);
        $model['data']= $rows;
        return $model;
    }

    public function query($model){
        $list_user = User::query();
        if(empty($model['order'])) $model['order'] = "id";
        if(empty($model['order_by'])) $model['order_by'] = "desc";
        if(empty($model['number'])) $model['number'] = 5;
        if(!empty( $model['custom_ids'] )){
            $list_user->whereIn("id",$model['custom_ids']);
        }
        $list_user->role("agent");
        $list_user->where("status", "publish");
        $list_user->groupBy("id");
        $list_user->orderBy($model['order'], $model['order_by']);
        return $list_user->limit($model['number'])->get();
    }
}
