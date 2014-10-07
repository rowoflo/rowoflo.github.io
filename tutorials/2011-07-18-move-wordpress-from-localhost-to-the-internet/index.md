---
layout: tutorial
title: Move WordPress from local host to the internet
description: I will show you how to get WordPress out to the whole internet.
modified: 2011-07-18
tags: [Apache, Wordpress]
image:
  src: https://farm4.staticflickr.com/3927/15278149438_08b5b45495_o.jpg
comments: true
share: true
---

Now that you got WordPress set up on your local network (after reading my previous how to - [Set up WordPress on your own web server](/tutorials/2011-07-17-set-up-wordpress-on-your-own-web-server) I will show you how to get WordPress out to the whole internet. Be advised I don't know what I am talking about really so there may be some serious security risks in doing this.

1. Goto WordPress settings and change "WordPress address (URL)" and "Site address (URL)" to your external IP address. Or update that information via MySQL directly (the commands are below). Note, if your ISP blocks port 80 (like mine does) you will have to pick a different port to serve your webpage on and add that to the end of your external IP address.

  `mysql -u wordpress -p myWordPressSite`
  `mysql> update wp_options set option_value = "http://111.222.333.444/myWordPressSite" where option_name = "siteurl";`
  `mysql> update rosmosis_options set option_value = "http://111.222.333.444" where option_name = "home";`

*You can get your external IP a variety ways; an easy way to just goto [whatismyip.com](http://www.whatismyip.com/).

2. Update Apache config file /etc/apache2/httpd.conf. Update the following lines to your port number and IP address.
Listen: 8888
ServerName: 111.222.333.444

3. Forward port 8888 from router. I have an Time Capsule and forwarding ports is really easy. Open /Applications/Utilities/AirPort Uility.app. Click on your Time Capsule in the left column. Select Advanced icon in the top then Port Mapping tab. Click the + button. Select "Personal Web Sharing" and change ports from 80 to 8888 (or whatever you choose). Put in the local IP address of your computer and hit the "Continue" button. Then hit the "Update" button and your Time Capsule should restart.

If you have a different router check your user manual on how to forward ports to your computer.

4. Restart Apache. This can be done in System Preferences under Sharing. Click off then back on the check box next to "Web Sharing". Or use the command below.
`sudo /usr/sbin/apachectl restart`

5. Dump database with the command below.
`mysqldump -u wordpress -p myWordPressSite > myWordPressSite.sql`

6. Find and replace your local IP address with your external address (and port number if your not going to use port 80) in the database. Make sure to use your IP addresses and not the ones shown below.
`perl -pi -e 's,http://10.0.1.1/,http://111.222.333.444/,g' myWordPressSite.sql`

7. Import database with the command below.
`mysql -u wordpress -p myWordPressSite < myWordPressSite.sql`

8. Check your WordPress site at http://111.222.333.444/.

9. Update some of your settings in your WordPress site. I don't know why but the setting under the Appearance tab (e.g. Menus, Theme, Background, etc.) don't get updated. So you will have to go to each of this and reselect the one you want to use.
