FROM ubuntu:16.04

COPY ./multi-user.target.wants/private-tmp-test.service /etc/systemd/system/multi-user.target.wants/
COPY ./private-tmp-test.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/private-tmp-test.sh

CMD [ "/sbin/init" ]
