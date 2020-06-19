<?php
session_start();
error_reporting(E_ALL ^ E_NOTICE);
ini_set('display_errors', '1');
date_default_timezone_set('Africa/Cairo');
require_once 'model/connection.php';
require_once 'model/countries.php';
require_once 'model/pain_type.php';
require_once 'model/patients.php';
require_once 'model/functions.php';
require_once 'model/cases.php';
