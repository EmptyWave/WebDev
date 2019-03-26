<?php

include_once('m/users.php');

class C_User extends C_Base
{

    public function action_index(){
        $this->title .= '::Просмотр';
        $text = text_get();
        $this->content = $this->Template('v/v_index.php', array('text' => $text));
    }

    public function action_login(){
        $this->title .= '::Вход в систему';
        $this->content = $this->Template('v/v_login.php', array());
    }

    public function action_reg(){
        $this->title .= '::Регистрация';
        $this->content = $this->Template('v/v_reg.php', array());
    }

    public function action_cabinet(){
        $this->title .= '::Личный кабинет';
        $this->content = $this->Template('v/v_cabinet.php', array());
    }

    public function action_auth(){
        if ($this->isPost()) {
            if (isset($_POST['login']) && isset($_POST['password'])){

                $user = new user();
                $login = !empty($_POST['login']) ? $_POST['login'] : WRONG_DATA;
                $password = !empty($_POST['password']) ? $_POST['password'] : WRONG_DATA;

                if (isWrongData($login) or isWrongData($password)){
                    $_SESSION['msg'] = 'Введены неверные данные';
                    header('Location: ?c=user&act=reg');
                    return;
                }

                if ($user->getUserDB($login)){
                    if ($user->verifyPass($user->combineUserData($password,$login))){
                        foreach ($user->getUserData() as $key=>$value){
                            $_SESSION["$key"] = $value;
                        }
                        header('Location: ?');
                        return;
                    }

                    $_SESSION['msg'] = 'Неверный пароль';
                    header('Location: ?c=user&act=login');
                    return;
                }

                $_SESSION['msg'] = 'Неверное имя пользователя';
                header('Location: ?c=user&act=login');
                return;

            }else {
                $_SESSION['msg'] = 'Введены неверные данные';
                header('Location: ?c=user&act=login');
                return;
            }
        } else
        header('Location: ?c=user&act=login');
    }

    public function action_logout(){
        session_destroy();
        header('Location: ?');
    }

    public function action_newUser(){
        if ($this->isPost()) {
            if (isset($_POST['login']) && isset($_POST['name']) && isset($_POST['password'])){

                $user = new user();
                $login = !empty($_POST['login'])? $_POST['login'] : WRONG_DATA;
                $name = !empty($_POST['name']) ? $_POST['name'] : WRONG_DATA;
                $password = !empty($_POST['password']) ? $_POST['password'] : WRONG_DATA;

                if (isWrongData($login) or isWrongData($name) or isWrongData($password)){
                    $_SESSION['msg'] = 'Введены неверные данные';
                    header('Location: ?c=user&act=reg');
                    return;
                }

                if (!$user->getUserDB($login)){
                    $_SESSION['msg'] = $user->newUser($login,$name,$password);
                    header('Location: ?');
                    return;
                }
                $_SESSION['msg'] = 'Пользователь с таким именем уже существует';
                header('Location: ?c=user&act=reg');
                return;
            }else {
                $_SESSION['msg'] = 'Введены неверные данные';
                header('Location: ?c=user&act=reg');
                return;
            }
        } else {
            header('Location: ?c=user&act=reg');
            return;
        }
    }
}