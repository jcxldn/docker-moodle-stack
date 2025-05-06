FROM docker.io/bitnami/moodle:5.0

RUN install_packages gnuplot maxima maxima-share gcc php-yaml git
COPY init.d/install-stack.sh /docker-entrypoint-init.d/