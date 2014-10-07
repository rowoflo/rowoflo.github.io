---
layout: tutorial
title: Display Your Daily Google Agenda On Your Desktop
modified: 2011-07-19
tags: [Bash, Google]
image:
  src: https://farm6.staticflickr.com/5597/15441753646_9ab2edec9b_o.jpg
comments: true
share: true
---

Ever wanted to quickly see what you have planned for the day without having to pull up your browser, your calendar client, or your smart phone. Wouldn't be nice if your events were listed automatically right on your desktop. Well you have come to the right place because here is where I will show you how to automatically display your agenda for the day on your desktop. In doing this you will get introduced to [GeekTool](http://projects.tynsoe.org/en/geektool/), [CronniX](http://code.google.com/p/cronnix/), and [GoogleCL](http://code.google.com/p/googlecl/).

<!-- more -->

The way this is going to work is that [CronniX](http://code.google.com/p/cronnix/) will be used to schedule [cron](http://en.wikipedia.org/wiki/Cron) to run a bash script that uses [GoogleCL](http://code.google.com/p/googlecl/) commands to download your calendar events for today and tomorrow. Then [GeekTool](http://projects.tynsoe.org/en/geektool/) is used to display that text on your desktop.

* Download and install all the necessary tools.

    * Dowland GeekTool from [here](http://projects.tynsoe.org/en/geektool/download.php). Double click to install this preference pane tool. (I suggest to keep the uninstall apps of all the applications you install in one location. I created the folder "/Applications/Uninstall Apps" for this task.)


    * Download CronniX from [here](http://www.macupdate.com/app/mac/7486/cronnix). Install by unzipping and dragging the app to your Applications folder.


    * Download GoogleCL from [here](http://code.google.com/p/googlecl/downloads/list). Also you will need to download gdata-python--client from [here](http://code.google.com/p/gdata-python-client/downloads/list). For both, choose the latest zip file to download then unzip them in your downloads folder. To install, open up the terminal (/Applications/Utilities/Terminal.app) and type in the following commands.

  `cd ~/Downloads/gdata-2.0.13`

  `sudo python setup.py install`

  `cd ~/Downloads/googlecl-0.9.11`

  `sudo python setup.py install`


    * Make sure to use the version numbers of the files you downloaded, which may be different than what is shown in the commands above.

* Authenticate GoogleCL for Google calendar by running the following command in the terminal.

`google calendar today`

Enter your Google username. This will open a webpage to authenticate this application. Hit the "Grant Access" button and then in the next page copy the key to your terminal prompt and hit `enter`. This has to be done for each Google service but only once on the first time you use it. Check out GoogleCL [example scripts](http://code.google.com/p/googlecl/wiki/ExampleScripts#list-groups) and the GoogleCL [manual](http://code.google.com/p/googlecl/wiki/Manual).

* Create a Bash script to fetch your Google calendar information for today and tomorrow using the GoogleCL commands. Type the following commands into the terminal.


  `cd ~/Desktop`

  `mkdir GoogleCalOnDesktop`

  `cd GoogleCalOnDesktop`

  `touch getGoogleCalendarInfo.sh`

  `chmod 744 getGoogleCalendarInfo.sh`

  `emacs getGoogleCalendarInfo.sh`


Copy the following commands into the emacs editor.

  `outputFolder=~/Desktop/GoogleCalOnDesktop`

  `outputFileName=geekToolGoogleCalendar.txt`

  `outputFile=$outputFolder/$outputFileName`

  `tmpFileName=tmpGeekToolGoogleCalendar.txt`

  `tmpFile=$outputFolder/$tmpFileName`

  `today=$(date +%Y-%m-%d)`

  `tomorrow=$(date -v +1d +%Y-%m-%d)`

  `echo "Today $today" > $tmpFile`

  `google calendar --cal _"Your Calendar Name Here"_ --date $today list >> $tmpFile`

  `sed -e '/^ *$/d;/_"Your Calendar Name Here"_/d' $tmpFile > $outputFile`

  `echo -e "\n" >> $outputFile`

  `echo "Tomorrow $tomorrow" > $tmpFile`

  `google calendar --cal _"Your Calendar Name Here"_ --date $tomorrow list >> $tmpFile`

  `sed -e '/^ *$/d;/_"Your Calendar Name Here"_/d' $tmpFile >> $outputFile`

  `rm $tmpFile`

To exit and save in emacs press `ctrl-x` then `ctrl-c` and then `y` and finally `enter`. The sed commands above are used to remove the name of the calendar and a couple of blank lines. Also note that the folder doesn't have to be on your desktop but can be placed anywhere you like.

4. Next have [cron](http://en.wikipedia.org/wiki/Cron) run the shell script above every 5 minutes. Use the CronniX to configure your cron table file. To do this open up CronniX (/Applications/CronniX) and click the "New" button on the toolbar. Under "Min" write `*/5` and under "Command" write the command below.

  `~/Desktop/GoogleCalOnDesktop/getGoogleCalendarInfo.sh > /dev/null 2>&1`

The last part of the command gets rid of any outputs produced by errors. Save this task and exit CronniX.

* If you don't want to use CronniX you can edit your cron table manually with the command below.

  `crontab -e`

5. Open up the GeekTool preference pane in the System Preferences and drag the "Shell" icon to the desktop. Set this "Geeklet" to refresh every 300 seconds and enter the command below in the "Command:" text field.

  `cat ~/Desktop/GoogleCalOnDesktop/geekToolGoogleCalendar.txt`

Maybe give it a name and edit the font to your desire. Close GeekTool and you should be all set.
