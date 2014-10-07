---
layout: tutorial
title: Set Up Your Own Web Server
description: "Ever wanted to have a webpage but didn't want to go through the process of signing up with a hosting company."
modified: 2011-07-16
tags: [Apache, MySQL, PHP]
image:
  src: https://farm4.staticflickr.com/3930/15440676276_23f16f9cd0_o.jpg
comments: true
share: true
---

Ever wanted to have a webpage but didn't want to go through the process of signing up with a hosting company, especially when you have that old mac computer not doing anything. Well that is exactly what I wanted to do. Below I give a tutorial (based on my own experience) on how to set up Apache, PHP, MySQL on a mac. The process required a lot of googling for me but hopefully this post will alleviate some that for you. Word of caution though, opening up your computer to the internet without the proper security knowledge can be severely costly. I don't give any security advice in this tutorial, so do some homework on the security risk before opening up that firewall to all that the internet has to offer.

### Table of Contents

1. Download the latest version of PHP and install it
2. Update Apache configuration file
3. Create a PHP5 configuration file
4. Test Apache is working with PHP
5. Download and install MySQL
6. Create a MySQL configuration file
7. Download and configure phpMyAdmin
8. Test MySQL with phpMyAdmin
9. ALL DONE!
10. Links

First off, what is Apache, PHP, and MySQL?
Apache: An open source web server program that comes with Mac OS X.
PHP: General purpose scripting language used for web development. It's needed for WordPress sites, like this one.
MySQL: An open source database program.

One last thing before we get started, if you want these programs but don't want to set them up yourself there is a great program called [MAMP](http://www.mamp.info/en/index.html) that will do it all for you. There are some drawbacks to using MAMP but it is definitely easier than doing this way. I didn't use MAMP because I wanted to learn more about Apache, PHP, and MySQL so I thought I would do it the hard way.


### 1. Download the latest version of [PHP](http://www.entropy.ch/software/macosx/php/) and install it.


Read through the installation instruction on the PHP Apache Module website and install PHP. Take note of the Deactivate Other PHP Modules section. But overall nothing too tricky here.


### 2. Update Apache configuration file


Apache comes with Mac OS X, so no reason to install this tool. But it does have to be updated to tell it to use the PHP module. This is done in the 'httpd.conf' file, which is located in '/etc/apache2'. This is owned by the system, so it can be only edited under the root user. To edit the file type the following into the terminal (Terminal.app in is in the /Applications/Utilities folder)

`sudo nano /etc/apache2/httpd.conf`

and enter your password when prompted. Now look for the line

`#LoadModule php5_module libexec/apache2/libphp5.so`

and remove the # in front of the line. If this line doesn't exist then add it under the other LoadModule lines. Press 'ctrl-x', 'y', 'return' to save and exit.


### 3. Create a PHP5 configuration file


Continuing to work in the terminal: change directories to '/etc', copy the file 'php.ini.default' to 'php.ini', and edit this file.
`
cd /etc
sudo cp php.ini.default php.ini
sudo nano php.ini
`

In this file change the following lines
`
pdo_mysql.default_socket =
mysql.default_socket =
mysqli.default_socket =
`

to
`
pdo_mysql.default_socket = /tmp/mysql.sock
mysql.default_socket = /tmp/mysql.sock
mysqli.default_socket = /tmp/mysql.sock
`

Press 'ctrl-x', 'y', 'return' to save and exit.


### 4. Test Apache is working with PHP


Turn Apache on in OS X by going to system preferences (under the apple menu), click on Sharing, and click the box next to Web Sharing. Now Apache will serve websites in the '/Library/WebServer/Documents' folder to 'http://localhost' and websites in the '~/Sites' folder to 'http://localhost/~user', where user is the name of your mac user account.

Create a plain text file name the folder '~/Sites' named 'test.php'. In this text file add the following line

`<?php phpinfo(); ?>`

Open a web browser and goto the URL of 'http://localhost/~user/text.php' (replace 'user' with your user name). If everything was setup correctly you should see a PHP info page.


### 5. Download and install [MySQL](http://www.mysql.com/downloads/mysql/)


On the download page of MySQL, download the DMG Archive version. Once the download finishes double-click the 'mysql-5.1.51.osx10.6-x86_64.pkg' or whatever version you downloaded. This installs MySQL on your computer. The other items are not needed but are very handy; I recommend them. 'MySQL.prefPane' puts a new preference item in your system preference gives you the ability to easily start and stop the MySQL server. Otherwise it has to be done through the command line. 'MySQL_StartupItem.pkg' allows the MySQL to startup automatically when your computer starts up. You can control this through the MySQL preference pane or by the command line.

I recommend to also add the MySQL bin to your path in your .profile file

`edit ~/.profile`

Add this line to the text file

`export PATH=$PATH:/user/local/mysql/bin`


### 6. Create a MySQL configuration file


Type the following command into the terminal

`sudo cp /usr/local/mysql/support-files/my-small.cnf /etc/my.cnf`

and enter your password when prompted.

Also add a password to the "root" MySQL user.

`mysqladmin -u root password 'thePassword'`


### 7. Download and configure [phpMyAdmin](http://www.phpmyadmin.net/home_page/downloads.php)


phpMyAdmin is a web base interface for MySQL databases. It is not needed but can be a convenient tool in administering your MySQL databases. It will also serve to check that everything else is set up properly. Once phpMyAdmin downloaded unzip it and place the 'phpMyAdmin' folder in the '~/Sites' folder.

Open up the 'phpMyAdmin' folder and copy the 'config.sample.inc.php' file. Rename this copy file to 'config.inc.php'. Open this new file in a text editor and make sure the following lines look like this


    /* User for advanced features */
    $cfg['Servers'][$i]['controluser'] = 'root';
    $cfg['Servers'][$i]['controlpass'] = 'thePassword';
    $cfg['Servers'][$i]['user'] = 'root';
    $cfg['Servers'][$i]['password'] = 'thePassword';
    `
    `
    /* Authentication type */
    $cfg['Servers'][$i]['auth_type'] = 'config';
    /* Server parameters */
    $cfg['Servers'][$i]['host'] = 'localhost';
    $cfg['Servers'][$i]['connect_type'] = 'tcp';
    $cfg['Servers'][$i]['compress'] = false;
    /* Select mysqli if your server has it */
    $cfg['Servers'][$i]['extension'] = 'mysql';
    $cfg['Servers'][$i]['AllowNoPassword'] = true;


Save this file.


### 8. Test MySQL with phpMyAdmin


Open up your web browser and type in the following URL 'http://localhost/~user/phpMyAdmin' (replace 'user' with your user name). If everything was setup correctly you should see the phpMyAdmin page.


### 9. ALL DONE!


That's it. Now you have working Apache server that runs PHP code and a working MySQL server. In my next how to I will show how to get WordPress working with this setup.


### 10. Links


Here are some good links:

Apache
[Apache Documentation](http://httpd.apache.org/docs/2.2/)

MySQL
[Getting Started with MySQL](http://dev.mysql.com/tech-resources/articles/mysql_intro.html)
[General MySQL Security Guidelines](http://dev.mysql.com/doc/refman/5.0/en/security-guidelines.html)
[Specifying Account Names in MySQL](http://dev.mysql.com/doc/refman/5.0/en/account-names.html)
[Copying MySQL Databases to Another Machine](http://dev.mysql.com/doc/refman/5.0/en/copying-databases.html)
