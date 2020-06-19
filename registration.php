<?php
require_once 'autoload.php';
require_once 'header.php';
?>

<body>
    <div class="login">
        <h1>Register</h1>
        <p style="color:red;text-align: center;"><?php if (isset($_GET['err']) && !empty($_GET['err'])) {
    echo $_GET['err'];
}?></p>
        <form action="process.php" method="post">
            <input type="hidden" name="form_name" value="patient_registration_form">
            <label for="username">
                <i class="fas fa-user"></i>
            </label>
            <input type="text" name="username" placeholder="Username" id="username" required>
            <label for="password">
                <i class="fas fa-lock"></i>
            </label>
            <input type="password" name="password" placeholder="Password" id="password" required>
            <label for="password">
                <i class="fas fa-lock"></i>
            </label>
            <input type="password" name="confirm_password" placeholder="Confirm Password" id="confirm_password"
                required>
            <a href="index.php">Already Have Account?</a>
            <input type="submit" value="Register">
        </form>

        <script>
        var password = document.getElementById("password"),
            confirm_password = document.getElementById("confirm_password");

        function validatePassword() {
            if (password.value != confirm_password.value) {
                confirm_password.setCustomValidity("Passwords Don't Match");
            } else {
                confirm_password.setCustomValidity('');
            }
        }

        password.onchange = validatePassword;
        confirm_password.onkeyup = validatePassword;
        </script>
        <?php require_once 'footer.php';?>
