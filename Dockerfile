FROM openjdk:11-jre

VOLUME ["/hygieia/logs"]

RUN mkdir /hygieia/config

EXPOSE 8081

ENV PROP_FILE /hygieia/config/application.properties

WORKDIR /hygieia

COPY target/*.jar /hygieia/
COPY docker/properties-builder.sh /hygieia/

CMD ./properties-builder.sh &&\
  java -Djava.security.egd=file:/dev/./urandom -jar *.jar --spring.config.location=$PROP_FILE