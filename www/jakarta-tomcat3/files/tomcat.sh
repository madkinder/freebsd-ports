#!/bin/sh

JAVA_HOME=%%PREFIX%%/jdk1.1.8
export JAVA_HOME
TOMCAT_HOME=%%PREFIX%%/tomcat
export TOMCAT_HOME

case "$1" in
	start)
		if [ -x %%PREFIX%%/tomcat/bin/tomcat.sh ]; then
			%%PREFIX%%/tomcat/bin/tomcat.sh start > /dev/null && echo ' tomcat'
		fi
		;;
	stop)
		if [ -x %%PREFIX%%/tomcat/bin/tomcat.sh ]; then
			%%PREFIX%%/tomcat/bin/tomcat.sh stop > /dev/null && echo ' tomcat'
		fi
		;;
	*)
		echo ""
		echo "Usage: `basename $0` { start | stop }"
		echo ""
		exit 64
		;;
esac
