<?php
require_once 'autoload.php';
if (!(is_user_login())) {
    header('Location: index.php');
}
require_once 'header.php';
?>

<body class="loggedin">
    <?php require_once 'navbar.php';?>
    <div class="content">
        <p>Welcome back, <?=$_SESSION['patient_username']?>!</p>
        <p style="color:red;text-align: center;"><?php if (isset($_GET['err']) && !empty($_GET['err'])) {
    echo $_GET['err'];
}?></p>

    </div>
</body>

</html>
