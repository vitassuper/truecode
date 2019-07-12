<?php

namespace App\Http\Controllers\Api\v1\Header;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Header;

class HeaderController extends Controller
{
    public function index(Request $request){
       return Header::where('type', $request->type)->first()['value'];
    }
}
