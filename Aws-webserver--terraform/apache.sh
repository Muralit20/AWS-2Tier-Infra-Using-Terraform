#! /bin/sh
yum install -y httpd
service start httpd
chkonfig httpd on
echo "<html><h1>Hello Dude welcome to testing ^^</h2></html>" > /var/www/html/index.html
