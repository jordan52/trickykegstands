##your app

pull the code from here <https://github.com/t0xa/gelfj>, build it, and copy the jar to your own repository. something like /repository/org/graylog2/gelfj/1.0.1/

Now, add the dependency to your pom:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
<dependency>
  <groupId>org.graylog2</groupId>
  <artifactId>gelfj</artifactId>
  <version>1.0.1</version>
</dependency>
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

your appender looks like this:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

log4j.appender.graylog2=org.graylog2.log.GelfAppender
log4j.appender.graylog2.graylogHost=192.168.1.14
log4j.appender.graylog2.originHost=macbook.juristat.com
log4j.appender.graylog2.facility=juristat-web
log4j.appender.graylog2.layout=org.apache.log4j.PatternLayout
log4j.appender.graylog2.extractStacktrace=true
log4j.appender.graylog2.addExtendedInformation=true
log4j.appender.graylog2.additionalFields={'environment': 'DEV', 'application': 'juristat-web'}

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

##The Server

Install graylog2 per the docs. you want both the server and the web interface

start elastic search: service elasticsearch start

start the graylog2 server: service graylog2-server start 

(if either of those scripts are missing, i'll send them to you.)

name the following script graylog-2-web-interface and save it in init.d. start the web front end using service start graylog-2-web-interface

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#!/bin/bash
#
# graylog2-web-interface:   graylog2 web interface
#
# chkconfig: - 98 02
# description:  Starts graylog2-web-interface using passenger-standalone. \
#       Uses RVM to use switch to a specific ruby version.
#
# config
USER=graylog
APP_DIR=/opt/graylog2/graylog2-web-interface/
RVM_RUBY=1.9.3
ADDR=127.0.0.1
PORT=3000
ENVIRONMENT=production
LOG_FILE=/var/log/graylog2-web-interface.log

case "$1" in
  start)
  start)
    echo "Starting graylog2-web-interface"
                cd $APP_DIR; ./script/rails server -e production &> /tmp/graylo$
    ;;
  stop)
    echo "CAN'T STOP, FIND THE PID AND KILL -9 or MAKE THE SERVICE SCRIPT BETTE$
    ;;
  status)
    echo "NO STATUS AVAILABLE, MAKE THE SERVICE SCRIPT BETTER."
   ;;
  *)
    echo "Usage: $0 start|stop|status" >&2
    exit 3
    ;;
esac  

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

