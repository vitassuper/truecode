<?php

namespace App\Http\Helpers;

use App\Models\Header;

class Page{
    public static function getHeaderOptions(){
        return Header::get()['value'];
    }
}