FROM tomcat:8.5-alpine

ARG GF_DOWNLOAD_URL=http://ares.boundlessgeo.com/geofence/master/geofence-master-latest-war.zip
ARG PG_SPATIAL_DOWNLOAD_URL=http://www.hibernatespatial.org/repository/org/hibernatespatial/hibernate-spatial-postgis/1.1.1/hibernate-spatial-postgis-1.1.1.jar

RUN apk update && apk upgrade && apk add --no-cache $(apk search -q ttf- | grep -v '\-doc')

RUN wget -c $GF_DOWNLOAD_URL -O /tmp/geofence.zip \
    && unzip /tmp/geofence.zip -d /tmp/ \
    && mkdir /usr/local/tomcat/webapps/geofence \
    && unzip /tmp/gui/web/target/geofence.war -d /usr/local/tomcat/webapps/geofence \
    && wget -c $PG_SPATIAL_DOWNLOAD_URL -O /usr/local/tomcat/webapps/geofence/WEB-INF/lib/hibernate-spatial-postgis-1.1.1.jar \
    && rm -rf /tmp/*
