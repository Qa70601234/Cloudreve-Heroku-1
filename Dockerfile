FROM redis:alpine

RUN wget -qO /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
    && wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-2.32-r0.apk \
    && apk add --no-cache glibc-2.32-r0.apk \
    && rm -rf glibc-2.32-r0.apk

ADD run.sh /root/cloudreve/run.sh
#ADD cloudreve.db /root/cloudreve/cloudreve.db
#ADD conf.ini /root/cloudreve/conf.ini
RUN wget -qO cloudreve.tar.gz https://github.com/FuaerCN/Cloudreve-Heroku/releases/download/Cloudreve/cloudreve_linux_amd64.tar.gz \
	&& tar -zxvf cloudreve.tar.gz -C /root/cloudreve \
	&& chmod +x /root/cloudreve/cloudreve /root/cloudreve/run.sh

CMD /root/cloudreve/run.sh
