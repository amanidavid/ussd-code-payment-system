<?php

namespace App\Livewire;

use Livewire\Component;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Attendance;
use App\Models\User;

class AttandenceRecord extends Component
{
    public function render()
    {
        return view('livewire.attandence-record');
    }

    
    public function updateAttendance(Request $request)
    {
        // Validate the request
        $request->validate([
            'uid' => 'required|string', // Add any additional validation rules here
        ]);

        // Retrieve the UID from the request
        $uid = $request->input('uid');

        // Find the user by UID (assuming you have a column 'uid' in the 'users' table)
        $user = User::where('uid', $uid)->first();

        if ($user) {
            // Create or update the attendance record
            $attendance = Attendance::updateOrCreate(
                ['user_id' => $user->id],
                ['created_at' => now()],
                ['updated_at' => now()],
            );

            return response()->json(['message' => 'Attendance updated successfully'], 200);
        } else {
            return response()->json(['error' => 'User not found'], 404);
        }
    }
}
