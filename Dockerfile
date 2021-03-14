FROM sabotagecla6/vscode_base

# ***********************************************
# install jre, graphviz
# ***********************************************
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        default-jre graphviz

# ***********************************************
# prepare add user
# ***********************************************
RUN chmod u+s /usr/sbin/useradd \
    && chmod u+s /usr/sbin/groupadd \
    && chmod u+s /usr/sbin/chpasswd
RUN echo "ALL ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/ALL
RUN echo . > /tmp/uninitilze

# ***********************************************
# copy entrypoint shell
# ***********************************************
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]
