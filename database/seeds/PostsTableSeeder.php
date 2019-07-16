<?php

use Illuminate\Database\Seeder;

class PostsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $data=[];
        for($i=0;$i<50;$i++){
            $data[] =[
                'title' => 'Текст для заголовка номер 3',
            'description' => 'Описание преимущества описание преимущества описание преимущества описание преимущества',
            'image_id' =>1,
            ];
        }
        DB::table('posts')->insert(
            $data
        );
    }
}
