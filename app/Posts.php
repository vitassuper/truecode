<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Posts extends Model
{
    protected $fillable = ['title', 'description', 'image_id'];

    public function image() {
        return $this->belongsTo(Images::class, 'image_id');
    }
}
