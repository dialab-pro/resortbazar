<?php

namespace App\Console\Commands;

use Carbon\Carbon;
use Illuminate\Console\Command;
use Modules\Boat\Models\Boat;
use Modules\Boat\Models\BoatSchedule;

class GenerateBoatSchedules extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'schedule:generate-boats';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Automatically generate the next schedule for all boats';

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $boats = Boat::all();

        foreach ($boats as $boat) {
            $latestSchedule = $boat->boatSchedule()->orderBy('ghat_leaving_date', 'desc')->first();
            if ($latestSchedule) {
                // Check if the monthly_schedule is null
                if (is_null($latestSchedule->monthly_schedule)) {
                    // Initialize array to store the next 30 days of schedule
                    $monthlySchedule = [];

                    // Use the current next leaving date to start generating the schedule
                    $nextLeavingDate = Carbon::parse($latestSchedule->next_ghat_leaving_date);
                    // Loop to generate the schedule for the next 30 days and store in JSON format
                    for ($i = 0; $i < 30; $i++) {
                        $newLeavingDate = $nextLeavingDate->copy()->addDays($i * ($boat->leave_days + $boat->not_available_days + $boat->rest_days));
                        $newRestStartDate = $newLeavingDate->copy()->addDays($boat->not_available_days);
                        $newRestEndDate = $newRestStartDate->copy()->addDays($boat->rest_days - 1);
                        $newNextAvailableDate = $newRestEndDate->copy()->addDay();
                        $newNextLeavingDate = $newNextAvailableDate->copy()->addDays($boat->leave_days);

                        // Add each day's schedule to the monthlySchedule array
                        $monthlySchedule[] = [
                            'ghat_leaving_date' => $newLeavingDate->startOfDay()->format('Y-m-d'),
                            'ghat_leaving_time' => $latestSchedule->ghat_leaving_time,
                            'ghat_available_date' => $newNextAvailableDate->startOfDay()->format('Y-m-d'),
                            'rest_start_date' => $newRestStartDate->startOfDay()->format('Y-m-d'),
                            'rest_end_date' => $newRestEndDate->startOfDay()->format('Y-m-d'),
                            // Temporarily set the next leaving date, which will be adjusted in the next step
                            'next_ghat_leaving_date' => $newNextLeavingDate->startOfDay()->format('Y-m-d')
                        ];

                        // Update next leaving date for the next iteration
                        $nextLeavingDate = $newNextLeavingDate;
                    }
                    dd($nextLeavingDate,$newLeavingDate,$newRestStartDate,$newRestEndDate, $newNextAvailableDate, $newNextLeavingDate, $monthlySchedule);

                    // Now adjust the `next_ghat_leaving_date` for each row to point to the next row's `ghat_leaving_date`
                    for ($i = 0; $i < count($monthlySchedule) - 1; $i++) {
                        $monthlySchedule[$i]['next_ghat_leaving_date'] = $monthlySchedule[$i + 1]['ghat_leaving_date'];
                    }

                    // For the last entry, you may want to set a default or keep the value from the last iteration
                    $monthlySchedule[count($monthlySchedule) - 1]['next_ghat_leaving_date'] = $newNextLeavingDate->startOfDay()->format('Y-m-d');

                    // Update today's regular schedule with the first entry from the newly generated schedule
                    $newLeavingDate = Carbon::parse($monthlySchedule[0]['ghat_leaving_date']);
                    $newNextAvailableDate = Carbon::parse($monthlySchedule[0]['ghat_available_date']);
                    $newRestStartDate = Carbon::parse($monthlySchedule[0]['rest_start_date']);
                    $newRestEndDate = Carbon::parse($monthlySchedule[0]['rest_end_date']);
                    $newNextLeavingDate = Carbon::parse($monthlySchedule[0]['next_ghat_leaving_date']);

                    // Update the regular schedule and store the newly generated monthly schedule
                    $latestSchedule->update([
                        'ghat_leaving_date' => $newLeavingDate->startOfDay()->format('Y-m-d'),
                        'ghat_leaving_time' => $latestSchedule->ghat_leaving_time,
                        'ghat_available_date' => $newNextAvailableDate->startOfDay()->format('Y-m-d'),
                        'rest_start_date' => $newRestStartDate->startOfDay()->format('Y-m-d'),
                        'rest_end_date' => $newRestEndDate->startOfDay()->format('Y-m-d'),
                        'next_ghat_leaving_date' => $newNextLeavingDate->startOfDay()->format('Y-m-d'),
                        'monthly_schedule' => json_encode($monthlySchedule) // Store the next 30 days in JSON format
                    ]);

                    $this->info('Monthly schedule generated and updated for Boat ID: ' . $boat->id);
                } else {
                    // If monthly_schedule is not null, proceed with regular schedule update based on today's date
                    $nextLeavingDate = Carbon::parse($latestSchedule->next_ghat_leaving_date);
                    if ($nextLeavingDate->isToday()) {
                        $monthlySchedule = json_decode($latestSchedule->monthly_schedule, true); // Decode existing monthly schedule

                        // Update the regular schedule for today based on the first entry of the monthly schedule
                        $newLeavingDate = Carbon::parse($monthlySchedule[0]['ghat_leaving_date']);
                        $newNextAvailableDate = Carbon::parse($monthlySchedule[0]['ghat_available_date']);
                        $newRestStartDate = Carbon::parse($monthlySchedule[0]['rest_start_date']);
                        $newRestEndDate = Carbon::parse($monthlySchedule[0]['rest_end_date']);
                        $newNextLeavingDate = Carbon::parse($monthlySchedule[0]['next_ghat_leaving_date']);

                        // Update the regular schedule fields with today's new schedule
                        $latestSchedule->update([
                            'ghat_leaving_date' => $newLeavingDate->startOfDay()->format('Y-m-d'),
                            'ghat_leaving_time' => $latestSchedule->ghat_leaving_time,
                            'ghat_available_date' => $newNextAvailableDate->startOfDay()->format('Y-m-d'),
                            'rest_start_date' => $newRestStartDate->startOfDay()->format('Y-m-d'),
                            'rest_end_date' => $newRestEndDate->startOfDay()->format('Y-m-d'),
                            'next_ghat_leaving_date' => $newNextLeavingDate->startOfDay()->format('Y-m-d'),
                        ]);

                        $this->info('Regular schedule updated for Boat ID: ' . $boat->id);
                    } else {
                        $this->info("Today is not the next leaving date for Boat ID: " . $boat->id);
                    }
                }
            }
        }
        $this->info('Boat schedules generation completed.');
    }
}
