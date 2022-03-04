<?php
namespace App\Controllers;

use App\Models\Post;
use App\Models\Comments;
use App\Services\TagsService;

class BlogController extends BaseController{
    public function ShowPostAction($request){
        $uri= explode('/',$request->getRequestTarget());
        $id = end($uri);

        $all_post = Post::all();
        $posts_select = Post::find($id);
        $comments = Post::find($id)->comments;

        return $this->renderHTML(
            'post_show.twig', 
            array('posts' => $posts_select,
            'comments' => $comments,
            'tags' => TagsService::getTags($all_post)
        ));
    }
}