<?php
require_once 'autoload.php';
if (is_user_login()) {
    unset_user_session();
}
?><script>
window.location = 'index.php';
</script><?php
?>
