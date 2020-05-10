
RUBY FACEBOOK AUTO-REPORTER

Created By  : PACE USA

Facebook    : https://free.facebook.com/cicicyber.squadindo.7

Github      : https://github.com/ProjectorBUg

Proof Of Concept Abstractable Auto report profile facebook

Require Library :
- Nokogiri
- Mechanize
- Colorize
- highline

Installation :

 $ sudo apt install libssl-dev zlib1g-dev
 
 $ sudo gem install nokogiri mechanize colorize highline 
 
 $ git clone https://github.com/ProjectorBUg/report-fb.git
 
 $ cd report-fb
 
 $ ruby report-fb.rb --help

USAGE: ruby report-fb.rb [options]

                         -l, -L, --LOGIN,  --login         LOGIN INTO FACEBOOK
                         -p, -P, --PERSON, --person        REPORT ACCOUNT
                         -h, -H, --HELP,   --help          SHOW HELP/USAGE MESSAGE


 USAGE: ruby report-fb.rb -l -L --login --LOGIN                  

 Example 1 : ruby report-fb.rb --login│      

 USAGE: ruby report-fb.rb -p -P --person --PERSON 100040832567374

 Example 2 : ruby report-fb.rb --person "target_profile_id"
 
