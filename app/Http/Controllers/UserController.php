<?php

namespace App\Http\Controllers;

class UserController extends Controller
{
    public function index(){
        $colums=[
            'id',
            'login',
            'role_id'

        ];
        $result = \App\User::
        with(['role'=>function($query){
            $query->select(['id','public_name']);
        },])->find(2);
        //return $result;
        return view('userlist', compact('result'));
    }
}
