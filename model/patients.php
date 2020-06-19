<?php
class Patients_table
{
    private $_dbh;
    private $_table_name = 'patients';

    public function __construct()
    {
        $this->_dbh = new db_connection($this->_table_name);
    }

    public function add_new_patient(array $patient_data)
    {
        if ($patient_data) {
            $password = $patient_data['password'];
            $confirm_password = $patient_data['confirm_password'];
            unset($patient_data['confirm_password']);
            if ($password == $confirm_password) {
                $patient_data['password'] = hash('SHA256', $password);
                return $this->_dbh->insert($patient_data);
            }
        }
        return false;
    }

    public function update_patient_profile(array $patient_data, $condition)
    {
        return $this->_dbh->update($patient_data, $condition);
    }

    public function is_patient_registered($username)
    {
        $query = "Select count(username) as total_count from " . $this->_table_name . " where username ='" . $username . "'";
        $result = $this->_dbh->query($query);
        $result_data = mysqli_fetch_assoc($result);
        if ($result_data['total_count'] > 0) {
            return true;
        }
        return false;
    }

    public function get_patient_full_name($patient_id)
    {
        $query = "SELECT CONCAT(first_name,' ',last_name) AS FULL_NAME from " . $this->_table_name . " where id ='" . $patient_id . "' ";
        $result = $this->_dbh->query($query);
        $result_data = mysqli_fetch_assoc($result);
        if ($result_data['id'] and !empty($result_data['id'])) {
            return $result_data;
        }
        return false;
    }

    public function get_patient_info($patient_id)
    {
        $query = "SELECT id,first_name,last_name,email,mobile,birth_date,gender,country_id,occupation from " . $this->_table_name . " where id ='" . $patient_id . "' ";
        $result = $this->_dbh->query($query);
        $result_data = mysqli_fetch_assoc($result);
        if ($result_data['id'] and !empty($result_data['id'])) {
            return $result_data;
        }
        return false;
    }

    public function verify_patient($patient_username, $patient_password)
    {
        $patient_data = $this->retrieve_patient_password_by_username($patient_username);
        if ($patient_data) {
            $patient_password = hash('SHA256', $patient_password);
            if ($patient_password == $patient_data['password']) {
                return $patient_data['id'];
            }
        }
        return false;
    }

    public function retrieve_patient_password_by_username($username)
    {
        $query = "Select id,password from " . $this->_table_name . " where username ='" . $username . "'";
        $result = $this->_dbh->query($query);
        $result_data = mysqli_fetch_assoc($result);
        if ($result_data['id'] and !empty($result_data['id'])) {
            return $result_data;
        }
        return false;
    }

    public function check_patient_by_id($patient_id)
    {
        $query = "Select id from " . $this->_table_name . " where id ='" . $patient_id . "'";
        $result = $this->_dbh->query($query);
        $result_data = mysqli_fetch_assoc($result);
        if ($result_data['id'] and !empty($result_data['id'])) {
            return $result_data;
        }
        return false;
    }
}
