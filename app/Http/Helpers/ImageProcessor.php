<?php

namespace App\Http\Helpers;

use Illuminate\Http\Request;
use Intervention\Image\Facades\Image;

class ImageProcessor{

    public static function compressAndSave(Request $request, $fileName, $path, $width = 400, $height = 400){
        
        $filenamewithextension = $request->file($fileName)->getClientOriginalName();
        //get filename without extension
        $filename = pathinfo($filenamewithextension, PATHINFO_FILENAME);
        //get file extension
        $extension = $request->file($fileName)->getClientOriginalExtension();
        //filename to store
        $filenametostore = $filename.'_'.time().'.'.$extension;
        //Upload File
        $request->file($fileName)->move($path, $filenametostore);
        $resultPath = '/'.$path.$filenametostore;
        //Resize image here
        $thumbnailpath = public_path($path.$filenametostore);
        $img = Image::make($thumbnailpath)->resize($width, $height, function($constraint) {
            $constraint->aspectRatio();
        });
        $img->save($thumbnailpath);
        return $resultPath;
    }

}