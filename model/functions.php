<?php

function is_user_login()
{
    if (verify_session_time_out()) {
        $user_id = @$_SESSION['user_id'];
        if ($user_id and !empty($user_id) and isset($user_id)) {
            return true;
        }
    }
    return false;
}

function get_login_user_id()
{
    if (is_user_login()) {
        $user_id = @$_SESSION['user_id'];
        return $user_id;
    }
    return false;

}

function get_login_user_full_name()
{
    if (is_user_login()) {
        $user_id = @$_SESSION['user_id'];
        $user_table = new Patients_table();
        return $user_table->get_patient_full_name($user_id);
    }
    return false;
}

function verify_session_time_out()
{
    $user_id = @$_SESSION['user_id'];
    if ($user_id and !empty($user_id) and isset($user_id)) {
        $session_timeout = $_SESSION['web_session_timeout'];
        $saved_time = strtotime(date('Y-m-d H:i:s', $_SESSION['timeout']));
        $current_time = strtotime(date('Y-m-d H:i:s', time()));

        $interval = abs($current_time - $saved_time);
        if ($interval > $session_timeout) {
            unset_user_session();
            return false;
        }
    }
    $_SESSION['timeout'] = time();
    return true;
}

function unset_user_session()
{
    $user_id = @$_SESSION['user_id'];
    if ($user_id and !empty($user_id) and isset($user_id)) {
        unset($_SESSION['user_id']);
        unset($_SESSION['temp_user_id']);
        unset($_SESSION['access_token']);
        unset($_SESSION['timeout']);
        unset($_SESSION['web_session_timeout']);
        $_SESSION['USERNAME'] = null;
        $_SESSION['FULLNAME'] = null;
        $_SESSION['EMAIL'] = null;
        $_SESSION['LOGOUT'] = null;
        unset($_SESSION);
        session_destroy();
    }
}
