<?php
namespace Modules\Booking\Controllers;

use App\Http\Controllers\Controller;
use Modules\Hotel\Models\Hotel;
use Illuminate\Http\Request;
use Modules\Location\Models\Location;
use Modules\Location\Models\LocationCategory;
use Modules\Review\Models\Review;
use Modules\Core\Models\Attributes;
use DB;
use Illuminate\Support\Facades\Log;
use Modules\Space\Models\Space;
use Modules\Template\Models\Template;

use Modules\Tour\Models\Tour;
use Modules\Tour\Models\TourCategory;


class AgentTourController extends Controller {

    protected $tourClass;
    protected $locationClass;
    protected $tourCategoryClass;
    protected $attributesClass;

    public function __construct(Tour $tour){
        $this->tourClass = $tour;
        $this->locationClass = Location::class;
        $this->tourCategoryClass = TourCategory::class;
        $this->attributesClass = Attributes::class;
    }
    public function callAction($method, $parameters){
        if(setting_item('tour_disable')){
            return redirect('/agent/booking/make/booked');
        }
        return parent::callAction($method, $parameters); // TODO: Change the autogenerated stub
    }

    public function index(Request $request){

        $layout = setting_item("tour_layout_search", 'normal');
        if ($request->query('_layout')) {
            $layout = $request->query('_layout');
        }
        $is_ajax = $request->query('_ajax');
        $for_map = $request->query('_map',$layout === 'map');

        if(!empty($request->query('limit'))){
            $limit = $request->query('limit');
        }else{
            $limit = !empty(setting_item("tour_page_limit_item"))? setting_item("tour_page_limit_item") : 9;
        }
        $query = $this->tourClass->search($request->input());
        $list = $query->paginate($limit);

        $markers = [];
        if (!empty($list) and $for_map) {
            foreach ($list as $row) {
                $markers[] = [
                    "id" => $row->id,
                    "title" => $row->title,
                    "lat" => (float)$row->map_lat,
                    "lng" => (float)$row->map_lng,
                    "gallery" => $row->getGallery(true),
                    "infobox" => view('Tour::frontend.layouts.search.loop-grid', ['row' => $row, 'disable_lazyload' => 1, 'wrap_class' => 'infobox-item'])->render(),
                    'marker' => get_file_url(setting_item("tour_icon_marker_map"),'full') ?? url('images/icons/png/pin.png'),
                ];
            }
        }
        $limit_location = 15;
        if( empty(setting_item("tour_location_search_style")) or setting_item("tour_location_search_style") == "normal" ){
            $limit_location = 1000;
        }
        $data = [
            'rows' => $list,
            'layout'=>$layout
        ];
        if ($is_ajax) {
            return $this->sendSuccess([
                "markers" => $markers,
                'fragments'=>[
                    '.ajax-search-result'=>view('Agent::frontend.Tour.ajax.search-result'.($for_map ? '-map' : ''), $data)->render(),
                    '.result-count'=>$list->total() ? ($list->total() > 1 ? __(":count tours found",['count'=>$list->total()]) : __(":count tour found",['count'=>$list->total()])) : '',
                    '.count-string'=> $list->total() ? __("Showing :from - :to of :total Tours",["from"=>$list->firstItem(),"to"=>$list->lastItem(),"total"=>$list->total()]) : ''
                ]
            ]);
        }


        // Search Form
        $template = Template::where('id', 1)->first();
        $type = 'agent_booking_search_form';
        $model = $request->input('model', [
            'title'=>'Hi There!',
            'sub_title'=>'Where would you like to go?',
            'service_types' => [
                "hotel",
                "space",
                "tour",
                "car",
                "event",
                "flight",
                "boat",
            ],
        ]);
        $search_option = $template->getPreview($type, $model);
        // Search Form

        $data = [
            'is_tour'              => true,
            'search_option'         => $search_option,
            'rows' => $list,
            'tour_category' => $this->tourCategoryClass::where('status', 'publish')->with(['translation'])->get()->toTree(),
            'tour_location' => $this->locationClass::where('status', 'publish')->with(['translation'])->limit($limit_location)->get()->toTree(),
            'tour_min_max_price' => $this->tourClass::getMinMaxPrice(),
            'markers' => $markers,
            "blank" => setting_item('search_open_tab') == "current_tab" ? 0 : 1 ,
            "seo_meta" => $this->tourClass::getSeoMetaForPageList(),
            'layout'=>$layout
        ];
        $data['attributes'] = $this->attributesClass::where('service', 'tour')->orderBy("position","desc")->with(['terms'=>function($query){
            $query->withCount('tour');
        },'translation'])->get();
        if ($layout == "map") {
            $data['body_class'] = 'has-search-map';
            $data['html_class'] = 'full-page';
            return view('Tour::frontend.search-map', $data);
        }
        return view('Agent::frontend.booking.create', $data);
    }


    public function detail(Request $request, $slug)
    {
        $row = $this->tourClass::where('slug', $slug)->with(['location','translation','hasWishList'])->first();
        if ( empty($row) or !$row->hasPermissionDetailView()) {
            return redirect('/');
        }
        $translation = $row->translate();
        $tour_related = [];
        $location_id = $row->location_id;
        if (!empty($location_id)) {
            $tour_related = $this->tourClass::where('location_id', $location_id)->where("status","publish")->take($this->limitRelated ?? 4)->whereNotIn('id', [$row->id])->with(['location','translation','hasWishList'])->get();
        }
        $review_list = $row->getReviewList();

        $data = [
            'row' => $row,
            'translation' => $translation,
            'tour_related' => $tour_related,
            'booking_data' => $row->getBookingData(),
            'review_list' => $review_list,
            'seo_meta' => $row->getSeoMetaWithTranslation(app()->getLocale(), $translation),
            'body_class'=>'is_single',
            'breadcrumbs'       => [
                [
                    'name'  => __('Tour'),
                    'url'  => route('tour.search'),
                ],
            ],
        ];
        $data['breadcrumbs'] = array_merge($data['breadcrumbs'],$row->locationBreadcrumbs());
        $data['breadcrumbs'][] = [
            'name'  => $translation->title,
            'class' => 'active'
        ];
        $this->setActiveMenu($row);
        return view('Agent::frontend.Tour.detail', $data);
    }

}
