<?php
session_start();
if (isset($_POST["submit"])){

    $username = $_POST["username"];
    $psw = $_POST["password"];
    $_SESSION["username"] = $_POST["username"];

    require_once 'dbh.inc.php';
    require_once 'functions.inc.php';

    if(emptyInputSignin($username, $psw) !== false){
        header("location: ../signup.html?error=emptyinput");
        exit();
    }

    loginUser($conn, $username, $psw);
}
else{
    header("location: ../signin.html");
    exit();
}