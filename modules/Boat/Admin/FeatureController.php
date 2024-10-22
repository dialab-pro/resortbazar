<?php

namespace Modules\Boat\Admin;

use Modules\AdminController;
use Illuminate\Http\Request;
use Modules\Boat\Models\Boat;
use Modules\Boat\Models\BoatFeature;



class FeatureController extends AdminController
{
    public function index()
    {
        $features = BoatFeature::latest()->get();
        return view('Boat::admin.boatFeatures.index', ['features' => $features]);
    }


    public function create()
    {
        $boats = Boat::latest()->get();
        return view('Boat::admin.boatFeatures.create', ['boats' => $boats]);
    }


    public function store(Request $request)
    {
        $request->validate([]);
        BoatFeature::create([
            'boat_id'   => $request->input('boat_id'),
            'title'     => $request->input('title'),
            'description' => $request->input('description'),
            'status' => $request->input('status') ?? '0',
        ]);
        return redirect()->route('feature.admin.index')->with('success', __('Feature Created Success!'));
    }

    public function edit($id)
    {
        $feature = BoatFeature::find($id);
        $boats = Boat::latest()->get();
        return view('Boat::admin.boatFeatures.edit', [
            'feature' => $feature,
            'boats'   => $boats
        ]);
    }


    public function update(Request $request, $id)
    {
        $feature = BoatFeature::find($id);
        $request->validate([]);
        $feature->update([
            'boat_id'   => $request->input('boat_id'),
            'title'     => $request->input('title'),
            'description' => $request->input('description'),
            'status' => $request->input('status') ?? '0',
        ]);

        return redirect()->route('feature.admin.index')->with('success', __('Feature Update Success!'));
    }


    public function delete($id)
    {
        $feature = BoatFeature::find($id);
        $feature->delete();

        return redirect()->back()->with('success', __('Feature Delete Success!'));
    }
}
