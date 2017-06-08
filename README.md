# docker-geofence

### Description
Docker image for official [geoserver/geofence](https://github.com/geoserver/geofence) repo.

### Dependencies
- [Docker](https://www.docker.com/)
- [Optional] [Docker Compose](https://docs.docker.com/compose/)

### Preconditions
This container was designed specifically designed to work with a PostgreSQL database, so the included OVR file needs to be amended and 
mounted as a volume with the amended database configuration as specified in the [geoserver/geofence](https://github.com/geoserver/geofence) repo: [Database Configuration](https://github.com/geoserver/geofence/wiki/GeoFence-configuration#database-configuration). 

Should the default H2 database be preferred, please remove lines #12 & #13 from the Dockerfile.

### Build
1. Clone repo `$ git clone https://github.com/tb4mmaggots/docker-geofence.git`
2. Go to cloned directory `$ cd docker-geofence`
3. Build container

   `$ docker build -t geofence:3.3.0` 
   
   or 
   
   `$ docker-compose build`

### Run
`$ docker run -d --name geofence -p 8080:8080 -v $(pwd)/geofence-datasource-ovr.properties:/usr/local/tomcat/webapps/geofence/WEB-INF/classes/geofence-datasource-ovr.properties geofence:3.3.0` 

or 

`docker-compose up -d`
