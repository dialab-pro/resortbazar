<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 7/30/2019
 * Time: 1:56 PM
 */

namespace Modules\Boat\Admin;

use App\Traits\FileUploader;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Modules\AdminController;
use Modules\Boat\Models\Boat;
use Modules\Boat\Models\BoatCabin;
use Modules\Boat\Models\BoatDestination;
use Modules\Boat\Models\BoatFeature;
use Modules\Boat\Models\BoatTerm;
use Modules\Boat\Models\BoatTranslation;
use Modules\Core\Events\CreatedServicesEvent;
use Modules\Core\Events\UpdatedServiceEvent;
use Modules\Core\Models\Attributes;
use Modules\Location\Models\Location;

class BoatController extends AdminController
{
    protected $boat;
    protected $boat_translation;
    protected $boat_term;
    protected $attributes;
    protected $location;
    use FileUploader;

    public function __construct(Boat $boat, BoatTranslation $boat_translation, BoatTerm $boat_term, Attributes $attributes, Location $location)
    {
        $this->setActiveMenu(route('boat.admin.index'));
        $this->boat = $boat;
        $this->boat_translation = $boat_translation;
        $this->boat_term = $boat_term;
        $this->attributes = $attributes;
        $this->location = $location;
    }



    public function index()
    {
        $boats = Boat::latest()->get();
        return view('Boat::admin.boat.index', ['boats' => $boats]);
    }


    public function create()
    {
        $destinations = BoatDestination::get();
        return view('Boat::admin.boat.create', ['destinations' => $destinations]);
    }



    public function store(Request $request)
    {
        // Validate the incoming request data
        $request->validate([
            'destination_id'         => 'required',
            'title'                  => 'required',
            'slug'                   => 'required|unique:bravo_boats,slug',
            'short_description'      => 'nullable',
            'long_description'       => 'nullable',
            'status'                 => 'required',
            'boat_price'             => 'required',
            'check_in_time'          => 'required',
            'check_out_time'         => 'required',
            'booking_percentage'     => 'nullable',
            'features'               => 'nullable',
            'image'                  => 'nullable',
            'banner_image'           => 'nullable',
            'cabin_title'            => 'nullable',
            'cabin_slug'             => 'nullable',
            'cabin_type'             => 'nullable',
            'cabin_price'            => 'nullable',
            'cabin_person'           => 'nullable',
            'cabin_extra_person_fee' => 'nullable',
            'cabin_feature'          => 'nullable',
            'cabin_image'            => 'nullable',
            'cabin_image.*'          => 'nullable'
        ]);

        $boatPerson = $request->input('boat_person');
        $boatPersonPrice = $request->input('boat_person_price');

        $boatPersonPriceData = [];

        foreach ($boatPerson as $key => $personRange) {
            $boatPersonPriceData[] = [
                'person_range' => $personRange,
                'price' => $boatPersonPrice[$key],
            ];
        }
        // Create the boat
        $boat = Boat::create([
            'destination_id'         => $request->input('destination_id'),
            'title'                  => $request->input('title'),
            'slug'                   => $request->input('slug'),
            'short_description'      => $request->input('short_description'),
            'long_description'       => $request->input('long_description'),
            'status'                 => $request->input('status'),
            'map_link'               => $request->input('map_link') ?? '',
            'food_menu'              => $request->input('food_menu') ?? '',
            'restriction'            => $request->input('restriction') ?? '',
            'smoking_rule'           => $request->input('smoking_rule') ?? '',
            'pets_policy'            => $request->input('pets_policy') ?? '',
            'child_policy'           => $request->input('child_policy') ?? '',
            'extra_bed_policy'       => $request->input('extra_bed_policy') ?? '',
            'cancelation_policy'     => $request->input('cancelation_policy') ?? '',
            'boat_price'             => $request->input('boat_price'),
            'check_in_time'          => $request->input('check_in_time'),
            'check_out_time'         => $request->input('check_out_time'),
            'booking_percentage'     => $request->input('booking_percentage') ?? '',
            'features'               => $request->input('boat_feature') ? json_encode($request->input('boat_feature')) : '[]',
            'boat_persons_price'     => $request->input('boat_person') ? json_encode($boatPersonPriceData) : '[]',
        ]);

        // Upload boat images (primary image and banner)
        if ($request->hasFile('image')) {
            $this->uploadImages($request->image, 'Boat', $boat, 'image', 'image', 450, 400);
        }
        if ($request->hasFile('banner_image')) {
            $this->uploadImage($request->banner_image, 'Boat', $boat, 'banner_image', 'image/banner', 1920, 600);
        }

        // Create cabins for the boat, if available
        if ($request->cabin_title) {
            foreach ($request->cabin_title as $key => $cabinTitle) {
                $boatCabin = BoatCabin::create([
                    'boat_id'           => $boat->id,
                    'title'             => $cabinTitle,
                    'slug'              => $request->cabin_slug[$key],
                    'type'              => $request->cabin_type[$key],
                    'price'             => $request->cabin_price[$key],
                    'person'            => $request->cabin_person[$key],
                    'extra_person_fee'  => $request->cabin_extra_person_fee[$key],
                    'cabin_feature'     => isset($request->cabin_feature[$key]) ? json_encode($request->cabin_feature[$key]) : '[]'
                ]);

                // Upload cabin images if they exist
                if (isset($request->cabin_image[$key])) {
                    $this->uploadImages($request->cabin_image[$key], 'Boat', $boatCabin, 'image', 'boatCabin/image', 400, 400);
                }
            }
        }

        if ($request->check_in_date) {
            foreach ($request->check_in_date as $key => $checkInDate) {
                $boat->boatSchedule()->create([
                    'check_in_date'     => $checkInDate,
                    'check_out_date'    => $request->check_out_date[$key]
                ]);
            }
        }

        // Redirect back to boat admin index with success message
        return redirect()->route('boat.admin.index')->with('success', __('Boat created successfully!'));
    }



    public function edit(Request $request, $id)
    {
        $destinations = BoatDestination::latest()->get();
        $boat = Boat::with('boatSchedule')->find($id);
        return view('Boat::admin.boat.edit', ['destinations' => $destinations, 'boat' => $boat]);
    }


    public function update(Request $request, $id)
    {
        // Find the boat by ID
        $boat = Boat::findOrFail($id);

        // Validate the incoming request data
        $request->validate([
            'destination_id'         => 'required',
            'title'                  => 'required',
            'slug'                   => 'required|unique:bravo_boats,slug,' . $boat->id, // ignore current slug
            'short_description'      => 'nullable',
            'long_description'       => 'nullable',
            'status'                 => 'required',
            'boat_price'             => 'required',
            'check_in_time'          => 'required',
            'check_out_time'         => 'required',
            'booking_percentage'     => 'nullable',
            'features'               => 'nullable',
            'image'                  => 'nullable',
            'banner_image'           => 'nullable',
            'cabin_title'            => 'nullable',
            'cabin_slug'             => 'nullable',
            'cabin_type'             => 'nullable',
            'cabin_price'            => 'nullable',
            'cabin_person'           => 'nullable',
            'cabin_extra_person_fee' => 'nullable',
            'cabin_feature'          => 'nullable',
            'cabin_image'            => 'required',
            'cabin_image.*'          => 'required'
        ]);

        $boatPerson = $request->input('boat_person');
        $boatPersonPrice = $request->input('boat_person_price');

        $boatPersonPriceData = [];

        if ($boatPerson) {
            foreach ($boatPerson as $key => $personRange) {
                $boatPersonPriceData[] = [
                    'person_range' => $personRange,
                    'price'        => $boatPersonPrice[$key],
                ];
            }
        }

        // Update the boat details
        $boat->update([
            'destination_id'         => $request->input('destination_id'),
            'title'                  => $request->input('title'),
            'slug'                   => $request->input('slug'),
            'short_description'      => $request->input('short_description'),
            'long_description'       => $request->input('long_description'),
            'status'                 => $request->input('status'),
            'map_link'               => $request->input('map_link') ?? '',
            'food_menu'              => $request->input('food_menu') ?? '',
            'restriction'            => $request->input('restriction') ?? '',
            'smoking_rule'           => $request->input('smoking_rule') ?? '',
            'pets_policy'            => $request->input('pets_policy') ?? '',
            'child_policy'           => $request->input('child_policy') ?? '',
            'extra_bed_policy'       => $request->input('extra_bed_policy') ?? '',
            'cancelation_policy'     => $request->input('cancelation_policy') ?? '',
            'boat_price'             => $request->input('boat_price'),
            'check_in_time'          => $request->input('check_in_time'),
            'check_out_time'         => $request->input('check_out_time'),
            'booking_percentage'     => $request->input('booking_percentage') ?? '',
            'features'               => $request->input('boat_feature') ? json_encode($request->input('boat_feature')) : '[]',
            'boat_persons_price'     => $boatPerson ? json_encode($boatPersonPriceData) : '[]',
        ]);

        // Upload and update boat images
        if ($request->hasFile('image')) {
            $this->uploadImages($request->image, 'Boat', $boat, 'image', 'image', 450, 400);
        }
        if ($request->hasFile('banner_image')) {
            $this->uploadImage($request->banner_image, 'Boat', $boat, 'banner_image', 'image/banner', 1920, 600);
        }

        // Update cabins if available
        if ($request->cabin_title) {
            // Unlink old cabin images before deleting the records
            foreach ($boat->boatCabin as $existingCabin) {
                if ($existingCabin->image) {
                    $cabinImages = json_decode($existingCabin->image, true); // decode image json
                    if ($cabinImages && is_array($cabinImages)) {
                        foreach ($cabinImages as $cabinimage) {
                            if (file_exists($cabinimage)) {
                                unlink($cabinimage); // delete the file from the server
                            }
                        }
                    }
                }
            }

            // Now delete the old cabins
            $boat->boatCabin()->delete();

            // Create new cabins with updated data
            foreach ($request->cabin_title as $key => $cabinTitle) {
                $boatCabin = BoatCabin::create([
                    'boat_id'           => $boat->id,
                    'title'             => $cabinTitle,
                    'slug'              => $request->cabin_slug[$key],
                    'type'              => $request->cabin_type[$key],
                    'price'             => $request->cabin_price[$key],
                    'person'            => $request->cabin_person[$key],
                    'extra_person_fee'  => $request->cabin_extra_person_fee[$key],
                    'cabin_feature'     => isset($request->cabin_feature[$key]) ? json_encode($request->cabin_feature[$key]) : '[]'
                ]);

                // Upload new cabin images if they exist
                if (isset($request->cabin_image[$key])) {
                    $this->uploadImages($request->cabin_image[$key], 'Boat', $boatCabin, 'image', 'boatCabin/image', 400, 400);
                }
            }
        }
        // Update schedule if available
        if ($request->check_in_date) {
            $boat->boatSchedule()->delete(); // remove previous schedule
            foreach ($request->check_in_date as $key => $checkInDate) {
                $boat->boatSchedule()->create([
                    'check_in_date'  => $checkInDate,
                    'check_out_date' => $request->check_out_date[$key],
                ]);
            }
        }

        // Redirect back to boat admin index with success message
        return redirect()->route('boat.admin.index')->with('success', __('Boat updated successfully!'));
    }



    public function delete($id)
    {
        $boat = Boat::find($id);
        $boatImage = json_decode($boat->image);
        if ($boat && $boatImage) {
            foreach ($boatImage as $value) {
                if (file_exists($value)) {
                    unlink($value);
                }
            }
        }
        if ($boat && file_exists($boat->banner_image)) {
            unlink($boat->banner_image);
        }
        $boatCabin = $boat->boatCabin;

        foreach ($boatCabin as $cabin) {
            $cabinImage = json_decode($cabin->image);

            foreach ($cabinImage as $image) {
                // dd($image);
                if (file_exists($image)) {
                    unlink($image);
                }
            }
        }
        $boat->boatCabin()->delete();
        $boat->delete();
        return redirect()->back()->with('success', __('Boat Delete Success!'));
    }



    public function boatDestination()
    {
        $boatDestinations = BoatDestination::get();
        return view('Boat::admin.boatDestination.index', ['boatDestinations' => $boatDestinations]);
    }


    public function boatDestinationCreate()
    {
        return view('Boat::admin.boatDestination.create');
    }


    public function boatDestinationStore(Request $request)
    {
        // dd($request->all());
        $request->validate([]);
        $boatDestination = BoatDestination::create([
            'title' => $request->input('title'),
            'slug' => $request->input('slug'),
            'status' => $request->input('status'),
            'short_description' => $request->input('short_description'),
            'long_description' => $request->input('long_description'),
        ]);
        if ($request->hasFile('image')) {
            $this->uploadImage($request->image, 'Boat', $boatDestination, 'image', 'boatDestination/image', 400, 200);
        }
        if ($request->hasFile('banner_image')) {
            $this->uploadImage($request->banner_image, 'Boat', $boatDestination, 'banner_image', 'boatDestination/bannerImage', 1200, 400);
        }

        return redirect()->back()->with('success', __('Boat Destination Created success!'));
    }

    public function boatDestinationEdit($id)
    {
        $boatDestination = BoatDestination::find($id);
        return view('Boat::admin.boatDestination.edit', ['boatdestination' => $boatDestination]);
    }


    public function boatDestinationUpdate(Request $request, $id)
    {
        $request->validate([]);
        $boatDestination = BoatDestination::find($id);
        $boatDestination->update([
            'title' => $request->input('title'),
            'slug' => $request->input('slug'),
            'status' => $request->input('status'),
            'short_description' => $request->input('short_description'),
            'long_description' => $request->input('long_description'),
        ]);
        if ($request->hasFile('image')) {
            $this->uploadImage($request->image, 'Boat', $boatDestination, 'image', 'boatDestination/image', 400, 200);
        }
        if ($request->hasFile('banner_image')) {
            $this->uploadImage($request->banner_image, 'Boat', $boatDestination, 'banner_image', 'boatDestination/bannerImage', 1200, 400);
        }


        return redirect()->back()->with('success', __('Boat Destination updated success!'));
    }


    public function boatDestinationDelete($id)
    {
        $boatDestination = BoatDestination::find($id);
        if ($boatDestination && file_exists($boatDestination->image)) {
            unlink($boatDestination->image);
        }
        $boatDestination->delete();
        return redirect()->back()->with('success', __('Boat Destination Delete success!'));
    }



    //Boat Cabin Function
    public function boatCabin()
    {
        $boatCabins = BoatCabin::latest()->get();
        return view('Boat::admin.boatCabin.index', ['boatCabins' => $boatCabins]);
    }


    public function boatCabinCreate()
    {
        $boats = Boat::latest()->get();
        return view('Boat::admin.boatCabin.create', ['boats' => $boats]);
    }


    public function boatCabinStore(Request $request)
    {

        $request->validate([]);
        $boatCabin = BoatCabin::create([
            'boat_id' => $request->input('boat_id'),
            'title' => $request->input('title'),
            'slug' => $request->input('slug'),
            'type' => $request->input('type'),
            'price' => $request->input('price'),
            'person' => $request->input('person'),
            'extra_person_fee' => $request->input('extra_person_fee'),
            'cabin_feature' => json_encode($request->input('cabin_feature')),
        ]);
        if ($request->image) {
            $this->uploadImages($request->image, 'Boat', $boatCabin, 'image', 'boatCabin/image', 400, 400);
        }
        return redirect()->route('boatCabin.admin.index')->with('success', __('Boat Cabin Created success!'));
    }

    public function boatCabinEdit($id)
    {
        $boatCabin = BoatCabin::find($id);
        $boats = Boat::latest()->get();
        return view('Boat::admin.boatCabin.edit', ['boatCabin' => $boatCabin, 'boats' => $boats]);
    }


    public function boatCabinUpdate(Request $request, $id)
    {
        // Debugging request data
        // dd($request->all());

        $boatCabin = BoatCabin::find($id);

        // Validate the request
        $request->validate([
            'boat_id' => 'required',
            'title' => 'required|string|max:255',
            'slug' => 'required|string|max:255',
            'type' => 'required|string',
            'price' => 'required|numeric',
            'person' => 'required|integer',
            'extra_person_fee' => 'nullable|numeric',
            'cabin_feature' => 'nullable|array',
            'image.*' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048', // validation for images
        ]);

        // Update the BoatCabin attributes
        $boatCabin->update([
            'boat_id' => $request->input('boat_id'),
            'title' => $request->input('title'),
            'slug' => $request->input('slug'),
            'type' => $request->input('type'),
            'price' => $request->input('price'),
            'person' => $request->input('person'),
            'extra_person_fee' => $request->input('extra_person_fee'),
            'cabin_feature' => json_encode($request->input('cabin_feature')),
        ]);
        if ($request->image) {
            $this->uploadImages($request->image, 'Boat', $boatCabin, 'image', 'boatCabin/image', 400, 400);
        }

        return redirect()->route('boatCabin.admin.index')->with('success', __('Boat Cabin Update success!'));
    }



    public function boatCabinDelete($id)
    {
        $boatCabin = BoatCabin::find($id);
        $boatCabin->delete();
        return redirect()->back()->with('success', __('Boat Cabin Deleted success!'));
    }
}
