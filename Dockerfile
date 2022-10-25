FROM fortifydocker/fortify-ci-tools:latest-jdk-11

ARG FCLI_HOME=/opt/Fortify/fcli

ENV PATH="${PATH}:$FCLI_HOME/bin"

RUN curl -fsSL https://github.com/fortify-ps/fcli/releases/download/dev_main/fcli-linux.tgz -o /tmp/fcli-linux.tgz \
  && mkdir -p $FCLI_HOME/bin \
  && tar -zxvf /tmp/fcli-linux.tgz -C $FCLI_HOME/bin \
  && rm /tmp/fcli-linux.tgz 

# adoptopenjdk:11-jdk sets CMD to jshell; we override it back to use bash for compatibility with our 8-jdk image
CMD ["bash"]
