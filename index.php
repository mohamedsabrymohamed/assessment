<?php
require_once 'autoload.php';
require_once 'header.php';
?>

<body>
    <div class="login">
        <h1>Login</h1>
        <p style="color:red;text-align: center;"><?php if (isset($_GET['err']) && !empty($_GET['err'])) {
    echo $_GET['err'];
}?></p>
        <form action="process.php" method="post">
            <input type="hidden" name="form_name" value="patient_login_form">
            <label for="username">
                <i class="fas fa-user"></i>
            </label>
            <input type="text" name="username" placeholder="Username" id="username" required>
            <label for="password">
                <i class="fas fa-lock"></i>
            </label>
            <input type="password" name="password" placeholder="Password" id="password" required>
            <a href="registration.php">Or Register</a>
            <input type="submit" value="Login">
        </form>

        <?php require_once 'footer.php';?>
