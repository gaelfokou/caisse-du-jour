<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cash extends Model
{
    use HasFactory;

    protected $fillable = [
        'type',
        'nominal',
        'quantity'
    ];

    /**
     * Get the post that owns the comment.
     */
    public function fund()
    {
        return $this->belongsTo(Fund::class);
    }
}
