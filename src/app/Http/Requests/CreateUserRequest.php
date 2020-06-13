<?php

namespace App\Http\Requests;

use Illuminate\Http\Request;

class CreateUserRequest extends Request
{
    public function rules()
    {
        return [
            'email' => 'required',
            'password' => 'required'
        ];
    }
}