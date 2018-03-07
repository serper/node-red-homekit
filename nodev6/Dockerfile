FROM nodered/node-red-docker:v6
MAINTAINER Sergio Pérez <sergio@pereznus.es>

##################################################
# Install packages                               #
##################################################

USER root
RUN apt-get update
RUN apt-get install -y curl wget libavahi-compat-libdnssd-dev

##################################################
# Start                                          #
##################################################

RUN mkdir -p /var/run/dbus

COPY run.sh /root/run.sh
COPY avahi-daemon.conf /etc/avahi/avahi-daemon.conf

EXPOSE 5353 51826
CMD ["/root/run.sh"]
