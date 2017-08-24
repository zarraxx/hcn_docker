FROM zarra/tomcat_dev

#ADD hcn-web-0.1.war /usr/local/tomcat/webapps/hcn-web.war

ADD entrypoint.sh /usr/local/entrypoint.sh
RUN chmod +x /usr/local/entrypoint.sh
ENTRYPOINT ["/usr/local/entrypoint.sh"]

CMD ["catalina.sh", "run"]