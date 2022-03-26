# Web Vulnerabilities Lab

Hello! Welcome to the Web Vulnerabilities Lab. The topics of this lab are web vulnerabilities. Hopefully, you can come away from this lab having a deepr undertanding of web application vulnerabilities. In this lab you will also learn an automated method for discovering these vulnerabilities. I divided this lab into four different sections: Introduction, Setup, Excercises, and Questions.

## Introduction

We will be looking at a tool named w3af. W3af is an attack and exploit framework for web applications. W3af is used to do a variety of different tasks from discovering vulnerabilities in web applcations to the delivery of exploit payloads. 

To give some background about the tool. The tool was developed 2007 and it's last major release was in 2015. Since 2007 after it's first release the application has been open source. The tool was further developed after a sponsorship with Rapid7. The developers wrote and continue to write w3af in Python.

W3af as mentioned can do work in crawling, auditing, exploiting, and searching. All of these specific features are discussed more in the report and the documentation of the code. In today's lab we will be looking specifically at the crawling, and auditing features as those provide the most immediate benefits in a penetration test. In order to test some of this functionality we will be running the tool up against the Damn Vulnerable Web Application (DVWA). Without further ado lets jump into the content and install the application.

## Instructions

Were going to need several different applications in order to get this lab setup. The following applications are needed:

- PHP ( <= v5.6)
- MySQL ( >= 5.5.44)
- Apache ( >= 2.4.10)
- DVWA ( >= 1.10)
- W3af ( >= 1.6.54)

The below instructions will walk you through how to install each of the required dependencies.

###  Startup 

1. Spin up the Kali2 4.0 box on RLES.

### Installing W3af

1. First check to see if the kali box has w3af installed. You can run the following command to check to see if w3af is installed.
```
w3af
```
2. If w3af is not installed run the following commands.
```
sudo apt-get update
sudo apt-get install -y w3af
```
3. We will strictly be using the command line version of this tool. You can run the following command in order to start up the command line interface. If you do not have the tool installed at /usr/share/w3af (default Kali install) then run the w3af_console wherever you installed the tool.
```
/usr/share/w3af/w3af_console
```

### Donwloading DVWA
 
1. Cd into the www/html directory.
```
cd /var/www/html
```
2. Pull the code from the github repository.
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
5. Navigate to localhost/DVWA on your browser of choice. You should see a DVWA system error at this point exclaiming that the config file was not found. To fix this copy the config.inc.php.dist in the config directory of DVWA to config.inc.php.
```
cp /var/www/html/DVWA/config/config.inc.php.dist /var/www/html/DVWA/config/config.inc.php
```
### Setting Up the Database

1. Start mysql and login.
```
systemctl start mysql
mysql -u root
```
2. Create a new database for DVWA (don't forget the semi-colon at the end of all MySQL commands).
```
CREATE DATABASE dvwa;
```
3. Create the user which DVWA will use to login. Also grant all priveleges on the user for the dvwa database. Exit mysql afterwords.
```
CREATE USER dvwa@'127.0.0.1' IDENTIFIED BY p@ssw0rd;
GRANT ALL PRIVLIGES ON dvwa.* TO 'dvwa'@'localhost' IDENTIFIED BY 'p@ssw0rd';
exit
```

### Setting Up PHP

1. Check your php version using this command. If you do not have the correct version installed then downgrade/upgrade to PHP v5.6. You will need to find your own guide for how to do that in Kali Linux.
```
php -v
```
2. Install the php mysql module if not already installed.
```
sudo apt install php5-mysql
```
3. Finally edit the php.ini file and set *allow_url_fopen = On*, and *allow_url_include = On*. Restart apache afterwords.
```
vim /etc/php5/apache2/php.ini (File to edit)
systemctl restart apache2
```

### Booting Up DVWA

1. At this point all dependencies are installed. Navigate to DVWA in your browser found at http://localhost/DVWA.
2. Login to the application using your MySQL credentials. _Username_: dvwa / _Password_: p@ssw0rd. You should see the following screen at this point.

![Successful login screen](https://drive.google.com/uc?export=view&id=12FMaM6Zz2vSYaXFL0ehyyJQ4aL1EKJrR)

3. Click on the button *Create / Reset Database*. This will redirect you back to the login screen after setting up the database.
4. Login to the application again but this time with these default credentials. _Username_: admin / _Password_: password.
5. Explore the applcation. Note that the *File Upload*, and *Insecure CAPTCHA* options will not be available as we did not install the necessary libraries / do the proper configurations to make those function.
6. When you are ready to move on set the DVWA Security level to Low. You can find this setting in the *DVWA Security* tab.
7. Your done! Lets start finding those damn vulnerabilities.

## Exercises

### Crawling the Website

W3af provides crawling functionality of websites. With this functionality you can discover all the documents available on a domain. In this exercise we will be crawling all of the different documents on the DVWA website.

1. Change directories to where you have w3af installed. Default installation is at the following directory.
```
cd /usr/share/w3af
```
2. Now we are going to make a file that w3af uses in order to "login" to DVWA. DVWA uses session authentication. This means a session is held on the server so that when passed in as a cookie it knows which user is sending the request. As such w3af needs to get that cookie in order to login. To pass in that cookie to w3af you have to capture it on the browser than paste it into a new file that w3af can read. Follow the next steps in order to complete this.

    1. Login to DVWA on your browser of choice.
    2. Pull up the inspection tool. Click on the *Network* tab and navigate to a new page.
    3. You should see the request that was sent to the server. Click on that request and search for the information in the picture below. The information is sent as a cookie header during the request.
   
    ![Sesssion Token Location](https://drive.google.com/uc?export=view&id=1W0ctXt5_O-VUlpCUJqzvAd-0JWfxztoF)
    
    4. Extract this cookie and create a new file in the _root_ directory of w3af.
    ```
    echo "Cookie: PHPSESSIONID={session_id}; security=low" > dvwa-headers.txt
    ```
3. Copy the script given with the lab named *dvwa-crawler.w3af* to the installation directory of w3af. Make sure to look inside the file to understand what is happening.    
4. Run the script in w3af using the following command. W3af in this command takes the scripts and automatically runs all the commands found inside it.
```
./w3af_console -s dvwa-crawler.txt
```
5. Answer questions 1-5 in the questions section.

### Scanning for SQL Vulnerabilities

As we have recently learned in class SQL vulnerabilities pose a serious problem to web applications. There are many tactics used by new web applications to eliminate sql injection i.e. prepared statements. Many old applications however still suffer from SQL vulnerabilities. This exercises focuses on how you can use w3af to detect those vulnerabilities. Instaed of giving a script of commands as we did in the last example you are going to type in the commands in order to set-up w3af for auditing. Your going to also need your headers file that you generated in the last exercise to complete this exercise.

1. Change directories to where you have w3af installed. Default installation is at the following directory.
```
cd /usr/share/w3af
```
2. Configure w3af to run the SQL vulnerabiility check using the following commands in order. Also feel free to take a look around w3af. The commands presented function similar to how you would navigate the folders of a directory. If you ever get lost in the folders use the ```help``` command to print the available options.
```
http-settings
set headers_file dvwa-headers.txt
back
plugins
crawl web_spider
crawl config web_spider
set only_forward True
set ignore_regex .*logout.*
back
audit sqli
audit blind_sqli
back
target
set target http://localhost/DVWA/vulnerabilities/sql
```
3. Before you run the test save the settings you just configured in the profile. W3af clears out all settings upon test completion so if you messed something up having a backup will be easy to boot into.
```
profiles
save_as sql-vulnerability
```
To reload the profile run the following commands.
```
profiles
use sql-vulnerability
```
4. Start the scan using the start command.
```
start
```
5. You should notice that you have found some SQL vulnerabilities. Oh no! Bad developer. To confirm you have found these vulnerabilities check the knowledge database. This database stores found vulnerabilities for the current w3af session. To view the knowledge database run the following commands.
```
kb
list vulns
```
You should see the sql vulnerabilities that you found.
6. Answer questions 6-10.

## Questions

1.) During the initial setup phase why did we have to set the intensity of DVWA to low?

2.) How does DVWA authenticate the user of the application? Why do we care about this while running w3af?

3.) Where can I find the cookies that are sent to the server on a website?

4.) Inside the script in the *Crawling the Website* exercise why do we ignore the logout endpoint?

5.) From the output of the *Crawling the Website* exercise what is different between the output-http.txt vs. the output-w3af.txt?

6.) How do you enable plugins in w3af?

7.) What are the benefits of saving profiles while using w3af? (you may want to do supplemental research)

8.) What was the SQL Vulnerability that you found?

9.) Where can I go to find past vulnerabilities from previous runs of the application?

10.) If I wanted to scan for more types of vulnerabilities what module plugins would I enable?

## Conclusion
With these two exercises you now have a better understanding of the basics that surrond w3af. From crawling, to auditing w3af can handle a bunch of different operations to attack a website. One topic not discussed in this lab but is of interest is the explotiation features. I encourage you to explore the options that w3af for explotation in the documentation. These attacks can be useful when tyring to run penetration tests. Hopefully you had a fun time and thank you for your particiopation!
