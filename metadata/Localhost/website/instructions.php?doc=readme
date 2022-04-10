<!DOCTYPE html>

<html lang="en-GB">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

		<title>Instructions :: Damn Vulnerable Web Application (DVWA) v1.10 *Development*</title>

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
				<ul class="menuBlocks"><li class=""><a href="setup.php">Setup DVWA</a></li>
<li class="selected"><a href="instructions.php">Instructions</a></li>
</ul><ul class="menuBlocks"><li class=""><a href="about.php">About</a></li>
</ul>
				</div>

			</div>

			<div id="main_body">

				
<div class="body_padded">
	<h1>Instructions</h1>

	<div class="submenu"><span class="submenu_item selected"><a href="?doc=readme">Read Me</a></span><span class="submenu_item"><a href="?doc=PDF">PDF Guide</a></span><span class="submenu_item"><a href="?doc=changelog">Change Log</a></span><span class="submenu_item"><a href="?doc=copying">Copying</a></span><span class="submenu_item"><a href="?doc=PHPIDS-license">PHPIDS License</a></span></div>

	<span class="fixed">
		<h1>DAMN VULNERABLE WEB APPLICATION</h1>
<p>Damn Vulnerable Web Application (DVWA) is a PHP/MySQL web application that is damn vulnerable. Its main goal is to be an aid for security professionals to test their skills and tools in a legal environment, help web developers better understand the processes of securing web applications and to aid both students &amp; teachers to learn about web application security in a controlled class room environment.</p>
<p>The aim of DVWA is to <strong>practice some of the most common web vulnerabilities</strong>, with <strong>various levels of difficulty</strong>, with a simple straightforward interface.
Please note, there are <strong>both documented and undocumented vulnerabilities</strong> with this software. This is intentional. You are encouraged to try and discover as many issues as possible.</p>
<hr />
<h2>WARNING!</h2>
<p>Damn Vulnerable Web Application is damn vulnerable! <strong>Do not upload it to your hosting provider's public html folder or any Internet facing servers</strong>, as they will be compromised. It is recommended using a virtual machine (such as <a href="https://www.virtualbox.org/">VirtualBox</a> or <a href="https://www.vmware.com/">VMware</a>), which is set to NAT networking mode. Inside a guest machine, you can download and install <a href="https://www.apachefriends.org/en/xampp.html">XAMPP</a> for the web server and database.</p>
<h3>Disclaimer</h3>
<p>We do not take responsibility for the way in which any one uses this application (DVWA). We have made the purposes of the application clear and it should not be used maliciously. We have given warnings and taken measures to prevent users from installing DVWA on to live web servers. If your web server is compromised via an installation of DVWA, it is not our responsibility, it is the responsibility of the person/s who uploaded and installed it.</p>
<hr />
<h2>License</h2>
<p>This file is part of Damn Vulnerable Web Application (DVWA).</p>
<p>Damn Vulnerable Web Application (DVWA) is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.</p>
<p>Damn Vulnerable Web Application (DVWA) is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.</p>
<p>You should have received a copy of the GNU General Public License
along with Damn Vulnerable Web Application (DVWA).  If not, see <a href="https://www.gnu.org/licenses/">https://www.gnu.org/licenses/</a>.</p>
<hr />
<h2>Internationalisation</h2>
<p>This file is available in multiple languages:</p>
<ul>
<li>Chinese: <a href="README.zh.md">简体中文</a></li>
<li>Turkish: <a href="README.tr.md">Türkçe</a></li>
</ul>
<p>If you would like to contribute a translation, please submit a PR. Note though, this does not mean just run it through Google Translate and send that in, those will be rejected.</p>
<hr />
<h2>Download</h2>
<p>While there are various versions of DVWA around, the only supported version is the latest source from the official GitHub repository. You can either clone it from the repo:</p>
<pre><code>git clone https://github.com/digininja/DVWA.git</code></pre>
<p>Or <a href="https://github.com/digininja/DVWA/archive/master.zip">download a ZIP of the files</a>.</p>
<hr />
<h2>Installation</h2>
<p><strong>Please make sure your config/config.inc.php file exists. Only having a config.inc.php.dist will not be sufficient and you'll have to edit it to suit your environment and rename it to config.inc.php. <a href="https://www.howtogeek.com/205086/beginner-how-to-make-windows-show-file-extensions/">Windows may hide the trailing extension.</a></strong></p>
<h3>Installation Videos</h3>
<ul>
<li><a href="https://www.youtube.com/watch?v=cak2lQvBRAo">Installing Damn Vulnerable Web Application (DVWA) on Windows 10</a> [12:39 minutes]</li>
</ul>
<h3>Windows + XAMPP</h3>
<p>The easiest way to install DVWA is to download and install <a href="https://www.apachefriends.org/en/xampp.html">XAMPP</a> if you do not already have a web server setup.</p>
<p>XAMPP is a very easy to install Apache Distribution for Linux, Solaris, Windows and Mac OS X. The package includes the Apache web server, MySQL, PHP, Perl, a FTP server and phpMyAdmin.</p>
<p>XAMPP can be downloaded from:
<a href="https://www.apachefriends.org/en/xampp.html">https://www.apachefriends.org/en/xampp.html</a></p>
<p>Simply unzip dvwa.zip, place the unzipped files in your public html folder, then point your browser to: <code>http://127.0.0.1/dvwa/setup.php</code></p>
<h3>Linux Packages</h3>
<p>If you are using a Debian based Linux distribution, you will need to install the following packages <em>(or their equivalent)</em>:</p>
<p><code>apt-get -y install apache2 mariadb-server php php-mysqli php-gd libapache2-mod-php</code></p>
<p>The site will work with MySQL instead of MariaDB but we strongly recommend MariaDB as it works out of the box whereas you have to make changes to get MySQL to work correctly.</p>
<h3>Database Setup</h3>
<p>To set up the database, simply click on the <code>Setup DVWA</code> button in the main menu, then click on the <code>Create / Reset Database</code> button. This will create / reset the database for you with some data in.</p>
<p>If you receive an error while trying to create your database, make sure your database credentials are correct within <code>./config/config.inc.php</code>. <em>This differs from config.inc.php.dist, which is an example file.</em></p>
<p>The variables are set to the following by default:</p>
<pre><code class="language-php">$_DVWA[ 'db_server'] = '127.0.0.1';
$_DVWA[ 'db_port'] = '3306';
$_DVWA[ 'db_user' ] = 'dvwa';
$_DVWA[ 'db_password' ] = 'p@ssw0rd';
$_DVWA[ 'db_database' ] = 'dvwa';</code></pre>
<p>Note, if you are using MariaDB rather than MySQL (MariaDB is default in Kali), then you can't use the database root user, you must create a new database user. To do this, connect to the database as the root user then use the following commands:</p>
<pre><code class="language-mysql">mysql&gt; create database dvwa;
Query OK, 1 row affected (0.00 sec)

mysql&gt; create user dvwa@localhost identified by 'p@ssw0rd';
Query OK, 0 rows affected (0.01 sec)

mysql&gt; grant all on dvwa.* to dvwa@localhost;
Query OK, 0 rows affected (0.01 sec)

mysql&gt; flush privileges;
Query OK, 0 rows affected (0.00 sec)</code></pre>
<h3>Other Configuration</h3>
<p>Depending on your Operating System, as well as version of PHP, you may wish to alter the default configuration. The location of the files will be different on a per-machine basis.</p>
<p><strong>Folder Permissions</strong>:</p>
<ul>
<li><code>./hackable/uploads/</code> - Needs to be writeable by the web service (for File Upload).</li>
<li><code>./external/phpids/0.6/lib/IDS/tmp/phpids_log.txt</code> - Needs to be writable by the web service (if you wish to use PHPIDS).</li>
</ul>
<p><strong>PHP configuration</strong>:</p>
<ul>
<li><code>allow_url_include = on</code> - Allows for Remote File Inclusions (RFI)   [<a href="https://secure.php.net/manual/en/filesystem.configuration.php#ini.allow-url-include">allow_url_include</a>]</li>
<li><code>allow_url_fopen = on</code> -  Allows for Remote File Inclusions (RFI)    [<a href="https://secure.php.net/manual/en/filesystem.configuration.php#ini.allow-url-fopen">allow_url_fopen</a>]</li>
<li><code>safe_mode = off</code> - (If PHP &lt;= v5.4) Allows for SQL Injection (SQLi) [<a href="https://secure.php.net/manual/en/features.safe-mode.php">safe_mode</a>]</li>
<li><code>magic_quotes_gpc = off</code> - (If PHP &lt;= v5.4) Allows for SQL Injection (SQLi) [<a href="https://secure.php.net/manual/en/security.magicquotes.php">magic_quotes_gpc</a>]</li>
<li><code>display_errors = off</code> - (Optional) Hides PHP warning messages to make it less verbose [<a href="https://secure.php.net/manual/en/errorfunc.configuration.php#ini.display-errors">display_errors</a>]</li>
</ul>
<p><strong>File: <code>config/config.inc.php</code></strong>:</p>
<ul>
<li><code>$_DVWA[ 'recaptcha_public_key' ]</code> &amp; <code>$_DVWA[ 'recaptcha_private_key' ]</code> - These values need to be generated from: <a href="https://www.google.com/recaptcha/admin/create">https://www.google.com/recaptcha/admin/create</a></li>
</ul>
<h3>Default Credentials</h3>
<p><strong>Default username = <code>admin</code></strong></p>
<p><strong>Default password = <code>password</code></strong></p>
<p><em>...can easily be brute forced ;)</em></p>
<p>Login URL: <a href="http://127.0.0.1/login.php">http://127.0.0.1/login.php</a></p>
<p><em>Note: This will be different if you installed DVWA into a different directory.</em></p>
<hr />
<h2>Docker Container</h2>
<ul>
<li><a href="https://hub.docker.com/r/vulnerables/web-dvwa/">dockerhub page</a>
<code>docker run --rm -it -p 80:80 vulnerables/web-dvwa</code></li>
</ul>
<p>Please ensure you are using aufs due to previous MySQL issues. Run <code>docker info</code> to check your storage driver. If it isn't aufs, please change it as such. There are guides for each operating system on how to do that, but they're quite different so we won't cover that here.</p>
<hr />
<h2>Troubleshooting</h2>
<p>These assume you are on a Debian based distro, such as Debian, Ubuntu and Kali. For other distros, follow along, but update the command where appropriate.</p>
<h3>I browsed to the site and got a 404</h3>
<p>If you are having this problem you need to understand file locations. By default, the Apache document root (the place it starts looking for web content) is <code>/var/www/html</code>. If you put the file <code>hello.txt</code> in this directory, to access it you would browse to <code>http://localhost/hello.txt</code>.</p>
<p>If you created a directory and put the file in there - <code>/var/www/html/mydir/hello.txt</code> - you would then need to browse to <code>http://localhost/mydir/hello.txt</code>.</p>
<p>Linux is by default case sensitive and so in the example above, if you tried to browse to any of these, you would get a <code>404 Not Found</code>:</p>
<ul>
<li><code>http://localhost/MyDir/hello.txt</code></li>
<li><code>http://localhost/mydir/Hello.txt</code></li>
<li><code>http://localhost/MYDIR/hello.txt</code></li>
</ul>
<p>How does this affect DVWA? Most people use git to checkout DVWA into <code>/var/www/html</code>, this gives them the directory <code>/var/www/html/DVWA/</code> with all the DVWA files inside it. They then browse to <code>http://localhost/</code> and get either a <code>404</code> or the default Apache welcome page. As the files are in DVWA, you must browse to <code>http://localhost/DVWA</code>.</p>
<p>The other common mistake is to browse to <code>http://localhost/dvwa</code> which will give a <code>404</code> because <code>dvwa</code> is not <code>DVWA</code> as far as Linux directory matching is concerned.</p>
<p>So after setup, if you try to visit the site and get a <code>404</code>, think about where you installed the files to, where they are relative to the document root, and what the case of the directory you used is.</p>
<h3>"Access denied" running setup</h3>
<p>If you see the following when running the setup script it means the username or password in the config file do not match those configured on the database:</p>
<pre><code>Database Error #1045: Access denied for user 'notdvwa'@'localhost' (using password: YES).</code></pre>
<p>The error is telling you that you are using the username <code>notdvwa</code>.</p>
<p>The following error says you have pointed the config file at the wrong database.</p>
<pre><code>SQL: Access denied for user 'dvwa'@'localhost' to database 'notdvwa'</code></pre>
<p>It is saying that you are using the user <code>dvwa</code> and trying to connect to the database <code>notdvwa</code>.</p>
<p>The first thing to do is to double check what you think you put in the config file is what is actually there.</p>
<p>If it matches what you expect, the next thing to do is to check you can log in as the user on the command line. Assuming you have a database user of <code>dvwa</code> and a password of <code>p@ssw0rd</code>, run the following command:</p>
<pre><code>mysql -u dvwa -pp@ssw0rd -D dvwa</code></pre>
<p><em>Note: There is no space after the -p</em></p>
<p>If you see the following, the password is correct:</p>
<pre><code>Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 14
Server version: 10.3.22-MariaDB-0ubuntu0.19.10.1 Ubuntu 19.10

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [dvwa]&gt;</code></pre>
<p>As you can connect on the command line, it is likely something wrong in the config file, double check that and then raise an issue if you still can't get things working.</p>
<p>If you see the following, the username or password you are using is wrong. Repeat the <a href="#database-setup">Database Setup</a> steps and make sure you use the same username and password throughout the process.</p>
<pre><code>ERROR 1045 (28000): Access denied for user 'dvwa'@'localhost' (using password: YES)</code></pre>
<p>If you get the following, the user credentials are correct but the user does not have access to the database. Again, repeat the setup steps and check the database name you are using.</p>
<pre><code>ERROR 1044 (42000): Access denied for user 'dvwa'@'localhost' to database 'dvwa'</code></pre>
<p>The final error you could get is this:</p>
<pre><code>ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/var/run/mysqld/mysqld.sock' (2)</code></pre>
<p>This is not an authentication issue but tells you that the database server is not running. Start it with the following</p>
<pre><code class="language-sh">sudo service mysql start</code></pre>
<h3>Unknown authentication method</h3>
<p>With the most recent versions of MySQL, PHP can no longer talk to the database in its default configuration. If you try to run the setup script and get the following message it means you have configuration.</p>
<pre><code>Database Error #2054: The server requested authentication method unknown to the client.</code></pre>
<p>You have two options, the easiest is to uninstall MySQL and install MariaDB. The following is the official guide from the MariaDB project:</p>
<p><a href="https://mariadb.com/resources/blog/how-to-migrate-from-mysql-to-mariadb-on-linux-in-five-steps/">https://mariadb.com/resources/blog/how-to-migrate-from-mysql-to-mariadb-on-linux-in-five-steps/</a></p>
<p>Alternatively, follow these steps:</p>
<ol>
<li>
<p>As root, edit the following file: <code>/etc/mysql/mysql.conf.d/mysqld.cnf</code></p>
</li>
<li>
<p>Under the line <code>[mysqld]</code>, add the following:
<code>default-authentication-plugin=mysql_native_password</code></p>
</li>
<li>
<p>Restart the database: <code>sudo service mysql restart</code></p>
</li>
<li>
<p>Check the authentication method for your database user:</p>
<pre><code class="language-sql"> mysql&gt; select Host,User, plugin from mysql.user where mysql.user.User = 'dvwa';
 +-----------+------------------+-----------------------+
 | Host      | User             | plugin                |
 +-----------+------------------+-----------------------+
 | localhost | dvwa             | caching_sha2_password |
 +-----------+------------------+-----------------------+
 1 rows in set (0.00 sec)</code></pre>
</li>
<li>
<p>You'll likely see <code>caching_sha2_password</code>. If you do, run the following command:</p>
<pre><code class="language-sql"> mysql&gt; ALTER USER dvwa@localhost IDENTIFIED WITH mysql_native_password BY 'p@ssw0rd';</code></pre>
</li>
<li>
<p>Re-running the check, you should now see <code>mysql_native_password</code>.</p>
<pre><code class="language-sql"> mysql&gt; select Host,User, plugin from mysql.user where mysql.user.User = 'dvwa';
 +-----------+------+-----------------------+
 | Host      | User | plugin                |
 +-----------+------+-----------------------+
 | localhost | dvwa | mysql_native_password |
 +-----------+------+-----------------------+
 1 row in set (0.00 sec)</code></pre>
</li>
</ol>
<p>After all that, the setup process should now work as normal.</p>
<p>If you want more information see the following page: <a href="https://www.php.net/manual/en/mysqli.requirements.php">https://www.php.net/manual/en/mysqli.requirements.php</a>.</p>
<h3>Database Error #2002: No such file or directory.</h3>
<p>The database server is not running. In a Debian based distro this can be done with:</p>
<pre><code class="language-sh">sudo service mysql start</code></pre>
<h3>Errors "MySQL server has gone away" and "Packets out of order"</h3>
<p>There are a few reasons you could be getting these errors, but the most likely is the version of database server you are running is not compatible with the version of PHP.</p>
<p>This is most commonly found when you are running the latest version of MySQL as PHP and it do not get on well. Best advice, ditch MySQL and install MariaDB as this is not something we can support.</p>
<p>For more information, see:</p>
<p><a href="https://www.ryadel.com/en/fix-mysql-server-gone-away-packets-order-similar-mysql-related-errors/">https://www.ryadel.com/en/fix-mysql-server-gone-away-packets-order-similar-mysql-related-errors/</a></p>
<h3>SQL Injection won't work on PHP v5.2.6.</h3>
<p>PHP 5.x reached end of life in January 2019 so we would recommend running DVWA with a current 7.x version, if you must use 5.x...</p>
<p>If you are using PHP v5.2.6 or above, you will need to do the following in order for SQL injection and other vulnerabilities to work.</p>
<p>In <code>.htaccess</code>:</p>
<p>Replace:</p>
<pre><code class="language-php">&lt;IfModule mod_php5.c&gt;
    php_flag magic_quotes_gpc off
    #php_flag allow_url_fopen on
    #php_flag allow_url_include on
&lt;/IfModule&gt;</code></pre>
<p>With:</p>
<pre><code class="language-php">&lt;IfModule mod_php5.c&gt;
    magic_quotes_gpc = Off
    allow_url_fopen = On
    allow_url_include = On
&lt;/IfModule&gt;</code></pre>
<h3>Command Injection won't work</h3>
<p>Apache may not have high enough privileges to run commands on the web server. If you are running DVWA under Linux make sure you are logged in as root. Under Windows log in as Administrator.</p>
<h3>Why can't the database connect on CentOS?</h3>
<p>You may be running into problems with SELinux.  Either disable SELinux or run this command to allow the web server to talk to the database:</p>
<pre><code>setsebool -P httpd_can_network_connect_db 1</code></pre>
<h3>Anything else</h3>
<p>For the latest troubleshooting information please read both open and closed tickets in the git repo:</p>
<p><a href="https://github.com/digininja/DVWA/issues">https://github.com/digininja/DVWA/issues</a></p>
<p>Before submitting a ticket, please make sure you are running the latest version of the code from the repo. This is not the latest release, this is the latest code from the master branch.</p>
<p>If raising a ticket, please submit at least the following information:</p>
<ul>
<li>
<p>Operating System</p>
</li>
<li>
<p>The last 5 lines from the web server error log directly after whatever error you are reporting occurs</p>
</li>
<li>
<p>If it is a database authentication problem, go through the steps above and screenshot each step. Submit these along with a screenshot of the section of the config file showing the database user and password.</p>
</li>
<li>
<p>A full description of what is going wrong, what you expect to happen, and what you have tried to do to fix it. "login broken" is no enough for us to understand your problem and to help fix it.</p>
</li>
<li>
<ul>
<li>
<ul>
<li>
</li>
</ul>
</li>
</ul>
</li>
</ul>
<h2>SQLite3 SQL Injection</h2>
<p><em>Support for this is limited, before raising issues, please ensure you are prepared to work on debugging, do not simply claim "it does not work".</em></p>
<p>By default, SQLi and Blind SQLi are done against the MariaDB/MySQL server used by the site but it is possible to switch to do the SQLi testing against SQLite3 instead.</p>
<p>I am not going to cover how to get SQLite3 working with PHP, but it should be a simple case of installing the <code>php-sqlite3</code> package and making sure it is enabled.</p>
<p>To make the switch, simply edit the config file and add or edit these lines:</p>
<pre><code>$_DVWA["SQLI_DB"] = "sqlite";
$_DVWA["SQLITE_DB"] = "sqli.db";</code></pre>
<p>By default it uses the file <code>database/sqli.db</code>, if you mess it up, simply copy <code>database/sqli.db.dist</code> over the top.</p>
<p>The challenges are exactly the same as for MySQL, they just run against SQLite3 instead.</p>
<hr />
<h2>Links</h2>
<p>Homepage: <a href="https://dvwa.co.uk/">https://dvwa.co.uk/</a></p>
<p>Project Home: <a href="https://github.com/digininja/DVWA">https://github.com/digininja/DVWA</a></p>
<p><em>Created by the DVWA team</em></p>
	</span>
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