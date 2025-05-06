FROM docker.io/bitnami/moodle:5.0

RUN install_packages gnuplot maxima maxima-share php-yaml git
COPY init.d/install-stack.sh /docker-entrypoint-init.d/