<?php
class Cases_table
{
    private $_dbh;
    private $_table_name = 'cases';

    public function __construct()
    {
        $this->_dbh = new db_connection($this->_table_name);
    }

    public function add_new_case(array $case_data)
    {
        if ($case_data) {
            return $this->_dbh->insert($case_data);
        }

        return false;
    }
}
