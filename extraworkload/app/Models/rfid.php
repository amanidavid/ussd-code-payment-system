<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;


class rfid extends Model
{
    use HasFactory;

    protected $fillable =[
        ' uid',
        ' user_id',
 ];

    // Define the relationship with the User model
      public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }
}
