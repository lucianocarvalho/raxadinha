<?php

namespace App\Entities;

use Illuminate\Database\Eloquent\Model;

class Group extends Model
{
    protected $fillable = [
        'name', 'expire_at'
    ];

    public function users()
    {
        return $this->belongsToMany(\App\Entities\User::class);
    }
}