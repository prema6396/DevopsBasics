FROM tomcat:latest
COPY ./home/linuxusr/myagent/_work/1/s/webapp/target/webapp.war /usr/local/tomcat/webapps
RUN cp -r /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps
