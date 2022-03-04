<?php
namespace App\Controllers;

use App\Models\Post;
use App\Services\TagsService;

class IndexController extends BaseController{
    
    public function HomeAction(){
        $all_post = Post::all();
        $posts = Post::all();
        
        return $this->renderHTML('Page/index.html.twig',[
            'posts' => $posts,
            'tags' => TagsService::getTags($all_post)
        ]);
    }
}

?>