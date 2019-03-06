<?php

class user
{
    private $user_id;
    private $user_name;
    private $user_login;
    private $user_password;
    private $user_type;
    private $db;

    public function __construct(){
        $this->getDB();
    }


    public function setUserData($data){
        foreach ($data as $key=>$value){
            $this->$key = $value;
        }
    }

    public function getUserData(){
        $user['user_id'] = $this->user_id;
        $user['user_name'] = $this->user_name;
        $user['user_login'] = $this->user_login;
        $user['user_type'] = $this->user_type;
        return $user;
    }

    private function getDB(){
        // Формируем строку соединения с сервером
        $connectString = DB_DRIVER.':host=' . DB_HOST . ';dbname=' . DB_NAME . ';charset=UTF8;';
        $this->db = new PDO($connectString, DB_USER, DB_PASS,
            [
                PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,   // возвращать ассоциативные массивы
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION         // возвращать Exception в случае ошибки
            ]
        );
    }

    public function combineUserData($pass,$login){
        return strrev($pass.$login);
    }

    public function hashPass($userData){
        return password_hash($userData,PASSWORD_BCRYPT);
    }

    public function verifyPass($userData){
        return password_verify($userData, $this->user_password);
    }

    public function getUserDB($login){
        $user = $this->db->query("SELECT * FROM users WHERE user_login = '$login'")->fetch();
        if ($user){
            $this->setUserData($user);
            return true;
        }
        return false;
    }

    public function newUser($login,$name,$pass,$type=1){
        $hashPass = $this->hashPass($this->combineUserData($pass,$login));
        $user = $this->db->exec("INSERT INTO users (`user_login`,`user_password`,`user_name`,`user_type`) VALUES ('$login','$hashPass','$name','$type')");
        if ($user) {
            $this->getUserDB($login);
            return $user;
        }
        return "Ошибка";
    }


}
