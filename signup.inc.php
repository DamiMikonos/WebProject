<?php

if (isset($_POST["submit"])){
    $username = $_POST["username"];
    $email = $_POST["email"];
    $psw = $_POST["password"];

    require_once 'dbh.inc.php';
    require_once 'functions.inc.php';

    if(emptyInputSignup($username, $email, $psw) !== false){
        header("location: ../signup.html?error=emptyinput");
        exit();
    }

    if(invalidUid($username) !== false){
        header("location: ../signup.html?error=invaliduid");
        exit();
    }

    if(invalidEmail($email) !== false){
        header("location: ../signup.html?error=invalidemail");
        exit();
    }
    
    if(uidExists($conn, $username, $email) !== false){
        header("location: ../signup.html?error=usernametaken");
        exit();
    }

    createUser($conn, $username, $psw, $email);

}
else {
    header("location: ../signup.html");
    exit();
}