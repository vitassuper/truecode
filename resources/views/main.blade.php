<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge"> 
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <title>Document</title>
   
</head>
<body>
<div id="app">
<headercomp></headercomp>
<router-view></router-view>
</div>
    <script src="{{asset('js/app.js')}}"></script>
</body>
</html>
