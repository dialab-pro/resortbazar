<?php
namespace Modules\Template\Blocks;

use Modules\Media\Helpers\FileHelper;

class Testimonial extends BaseBlock
{



    public function getOptions(){
        return [
            'settings' => [
                [
                    'id'        => 'title',
                    'type'      => 'input',
                    'inputType' => 'text',
                    'label'     => __('Title')
                ],
                [
                    'id'        => 'number',
                    'type'      => 'input',
                    'inputType' => 'number',
                    'label'     => __('Number Item')
                ],
                [
                    'id'            => 'style',
                    'type'          => 'radios',
                    'label'         => __('Style'),
                    'values'        => [
                        [
                            'value'   => 'normal',
                            'name' => __("Normal")
                        ],
                        [
                            'value'   => 'carousel',
                            'name' => __("Slider Carousel")
                        ]
                    ]
                ],
                [
                    'id'          => 'list_item',
                    'type'        => 'listItem',
                    'label'       => __('List Item(s)'),
                    'title_field' => 'title',
                    'settings'    => [
                        [
                            'id'        => 'name',
                            'type'      => 'input',
                            'inputType' => 'text',
                            'label'     => __('Name')
                        ],
                        [
                            'id'    => 'desc',
                            'type'  => 'textArea',
                            'label' => __('Desc')
                        ],

                        [
                            'id'        => 'number_star',
                            'type'      => 'input',
                            'inputType' => 'number',
                            'label'     => __('Number star')
                        ],
                        [
                            'id'    => 'avatar',
                            'type'  => 'uploader',
                            'label' => __('Avatar Image')
                        ],
                    ]
                ],
            ],
            'category'=>__("Other Block")
        ];
    }

    public function getName()
    {
        return __('List Testimonial');
    }

    public function content($model = [])
    {

        $list = $model['list_item'];
        // $list = $this->query($model);
        $data = [
            'rows'       => $list,
            'style_list' => $model['style'],
            'title'      => $model['title']
        ];

        return view('Template::frontend.blocks.testimonial.index', $data);

    }

    public function contentAPI($model = []){
        if(!empty($model['list_item'])){
            foreach (  $model['list_item'] as &$item ){
                $item['avatar_url'] = FileHelper::url($item['avatar'], 'full');
            }
        }
        return $model;
    }


    public function query($model){
        $listCar = $model['list_item'];
        $limit = $model['number'] ?? 3;
        return $listCar->paginate($limit);
    }

}
