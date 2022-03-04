<?php
require_once('../app/config/parametros.php');
require_once('../vendor/autoload.php');

use App\Controllers;
use Aura\Router\RouterContainer;
use Laminas\Diactoros;
use Illuminate\Database\Capsule\Manager as Capsule;

$capsule = new Capsule;

$capsule->addConnection([
    'driver' => 'mysql',
    'host' => DBHOST,
    'database' => DBNAME,
    'username' => DBUSER,
    'password' => DBPASS,
    'charset' => 'utf8',
    'collation' => 'utf8_unicode_ci',
    'prefix' => '',
]);
$capsule->setAsGlobal();
$capsule->bootEloquent();

// create a server request object
$request = Laminas\Diactoros\ServerRequestFactory::fromGlobals(
        $_SERVER,
        $_GET,
        $_POST,
        $_COOKIE,
        $_FILES
);

// create the router container and get the routing map
$routerContainer = new RouterContainer();
$map = $routerContainer->getMap();
        
// add a route to the map, and a handler for it
$map->get(
        'index',
        '/home',
        ['controller'=>'App\Controllers\IndexController','action'=>'HomeAction']);
$map->get(
        'blog.about',
        '/about',
        ['controller'=>'App\Controllers\PagesController','action'=>'AboutAction']);
$map->get(
        'blog.contact',
        '/contact',
        ['controller'=>'App\Controllers\PagesController','action'=>'ContactAction']);
$map->get(
        'blog.show',
        '/show_post/{id}',
        ['controller'=>'App\Controllers\BlogController','action'=>'ShowPostAction']
        )->tokens(['id'=>'\d+']);
                        
// get the route matcher from the container ...
$matcher = $routerContainer->getMatcher();

/**
 * @var Psr\Http\Message\ServerRequestInterface $request
 */
$route = $matcher->match($request);

if ($route) {
        $actionClass = $route->handler;
        $controllerName = $actionClass['controller'];
        $action = $actionClass['action'];
        
        $controller = new $controllerName;
        $response = $controller->$action($request);

        foreach($response->getHeaders() as $name => $values) {
                foreach($values as $value) {
                        header(sprintf('%s: %s', $name, $value), false);
                }
        }
        http_response_code($response->getStatusCode());
        echo $response->getBody();
}else{
    echo "No route";
}
?>