<?php
require_once 'autoload.php';
if ($_POST) {
    $form_name = $_POST['form_name'];
    if ($form_name and !empty($form_name)) {
        switch ($form_name) {
            case 'patient_login_form':
                {
                    $patient_username = $_POST['username'];
                    $patient_password = $_POST['password'];
                    $patient_table = new Patients_table();
                    $patient_id = $patient_table->verify_patient($patient_username, $patient_password);
                    if ($patient_id and !empty($patient_id)) {
                        $_SESSION['user_id'] = $patient_id;
                        $_SESSION['patient_username'] = $patient_username;
                        $_SESSION['timeout'] = time();
                        $_SESSION['web_session_timeout'] = 900;
                        $redirect_path = 'profile.php';
                        ?><script type="text/javascript">
window.location = '<?php echo $redirect_path; ?>';
</script><?php
} else {
                        $notification_string = 'Please check username or password';
                        $redirect_path = 'index.php';
                        ?><script type="text/javascript">
window.location = '<?php echo $redirect_path . "?err=" . $notification_string; ?>';
</script><?php
}

                }
            case 'patient_registration_form':
                {
                    $patient_data = [];
                    $patient_data['username'] = $_POST['username'];
                    $patient_data['password'] = $_POST['password'];
                    $patient_data['confirm_password'] = $_POST['confirm_password'];
                    $patient_table = new Patients_table();
                    $check_exists = $patient_table->is_patient_registered($_POST['username']);
                    if (!empty($check_exists)) {
                        $notification_string = 'User Already Exists';
                        $redirect_path = 'registration.php';
                        ?><script type="text/javascript">
window.location = '<?php echo $redirect_path . "?err=" . $notification_string; ?>';
</script><?php
} else {
                        $patient_id = $patient_table->add_new_patient($patient_data);

                        if ($patient_id && !empty($patient_id)) {
                            $notification_string = 'Thank you For Registration';
                            $redirect_path = 'index.php';
                            ?><script type="text/javascript">
window.location = '<?php echo $redirect_path . "?err=" . $notification_string; ?>';
</script><?php
}
                    }
                }
            case 'patient_profile_form':
                {
                    $patient_data = [];
                    $patient_data['first_name'] = $_POST['first_name'];
                    $patient_data['last_name'] = $_POST['last_name'];
                    $patient_data['mobile'] = $_POST['mobile'];
                    $patient_data['birth_date'] = $_POST['birth_date'];
                    $patient_data['email'] = $_POST['email'];
                    $patient_data['gender'] = $_POST['gender'];
                    $patient_data['country_id'] = $_POST['country_id'];
                    $patient_data['occupation'] = $_POST['occupation'];
                    $patient_id = get_login_user_id();
                    $patient_table = new Patients_table();
                    $user_id = $patient_table->check_patient_by_id($patient_id);
                    if (!empty($user_id['id'])) {
                        $where = 'id = ' . $patient_id;
                        $add_patient_profile_data = $patient_table->update_patient_profile($patient_data, $where);
                        $notification_string = 'Thank you Completing Profile';
                        $redirect_path = 'home.php';
                        ?><script type="text/javascript">
window.location = '<?php echo $redirect_path . "?err=" . $notification_string; ?>';
</script><?php
} else {
                        $notification_string = 'Something went wrong. Please Try again.';
                        $redirect_path = 'profile.php';
                        ?><script type="text/javascript">
window.location = '<?php echo $redirect_path . "?err=" . $notification_string; ?>';
</script><?php
}

                }
            case 'patient_new_case_form':
                {
                    $case_data = [];
                    $case_data['paint_type_id'] = $_POST['pain_id'];
                    $case_data['user_id'] = get_login_user_id();
                    $cases_table = new Cases_table();
                    $add_case = $cases_table->add_new_case($case_data);
                    if (!empty($add_case)) {
                        $notification_string = 'Thank you. We will get back to confirm your case.';
                        $redirect_path = 'home.php';
                        ?><script type="text/javascript">
window.location = '<?php echo $redirect_path . "?err=" . $notification_string; ?>';
</script><?php
} else {
                        $notification_string = 'Something went wrong. Please Try again.';
                        $redirect_path = 'add_case.php';
                        ?><script type="text/javascript">
window.location = '<?php echo $redirect_path . "?err=" . $notification_string; ?>';
</script><?php
}

                }
        }
    }
}
