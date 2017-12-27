FROM nodered/node-red-docker
MAINTAINER Sergio Pérez <sergio@pereznus.es>

##################################################
# Install packages                               #
##################################################

RUN sudo apt-get update
RUN sudo apt-get install -y curl wget libavahi-compat-libdnssd-dev

##################################################
# Start                                          #
##################################################

USER root
RUN mkdir -p /var/run/dbus

ADD run.sh /root/run.sh
COPY avahi-daemon.conf /etc/avahi/avahi-daemon.conf

EXPOSE 5353 51826
CMD ["/root/run.sh"]
