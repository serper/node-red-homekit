FROM nodered/node-red:latest-12 
MAINTAINER Sergio Pérez <sergio@pereznus.es>

##################################################
# Install packages                               #
##################################################

USER root
RUN apk update
RUN apk --no-cache add dbus nodejs avahi avahi-compat-libdns_sd avahi-dev curl wget

##################################################
# Start                                          #
##################################################

RUN mkdir -p /var/run/dbus

ADD run.sh /root/run.sh
COPY avahi-daemon.conf /etc/avahi/avahi-daemon.conf

EXPOSE 5353 51826
CMD ["/root/run.sh"]
