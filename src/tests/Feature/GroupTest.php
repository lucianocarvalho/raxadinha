<?php

use Laravel\Lumen\Testing\DatabaseMigrations;

class GroupTest extends TestCase
{
    use DatabaseMigrations;

    /** @test */
    public function a_user_can_browser_their_groups()
    {
        $user = factory('App\Entities\User')->create();

        $group = factory('App\Entities\Group')->create();
        $group->each(function($group) {
            $group->users()->attach($group->user_id);
        });

        $response = $this->get('/api/groups/' . $group->user_id);

        $response->assertResponseStatus(200);
        $response->seeJson([
            'name' => $group->name
        ]);
    }
}
