---
layout: post
title: Set up WordPress on your own web server
description: ""
modified: 2011-07-18
category: tutorial
tags: [Wordpress]
image:
  feature: rowland_web_banner.jpg
comments: true
share: true
---

Now that you have your web server set up (after reading my previous how to - [Set up your own web server](http://www.rowlandoflaherty.com/posts/how-tos/set-up-your-own-web-server/)) I will show you how to get WordPress installed on your web serving mac. I will do this using almost entirely unix commands in the Terminal.app.<!-- more -->

To get started first open up the terminal (/Applications/Utilities/Terminal.app).

Type the following commands into the terminal.

1. Download WordPress
`cd ~/Downloads`
wget http://wordpress.org/latest.zip

2. Unzip wordpress folder to web server root directory
`unzip -q latest.zip -d ~/Sites`

3. Rename wordpress folder to "myWordPressSite"
`cd /Library/WebServer/Documents`
`mv wordpress myWordPressSite`

4. Change group of "myWordPressSite" folder and all lower folders/files to localaccounts
`chgrp -R localaccounts myWordPressSite`

5. Change permissions of "myWordPressSite" folder and all lower folders/files
`chmod -R u+rw-x+X,g=rw-x+X,o= myWordPressSite`

6. Create a .htaccess file with the correct permissions
`touch .htaccess`
`chgrp localaccounts .htaccess`
`chmod 660 .htaccess`

7. Create a new mySQL database named myWordPressSite
`mysql -u root -p`
`mysql> create database myWordPressSite;`

8. Create a new mySQL user named wordpress
`mysql> use mysql;`
`mysql> insert into user (host,user,password)`
`values('localhost','wordpress',password('somePassword'));`

9. Add previliges for new wordpress user
`mysql> grant all on myWordPressSite.* to 'wordpress'@'localhost';`
`mysql> flush privileges;`
`mysql> exit;`

10. Set up wordpress by going to http://localhost/myWordPressSite in your web browser and fill out the following form in your browser
Database Name: `myWordPressSite`
User Name: `wordpress`
Password: `somePassword`
Database Host: `localhost`
Table Prefix: `wp_`

11. Install WordPress by hitting the button

12. Copy index.php file to webserver root directory
`cp -a myWordPresSite/index.php .`

13. Edit new index.php file in your favorite text editor
Edit the line from
`require('./wp-blog-header.php');`
to
`require('./myWordPressSite/wp-blog-header.php');`

14. All done. Check out your WordPress site at: http://localhost

If want to install WordPress locally using MAMP here is a great tutorial on how to do that [http://codex.wordpress.org/Installing_WordPress_Locally_on_Your_Mac_With_MAMP](http://codex.wordpress.org/Installing_WordPress_Locally_on_Your_Mac_With_MAMP)
