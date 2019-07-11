FROM ubuntu:16.04

COPY ./multi-user.target.wants/custom-batch.timer /etc/systemd/system/multi-user.target.wants/
COPY ./multi-user.target.wants/custom-batch.service /etc/systemd/system/multi-user.target.wants/
COPY ./echo-foo-bar-baz.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/echo-foo-bar-baz.sh

CMD [ "/sbin/init" ]
