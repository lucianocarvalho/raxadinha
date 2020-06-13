<?php

namespace App\Entities;

use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    protected $fillable = [
        'name', 'email',
    ];

    protected $hidden = [
        'password',
    ];

    public function groups()
    {
        return $this->belongsToMany(\App\Entities\Group::class);
    }
}