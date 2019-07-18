<?php

namespace App\Http\Controllers\Api\v1;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Helpers\ImageProcessor;


class ImageController extends Controller
{

    public function index(){
        return \App\Images::latest()->paginate(1);
    }

    public function store(Request $request, ImageProcessor $imageProcessor){
        if ($request->input('type') == 'remote') {
            $url = $request->input('url-image');
            $image = new \App\Images([
                'url' => $url,
                'type' => 'remote'
            ]);
            $image->save();
        }
        else if ($request->input('type') == 'local') {
            if($request->hasFile('image')) {
                $width = $request->input('width');
                $height = $request->input('height');
                $path = $imageProcessor::compressAndSave($request, 'image', 'storage/uploads/', $width, $height);
                $image = new \App\Images([
                    'url' => $path,
                    'type' => 'local'
                ]);
                $image->save();
            }
        }
        return response()->json(['status' => 'success'], 200);
    }
    
    public function show($id)
    {
       
    }

    public function update(Request $request, $id)
    {
        
    }

    public function destroy($id)
    {
        
    }
}
