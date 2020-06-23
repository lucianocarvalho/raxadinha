<?php

namespace App\Repositories;

use App\Entities\Group;

class GroupRepository
{
    public function getGroupsByUser(int $user_id)
    {
        $groups = Group::query()->join('group_user', function($join) {
            $join->on('group_user.group_id', '=', 'groups.id');
        })
        ->where('group_user.user_id', $user_id)
        ->get();

        return $groups;
    } 
}