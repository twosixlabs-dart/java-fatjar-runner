FROM openjdk:8u322-slim-bullseye

ENV GLOBAL_JAVA_OPTS "-server -Dfile.encoding=UTF-8"
ENV DEFAULT_JAVA_OPTS "-Xmx1024m -Xms1024m -XX:+UseConcMarkSweepGC"
ENV APP_DIR '/opt/app'

RUN mkdir -p $APP_DIR/data && \
    mkdir -p $APP_DIR/tmp && \
    mkdir -p $APP_DIR/bin && \
    mkdir -p $APP_DIR/pkg

COPY ./scripts/run-jar.sh /opt/app/
RUN chmod +x /opt/app/run-jar.sh

RUN chmod -R 755 /opt/app

ENTRYPOINT ["/bin/bash"]
