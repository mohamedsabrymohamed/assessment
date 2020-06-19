<?php
require_once 'autoload.php';
if (!(is_user_login())) {
    header('Location: index.php');
}
$paintype_table = new PainType_table();
$paintype_data = $paintype_table->retrieve_all_pain_type();
require_once 'header.php';
?>

<body class="loggedin">
    <?php require_once 'navbar.php';?>
    <div class="content">
        <p style="color:red;text-align: center;"><?php if (isset($_GET['err']) && !empty($_GET['err'])) {
    echo $_GET['err'];
}?></p>
        <form action="process.php" method="post">
            <input type="hidden" name="form_name" value="patient_new_case_form">
            <div class="form-group">
                <label for="pain">Pain</label>
                <select class="form-control" id="pain" name="pain_id">
                    <?php
foreach ($paintype_data as $single_paintype) {?>
                    <option value='<?php echo $single_paintype['id']; ?>'><?php echo $single_paintype['pain_name']; ?>
                    </option>
                    <?php }
?>

                </select>
            </div>
            <div class="form-group">
                <input type="submit" class="btn btn-primary mb-2" value="Submit">
            </div>
        </form>
    </div>
</body>

</html>
