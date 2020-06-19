<?php
class PainType_table
{
    private $_dbh;
    private $_table_name = 'pain_type';
    public function __construct()
    {
        $this->_dbh = new db_connection($this->_table_name);
    }

    public function retrieve_all_pain_type()
    {
        $query = "SELECT id,pain_name from " . $this->_table_name . "";
        $result = $this->_dbh->query($query);
        $pain_data = array();
        while ($row = mysqli_fetch_assoc($result)) {
            $pain_data[] = $row;
        }
        return $pain_data;
    }

    public function retrieve_pain_type_by_id($pain_type_id)
    {
        $query = "SELECT id,pain_name from " . $this->_table_name . " where id ='" . $pain_type_id . "'";
        $result = $this->_dbh->query($query);
        $result_data = mysqli_fetch_assoc($result);
        if ($result_data['id'] and !empty($result_data['id'])) {
            return $result_data;
        }
        return false;
    }

}
