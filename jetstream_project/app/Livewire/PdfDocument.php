<?php

namespace App\Livewire;

use Livewire\Component;
use  PDF;
use Illuminate\Support\Facades\DB;

class PdfDocument extends Component
{
    public function render()
    {
        return view('livewire.pdf-document');
    }

    public function generateReport(){
        $dailyPayments = DB::select("call GetDailyPayments()");

        $data = [
            'dailyPayments' => $dailyPayments,
        ];

        $pdf =PDF::loadView('pdf.report',$data);

        return $pdf->download('daily-report.pdf');
    }
}
