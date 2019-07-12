<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    protected $fillable = ['value', 'public_name'];
    protected $table = 'roles';
    public function user() {
        return $this->belongsToMany(User::class);
    }
}
