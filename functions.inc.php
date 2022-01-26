<?php
function emptyInputSignup($username, $email, $psw){
    $result;
    if (empty($username) || empty($email) || empty($psw)) {
        $result = true;
    }
    else {
        $result = false;
    }
    return $result;
}

function invalidUid($username){
    $result;
    if (!preg_match("/^[a-zA-Z0-9]*$/", $username)) {
        $result = true;
    }
    else {
        $result = false;
    }
    return $result;
}

function invalidEmail($email){
    $result;
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $result = true;
    }
    else {
        $result = false;
    }
    return $result;
}

function uidExists($conn, $username, $email){
    $sql = "SELECT * FROM user WHERE username = ? OR email = ?;";
    $stmt = mysqli_stmt_init($conn);
    if (!mysqli_stmt_prepare($stmt, $sql)){
        header("location: ../signup.php?error=stmtfailed");
        exit();
    }

    mysqli_stmt_bind_param($stmt, "ss", $username, $email);
    mysqli_stmt_execute($stmt);

    $resultData = mysqli_stmt_get_result($stmt);
    
    if ($row = mysqli_fetch_assoc($resultData)) {
        return $row;
    }
    else {
        $result = false;
        return $result;
    }
    mysqli_stmt_close($stmt);
    
}

function createUser($conn, $username, $psw, $email){
    $sql = "INSERT INTO user (username, password, email) VALUES (?, ?, ?);";
    $stmt = mysqli_stmt_init($conn);
    if (!mysqli_stmt_prepare($stmt, $sql)){
        header("location: ../signup.php?error=stmtfailed");
        exit();
    }

    $hashedPsw = password_hash($psw, PASSWORD_DEFAULT);


    mysqli_stmt_bind_param($stmt, "sss", $username, $hashedPsw, $email);
    mysqli_stmt_execute($stmt);
    mysqli_stmt_close($stmt);
    header("location: ../signin.html?error=none");
    exit();
}

function emptyInputSignin($username, $psw){
    $result;
    if (empty($username) || empty($psw)) {
        $result = true;
    }
    else {
        $result = false;
    }
    return $result;
}

function loginUser($conn, $username, $psw) {
    $uidExists = uidExists($conn, $username, $username);

    if ($uidExists === false) {
        header("location: ../signin.html?error=wronglogin");
        exit();
    }

    $pswHashed = $uidExists["password"];
    $checkedPsw = password_verify($psw, $pswHashed);    

    if ($checkedPsw === false) {
        header("location: ../signin.html?error=wronglogin");
        exit();
    }
    else if ($checkedPsw === true) {
        session_start();
        $_SESSION["username"] = $uidExists["username"];
        header("location: ../dashboard.php");
        exit();
    }
}