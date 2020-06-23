<?php

use Illuminate\Database\Seeder;

class GroupUsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $groupsIds = \App\Entities\Group::pluck('id')->toArray();
        $usersIds = \App\Entities\User::pluck('id')->toArray();

        foreach(range(1,20) as $index) {
            DB::table('group_user')->insert([
                'group_id' => $groupsIds[array_rand($groupsIds)],
                'user_id' => $usersIds[array_rand($usersIds)]
            ]);
        }
    }
}