<?php
namespace App\Controllers;

class PagesController extends BaseController {
    public function AboutAction() {
        return $this->renderHTML('Page/about.html.twig');
    }
    public function ContactAction() {
        return $this->renderHTML('Page/contact.html.twig');
    }
}