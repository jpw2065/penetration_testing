# Web Vulnerabilities Lab

Hello! Welcome to the Web Vulnerabilities Lab. This lab pertains to the insecurities that you find on the world wide web. Hopefully you can come away from this lab having a deepr undertanding for how vulneraibilies can be discoved in web applications. I divded this lab into four different sections: Introduction, Setup, Excercises, and Questions.

## Introduction

We'll be looking at a tool named w3af. W3af is a web attack and exploit framework. W3af is used to do a variety of different tasks from discovering vulnerabilities in web applcations to delivery payloads to exploit said vulnerabilities. The main premise however always surronds web applications. 

To give some background about the tool. The tool was developed 2007 and it's last major release was in 2015. Since 2007 after it's first release the application has been open source. The tool was further developed after a sponsorship with Rapid7. Python is the core language of the tool.

W3af as mentioned can do work in crawling, auditing, exploiting, in addition to searching. All of these specific features are discussed more in the report create by myself and the documentation of the code. In today's lab we will be looking specifically at the crawling, and auditing features as those provide the most immediate benefits in a penetration test. In order to test some of this functionality we will be running the tool up against the Damn Vulnerable Web Application. Without further ado lets jump into the content and install the application.

## Instructions

Were going to need several different applications all functioning in order to get this lab setup. Those applications include the following:

- PHP ( <= v5.6)
- MySQL ( >= 5.5.44)
- Apache ( >= 2.4.10)
- DVWA ( >= 1.10)
- W3af ( >= 1.6.54)

###  Startup 

1. Spin up the Kali2 4.0 box.

### Installing W3af

1. First check to see if the kali box has w3af installed. You can run the following command to check to see if w3af is installed on the system.
```
w3af
```
2. If w3af is not installed run the following commands.
```
sudo apt-get update
sudo apt-get install -y w3af
```
3. We will strictly be using the command line version of this tool. The keeps the lab simple. You can run the following command in order to start up the command line interface. If you do not have the tool installed at /usr/share/w3af then run the w3af_console wherever you installed the tool.
```
/usr/share/w3af/w3af_console
```

### Donwloading DVWA
 
1. Cd into the html directory.
```
cd /var/www/html
```
2. Pull the code from the repository.
```
git pull origin https://github.com/digininja/DVWA
```
3. Chage permissions on the downloaded repository. 
```
chgrp -R www-data /var/www/html/DVWA
chmod -R 775 /var/www/html/DVWA
```
4. Start apache (Install if not already installed on Kali box).
```
systemctl start apache2
```
5. Navigate to localhost/DVWA in iceweasel. You should see a DVWA system error at this point exclaiming that the config file was not found. To fix this copy the config.inc.php.dist in the config directory of DVWA to config.inc.php.
```
cp /var/www/html/DVWA/config/config.inc.php.dist /var/www/html/DVWA/config/config.inc.php
```
### Setting Up the Database

1. Start mysql and login.
```
systemctl start mysql
mysql -u root
```
2. Create a new database for DVWA (don't forget the semi-colon).
```
CREATE DATABASE dvwa;
```
3. Create the user which DVWA will use to login. Also grant all priveleges on the user. Exit mysql afterwords.
```
CREATE USER dvwa@'127.0.0.1' IDENTIFIED BY p@ssw0rd;
GRANT ALL PRIVLIGES ON dvwa.* TO 'dvwa'@'localhost' IDENTIFIED BY 'p@ssw0rd';
exit
```

### Setting Up PHP

1. Check your php version using this command. If you do not have the correct version installed then downgrade / upgrade to Php v5.6. You will need to find your own guide for how to do that in Kali Linux.
```
php -v
```
2. Install the mysql module into php if it is not already.
```
sudo apt install php5-mysql
```
3. Finally edit the php.ini file and set *allow_url_fopen = On*, and *allow_url_include = On*. Restart apache afterwords.
```
vim /etc/php5/apache2/php.ini
systemctl restart apache2
```

### Booting Up DVWA

1. At this point all dependencies are installed. Navigate to DVWA in your browser found at localhost/DVWA.
2. Login into the application using your MySQL credentials: username: dvwa / password: p@ssw0rd. You should see the following screen at this point.
![Successful login screen](https://drive.google.com/file/d/12FMaM6Zz2vSYaXFL0ehyyJQ4aL1EKJrR/view?usp=sharing)
3. Click on the button *Create / Reset Database*. This will redirect you back to the login screen.
4. Login into the application again but this time with the credentials: username: admin / password: password.
5. Explore the applcation. Note that the File Upload, and Insecure CAPTCHA options will not be available as we did not install the necessary libraries / do the proper configurations to make those function.
6. When you are read to move on set the DVWA Security level to Low. You can find this setting in the *DVWA Security* tab.
7. Your done! Lets start finding those damn vulnerabilities.

 
If w3af is not installed run the following commands.
sudo apt-get update
sudo apt-get install -y w3af
We will strictly be working with the command line version for the simplicity of this lab exercise. If you would like to use the GUI feel free but instructions will not be provided for this functionality. To run w3af on command line use the following command:
/usr/share/w3af/w3af_console

