# FROM registry.access.redhat.com/ubi8/openjdk-11-runtime:1.10
#
# ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en'
# ENV JAVA_OPTIONS="-Dquarkus.http.host=0.0.0.0 -Djava.util.logging.manager=org.jboss.logmanager.LogManager"
#
# ARG JAR_FILE=target/*.jar
# COPY --chown=185 ${JAR_FILE} app.jar
#
# EXPOSE 8080
# USER 185
#
# ENTRYPOINT ["java","-jar","/app.jar"]
#

FROM registry.access.redhat.com/ubi8/openjdk-11-runtime:1.10

ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en'

COPY target/*.jar /deployments/app.jar
# COPY target/lib/* /deployments/lib/
# COPY target/*-runner.jar /deployments/quarkus-run.jar

EXPOSE 8080
USER 185

ENTRYPOINT [ "java", "-jar", "/deployments/app.jar" ]