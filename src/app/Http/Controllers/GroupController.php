<?php

namespace App\Http\Controllers;

use Illuminate\Http\{Request, Response};
use \App\Repositories\GroupRepository;

class GroupController extends Controller
{
    public function __construct(GroupRepository $repository)
    {
        $this->repository = $repository;
    }

    public function getGroupsByUser($user_id)
    {
        return $this->repository->getGroupsByUser($user_id);
    }
}