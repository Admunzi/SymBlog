<?php

namespace App\Services;

class TagsService {

    public static function getTags($blogs) {
        $tags = [];
        foreach ($blogs as $blog) {
            $tagsInBlog = explode(",", $blog->tags);
            foreach ($tagsInBlog as $tag) {
                if (array_key_exists($tag, $tags)) {
                    $tags[$tag]++;
                } else {
                    $tags[$tag] = 1;
                }
            }
        }
        return $tags;
    }
}