<?php
require_once 'autoload.php';
if (!(is_user_login())) {
    header('Location: index.php');
}
$countries_table = new Countries_table();
$countries_data = $countries_table->retrieve_all_country();
$patient_table = new Patients_table();
$patient_data = $patient_table->get_patient_info(get_login_user_id());
require_once 'header.php';
?>

<body class="loggedin">
    <?php require_once 'navbar.php';?>
    <div class="content">
        <p style="color:red;text-align: center;"><?php if (isset($_GET['err']) && !empty($_GET['err'])) {
    echo $_GET['err'];
}?></p>
        <form action="process.php" method="post">
            <input type="hidden" name="form_name" value="patient_profile_form">
            <div class="form-group">
                <label for="first_name">First Name</label>
                <input type="text" name="first_name" class="form-control" id="first_name" placeholder="First Name"
                    value="<?php echo $patient_data['first_name'] ?>">
            </div>
            <div class="form-group">
                <label for="last_name">Last Name</label>
                <input type="text" name="last_name" class="form-control" id="first_name" placeholder="Last Name"
                    value="<?php echo $patient_data['last_name'] ?>">
            </div>
            <div class="form-group">
                <label for="mobile">Mobile</label>
                <input type="text" name="mobile" class="form-control" id="mobile" placeholder="01234567890"
                    value="<?php echo $patient_data['mobile'] ?>">
            </div>
            <div class="form-group">
                <label for="birth_date">Birth Date</label>
                <input type="date" name="birth_date" class="form-control" id="birth_date"
                    value="<?php echo $patient_data['birth_date'] ?>">
            </div>
            <div class="form-group">
                <label for="email">Email address</label>
                <input type="email" name="email" class="form-control" id="email" placeholder="name@example.com"
                    value="<?php echo $patient_data['email'] ?>">
            </div>
            <div class="form-group">
                <label for="gender">Gender</label>
                <select class="form-control" id="gender" name="gender">
                    <option <?php if ($patient_data['gender'] == 0) {
    echo "selected";
}
?> value='0'>Male</option>
                    <option <?php if ($patient_data['gender'] == 1) {
    echo "selected";
}
?> value='1'>Female</option>
                </select>
            </div>

            <div class="form-group">
                <label for="country">Country</label>
                <select class="form-control" id="country" name="country_id">
                    <?php
foreach ($countries_data as $single_country) {
    $selected = "";
    if ($patient_data['country_id'] == $single_country['id']) {
        $selected = "selected";
    }

    ?>
                    <option value='<?php echo $single_country['id']; ?>' <?php echo $selected; ?>>
                        <?php echo $single_country['country_name']; ?>
                    </option>
                    <?php }
?>

                </select>
            </div>
            <div class="form-group">
                <label for="occupation">Occupation</label>
                <input type="text" name="occupation" class="form-control" id="occupation" placeholder="your job"
                    value="<?php echo $patient_data['occupation'] ?>">
            </div>

            <div class="form-group">
                <input type="submit" class="btn btn-primary mb-2" value="Submit">
            </div>
        </form>
    </div>
</body>

</html>
