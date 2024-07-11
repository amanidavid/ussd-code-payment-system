<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Taxcharge extends Model
{
    use HasFactory;
    protected $fillable =[
        'tax_charges','amount'
    ];
}
