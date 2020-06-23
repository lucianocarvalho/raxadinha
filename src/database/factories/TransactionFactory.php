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

$factory->define(\App\Entities\Transaction::class, function (Faker $faker) {

    $groupsIds = \App\Entities\Group::pluck('id')->toArray();
    $usersIds = \App\Entities\User::pluck('id')->toArray();

    return [
        'group_id' => $groupsIds[array_rand($groupsIds)],
        'user_id' => $usersIds[array_rand($usersIds)],
        'value' => $faker->randomFloat(),
        'description' => $faker->text,
    ];
});