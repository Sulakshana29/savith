<?php

class App
{
    private $controller = 'Home';
    private $method = 'index';

    private function splitURL()
    {
        $URL = $_GET['url'] ?? 'home';
        $URL = explode("/", trim($URL, "/"));
        return $URL;
    }

    public function loadController()
    {
        $URL = $this->splitURL();

        /** Select controller **/
        $filename = "../app/controllers/" . ucfirst($URL[0]) . ".php";
        if (file_exists($filename)) {
            require_once $filename;
            $this->controller = ucfirst($URL[0]);
            unset($URL[0]);
        } else {
            // Load the 404 controller if the specified controller file does not exist
            $filename = "../app/controllers/_404.php";
            require_once $filename;
            $this->controller = "_404";
        }

        // Instantiate the controller
        $controller = new $this->controller;

        /** Select method **/
        if (!empty($URL[1])) {
            if (method_exists($controller, $URL[1])) {
                $this->method = $URL[1];
                unset($URL[1]);
            } else {
                // Provide a fallback if the method does not exist
                echo "Error: Method '{$URL[1]}' does not exist in the controller '{$this->controller}'.";
                return;
            }
        }

        // Ensure the method exists before calling
        if (method_exists($controller, $this->method)) {
            // Call the method with the remaining URL parameters
            call_user_func_array([$controller, $this->method], $URL ? array_values($URL) : []);
        } else {
            // Fallback if the index method is missing
            echo "Error: Method '{$this->method}' does not exist in the controller '{$this->controller}'.";
        }
    }
}
