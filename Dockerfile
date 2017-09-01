FROM openjdk:8-jre-alpine

MAINTAINER Yan QiDong <yanqd0@outlook.com>

ENV JAVA_MAX_MEM=1200m \
    JAVA_MIN_MEM=1200m \
    EXTRA_JAVA_OPTS="" \
    NEXUS_VERSION=3.5.1-02 \
    NEXUS_HOME=/opt/sonatype/nexus \
    NEXUS_DATA=/srv/nexus \
    NEXUS_USER=nexus \
    NEXUS_CONTEXT=''

RUN mkdir -p ${NEXUS_HOME} ${NEXUS_DATA}/etc ${NEXUS_DATA}/log ${NEXUS_DATA}/tmp \
    && apk --no-cache add curl \
    && curl --fail --silent --location --retry 3 \
        https://download.sonatype.com/nexus/3/nexus-${NEXUS_VERSION}-unix.tar.gz \
        | tar -xz -C ${NEXUS_HOME} --strip-components=1 nexus-${NEXUS_VERSION} \
    && apk del curl \
    && sed \
        -e "s|karaf.home=.|karaf.home=${NEXUS_HOME}|g" \
        -e "s|karaf.base=.|karaf.base=${NEXUS_HOME}|g" \
        -e "s|karaf.etc=etc|karaf.etc=${NEXUS_HOME}/etc|g" \
        -e "s|java.util.logging.config.file=etc|java.util.logging.config.file=${NEXUS_HOME}/etc|g" \
        -e "s|karaf.data=.*|karaf.data=${NEXUS_DATA}|g" \
        -e "s|java.io.tmpdir=.*|java.io.tmpdir=${NEXUS_DATA}/tmp|g" \
        -e "s|LogFile=.*|LogFile=${NEXUS_DATA}/log/jvm.log|g" \
        -e "s|karaf.startLocalConsole=.*|karaf.startLocalConsole=true|g" \
        -i ${NEXUS_HOME}/bin/nexus.vmoptions \
    && sed \
        -e "s|nexus-context-path=/|nexus-context-path=/\${NEXUS_CONTEXT}|g" \
        -i ${NEXUS_HOME}/etc/nexus-default.properties \
    && chown -R root:root ${NEXUS_HOME} \
    && addgroup -S ${NEXUS_USER} \
    && adduser -DHS -u 200 -G ${NEXUS_USER} -h ${NEXUS_DATA} ${NEXUS_USER} \
    && chown -R ${NEXUS_USER}:${NEXUS_USER} ${NEXUS_DATA} \
    && rm -rf /tmp/*

USER ${NEXUS_USER}

WORKDIR ${NEXUS_HOME}

EXPOSE 8081

VOLUME ${NEXUS_DATA}

CMD ["./bin/nexus", "run"]