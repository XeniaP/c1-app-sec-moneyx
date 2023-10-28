FROM frekele/gradle:2.14.1-jdk8u141
        
RUN printf "deb http://archive.debian.org/debian/ jessie main\ndeb http://security.debian.org jessie/updates main" > /etc/apt/sources.list
   
RUN apt-get update && apt-get install -y --force-yes --no-install-recommends git && rm -rf /var/lib/apt/lists/*

RUN mkdir /app
WORKDIR /app

RUN git clone --depth=1 https://github.com/nVisium/MoneyX.git .

RUN gradle bootRepackage

EXPOSE 8080
CMD java -jar build/libs/moneyx.jar
