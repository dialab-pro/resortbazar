<?php

namespace Modules\Boat\Admin;

use Modules\AdminController;
use Illuminate\Http\Request;
use Modules\Boat\Models\Boat;
use Modules\Boat\Models\BoatSchedule;

class ScheduleController extends AdminController
{

    public function index()
    {
        $schedules = BoatSchedule::latest()->get();
        return view('Boat::admin.boatSchedule.index', ['schedules' => $schedules]);
    }


    public function create()
    {
        $boats = Boat::latest()->get();
        return view('Boat::admin.boatSchedule.create', ['boats' => $boats]);
    }

    public function store(Request $request)
    {
        $request->validate([
            'boat_id' => 'required|unique:boat_schedules,boat_id',
            'booking_available' => 'required|array',
            'ghat_leaving_date' => 'required|array',
        ]);
        BoatSchedule::create([
            'boat_id' => $request->input('boat_id'),
            'booking_available_date' => json_encode($request->input('booking_available')),
            'ghat_leaving_date' => json_encode($request->input('ghat_leaving_date')),
        ]);
        return redirect()->route('schedule.admin.index')->with('success', __('Schedule Created Success!'));
    }


    public function edit($id)
    {

        $schedule = BoatSchedule::findOrFail($id);
        $boats = Boat::all();
        $schedule->booking_available_date = json_decode($schedule->booking_available_date);
        $schedule->ghat_leaving_date = json_decode($schedule->ghat_leaving_date);
        return view('Boat::admin.boatSchedule.edit', compact('schedule', 'boats'));
    }



    public function update(Request $request, $id)
    {
        $request->validate([
            'boat_id' => 'required|exists:bravo_boats,id',
            'booking_available' => 'required|array|min:1',
            'booking_available.*' => 'required|date',
            'ghat_leaving_date' => 'required|array|min:1',
            'ghat_leaving_date.*' => 'required|date',
        ]);
        $schedule = BoatSchedule::findOrFail($id);
        $schedule->boat_id = $request->input('boat_id');
        $schedule->booking_available_date = json_encode($request->input('booking_available'));
        $schedule->ghat_leaving_date = json_encode($request->input('ghat_leaving_date'));
        $schedule->save();
        return redirect()->route('schedule.admin.index')->with('success', __('Schedule updated successfully!'));
    }



    public function delete($id)
    {
        $schedule = BoatSchedule::find($id);
        $schedule->delete();
        return redirect()->route('schedule.admin.index')->with('success', "Schedule Delete Success");
    }
}
