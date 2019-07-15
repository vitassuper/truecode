<?php

namespace App\Http\Controllers\Api\v1;


use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use Illuminate\Auth\Events\Registered;
use App\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Tymon\JWTAuth\JWTAuth;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        $this->validator($request->all())->validate();

        event(new Registered($this->create($request->all())));

        return response()->json(['status' => 'success'], 200, ['Content-Type' => 'application/json; charset=utf-8'], JSON_UNESCAPED_UNICODE);
    }

    protected function validator(array $data)
    {
        return Validator::make($data, [
            'login' => ['required', 'string',  'max:255', 'unique:users'],
            'password' => ['required', 'string', 'min:8', 'confirmed'],
        ]);
    }

    protected function create(array $data)
    {
        return User::create([
            'login' => $data['login'],
            'password' => Hash::make($data['password']),
        ]);
    }

    public function login(Request $request)
    {
        $credentials = $request->only('login', 'password');
        if ($token = auth()->setTTL(2)->attempt($credentials)) {
            $this->guard()->user()->api_token = $token;
            $role = \App\User::with(['role' => function ($query) {
                $query->select(['id', 'public_name']);
            },])->find($this->guard()->user()->id);
            return response()->json(['status' => 'success', 'expires_in' => auth()->payload()->get('exp') , 'user' => $this->guard()->user(), 'user_role' => $role->role->public_name], 200);
        }
        return response()->json(['error' => 'login_error'], 401);
    }

    public function checkToken(){

    }

    public function logout()
    { 

    }

    protected function guard()
    {
        return Auth::guard();
    }
}
