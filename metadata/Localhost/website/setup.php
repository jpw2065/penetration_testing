<!DOCTYPE html>

<html lang="en-GB">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

		<title>Setup :: Damn Vulnerable Web Application (DVWA) v1.10 *Development*</title>

		<link rel="stylesheet" type="text/css" href="dvwa/css/main.css" />

		<link rel="icon" type="\image/ico" href="favicon.ico" />

		<script type="text/javascript" src="dvwa/js/dvwaPage.js"></script>

	</head>

	<body class="home">
		<div id="container">

			<div id="header">

				<img src="dvwa/images/logo.png" alt="Damn Vulnerable Web Application" />

			</div>

			<div id="main_menu">

				<div id="main_menu_padded">
				<ul class="menuBlocks"><li class="selected"><a href="setup.php">Setup DVWA</a></li>
<li class=""><a href="instructions.php">Instructions</a></li>
</ul><ul class="menuBlocks"><li class=""><a href="about.php">About</a></li>
</ul>
				</div>

			</div>

			<div id="main_body">

				
<div class="body_padded">
	<h1>Database Setup <img src="dvwa/images/spanner.png" /></h1>

	<p>Click on the 'Create / Reset Database' button below to create or reset your database.<br />
	If you get an error make sure you have the correct user credentials in: <em>/var/www/html/DVWA/config/config.inc.php</em></p>

	<p>If the database already exists, <em>it will be cleared and the data will be reset</em>.<br />
	You can also use this to reset the administrator credentials ("<em>admin</em> // <em>password</em>") at any stage.</p>
	<hr />
	<br />

	<h2>Setup Check</h2>

	Web Server SERVER_NAME: <em>localhost</em><br />
	<br />
	Operating system: <em>*nix</em><br />
	<br />
	PHP version: <em>5.6.40-57+0~20211119.60+debian9~1.gbp8a9bd1</em><br />
	PHP function display_errors: <em>Disabled</em><br />
	PHP function safe_mode: <span class="success">Disabled</span><br/ >
	PHP function allow_url_include: <span class="success">Enabled</span><br/ >
	PHP function allow_url_fopen: <span class="success">Enabled</span><br />
	PHP function magic_quotes_gpc: <span class="success">Disabled</span><br />
	PHP module gd: <span class="failure">Missing - Only an issue if you want to play with captchas</span><br />
	PHP module mysql: <span class="success">Installed</span><br />
	PHP module pdo_mysql: <span class="success">Installed</span><br />
	<br />
	Backend database: <em>MySQL/MariaDB</em><br />
	Database username: <em>dvwa</em><br />
	Database password: <em>******</em><br />
	Database database: <em>dvwa</em><br />
	Database host: <em>127.0.0.1</em><br />
	Database port: <em>3306</em><br />
	<br />
	reCAPTCHA key: <span class="failure">Missing</span><br />
	<br />
	[User: kali] Writable folder /var/www/html/DVWA/hackable/uploads/: <span class="success">Yes</span><br />
	[User: kali] Writable file /var/www/html/DVWA/external/phpids/0.6/lib/IDS/tmp/phpids_log.txt: <span class="success">Yes</span><br />
	<br />
	<br />
	[User: kali] Writable folder /var/www/html/DVWA/config: <span class="success">Yes</span>
	<br />
	<i><span class="failure">Status in red</span>, indicate there will be an issue when trying to complete some modules.</i><br />
	<br />
	If you see disabled on either <i>allow_url_fopen</i> or <i>allow_url_include</i>, set the following in your php.ini file and restart Apache.<br />
	<pre><code>allow_url_fopen = On
allow_url_include = On</code></pre>
	These are only required for the file inclusion labs so unless you want to play with those, you can ignore them.

	<br /><br /><br />

	<!-- Create db button -->
	<form action="#" method="post">
		<input name="create_db" type="submit" value="Create / Reset Database">
		<input type='hidden' name='user_token' value='5d67b07c077fc6258f8db39e21de96fb' />
	</form>
	<br />
	<hr />
</div>
				<br /><br />
				

			</div>

			<div class="clear">
			</div>

			<div id="system_info">
				
			</div>

			<div id="footer">

				<p>Damn Vulnerable Web Application (DVWA) v1.10 *Development*</p>
				<script src='/dvwa/js/add_event_listeners.js'></script>

			</div>

		</div>

	</body>

</html>