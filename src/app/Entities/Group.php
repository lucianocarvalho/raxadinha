<?php

namespace App\Entities;

use Illuminate\Database\Eloquent\Model;

class Group extends Model
{
    protected $fillable = [
        'name',
        'user_id'
    ];

    public function users()
    {
        return $this->belongsToMany('App\Entities\User');
    }
}