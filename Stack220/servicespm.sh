#!/bin/bash
cp /etc/hosts ~/hosts.new ;
sed -i "/127.0.0.1/c\127.0.0.1 localhost localhost.localdomain `hostname`" ~/hosts.new ;
cp -f ~/hosts.new /etc/hosts ;

service sendmail start ;
service php-fpm start ;
service nginx start;

if [ -d /opt/processmaker/ ];
then
    echo "ProccessMaker installed";
else
    cd /tmp/ && wget https://artifacts.processmaker.net/official/processmaker-3.2.2+001.tar.gz;
    tar -C /opt -xzvf processmaker-3.2.2+001.tar.gz ;
    cd /opt/processmaker/ ;
    chmod -R 770 shared workflow/public_html gulliver/js thirdparty/html2ps_pdf/cache ;
    cd /opt/processmaker/workflow/engine/ ;
    chmod -R 770 config content/languages plugins xmlform js/labels ;
    chown -R nginx:nginx /opt/processmaker ;
    rm -rf /tmp/processmaker-3.2.2+001.tar.gz ;
fi

echo "
       ░░░░░░░
    ░░░░░░░░░░░░░
   ░░░░       ░░░░     WELCOME TO PROCESSMAKER 3.2.2 Enterprise
  ░░░░  ░░░░░   ░░░
  ░░░  ░░░░░░░  ░░░░   - This version of ProcessMaker use MySql 5.6
  ░░░  ░░░░░░   ░░░    - The following command run mysql56 in docker:
   ░░  ░░     ░░░░     -> docker run --name pm-db56 -e MYSQL_ROOT_PASSWORD=PM-Testdb -p 3306:3306 -d mysql:5.6
    ░  ░░░░░░░░░       
       ░░░░░░░         For more information see https://www.processmaker.com
                                                http://wiki.processmaker.com
	 " ; 
/bin/bash ;