<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Fund extends Model
{
    use HasFactory;

    protected $fillable = [
        'type',
        'published_at',
        'comment'
    ];
    
    protected $dates = ['published_at'];

    /**
     * Get the comments for the post.
     */
    public function cashes() {
        return $this->hasMany(Cash::class);
        // note: we can also include comment model like: 'App\Models\Comment'
    }

    /**
     * Get the post that owns the comment.
     */
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
