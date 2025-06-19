<?php
session_start();
require_once __DIR__ . '/config/config.php';
require_once __DIR__ . '/includes/auth_check.php';
$current_page = basename($_SERVER['PHP_SELF']);
?>
<header>
<div class="header-content">
        <div class="logo">
            TicketBall 
        </div>
        
        <nav>
            <a href="index.php" class="<?php echo $current_page == 'index.php' ? 'active' : ''; ?>">Accueil</a>
            <a href="savoir_plus.php" class="<?php echo $current_page == 'savoir_plus.php' ? 'active' : ''; ?>">Savoir Plus</a>
            <a href="calendrier1.php" class="<?php echo $current_page == 'calendrier1.php' ? 'active' : ''; ?>">Calendrier</a>
            <?php if (isset($_SESSION['user_id'])): ?>
                <a href="calendrier.php" class="<?php echo $current_page == 'calendrier.php' ? 'active' : ''; ?>">Reservation</a>
            <?php endif; ?>
            <a href="#contact" class="<?php echo $current_page == 'contact.php' ? 'active' : ''; ?>">Contact</a>
        </nav>
        
        <div class="auth-buttons">
            <?php if (isset($_SESSION['user_id'])): ?>
                <?php if (isAdmin()): ?>
                    <a href="admin_profile.php" class="btn btn-outline <?php echo $current_page == 'admin_profile.php' ? 'active' : ''; ?>">Admin Panel</a>
                <?php else: ?>
                    <a href="profile.php" class="btn btn-outline <?php echo $current_page == 'profile.php' ? 'active' : ''; ?>">Mon Profil</a>
                <?php endif; ?>
                <a href="logout.php" class="btn btn-outline">Déconnexion</a>
            <?php else: ?>
                <a href="login.php" class="btn btn-outline <?php echo $current_page == 'login.php' ? 'active' : ''; ?>">Connexion</a>
                <a href="register.php" class="btn btn-primary <?php echo $current_page == 'register.php' ? 'active' : ''; ?>">Inscription</a>
                <a href="admin_login.php" class="btn btn-outline <?php echo $current_page == 'admin_login.php' ? 'active' : ''; ?>">Admin</a>
            <?php endif; ?>
        </div>
    </div>
</header>

