<?php

namespace App\Http\Controllers;

use Illuminate\Http\{Request, Response};
use App\Repositories\Contracts\UserRepositoryInterface;
use App\Http\Requests\CreateUserRequest;

class UserController extends Controller
{
    private $repository;

    public function __construct(UserRepositoryInterface $repository)
    {
        $this->repository = $repository;
    }

    public function index(Request $request)
    {
        return response($this->repository->getAll($request), 200);
    }

    public function create(Request $request)
    {
        if ($this->repository->create($request->except('q'))) {
            return response([
                'successful' => true
            ]);
        }
    }

    public function login(Request $request)
    {
        if ($user_id = $this->repository->login($request)) {
            return response([
                'successful' => true,
                'user_id' => $user_id
            ]);
        }

        return response([
            'successful' => false
        ]);
    }
}
