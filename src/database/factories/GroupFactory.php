<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */
use Faker\Generator as Faker;
use Illuminate\Support\Facades\Hash;

/*
|--------------------------------------------------------------------------
| Model Factories
|--------------------------------------------------------------------------
|
| This directory should contain each of the model factory definitions for
| your application. Factories provide a convenient way to generate new
| model instances for testing / seeding your application's database.
|
*/

$factory->define(\App\Entities\Group::class, function (Faker $faker) {

    $user_id = \App\Entities\User::pluck('id')->random(1)->first();

    return [
        'name' => $faker->text('25'),
        'user_id' => $user_id
    ];
});