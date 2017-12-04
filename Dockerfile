FROM ruby:2.3
LABEL maintainer="Damien Caro <dcaro@microsoft.com>"

COPY Gemfile /tf-test/
COPY Rakefile /tf-test/
COPY build/ /tf-test/build/
WORKDIR /tf-test
RUN apt-get update && apt-get install unzip \
    && curl -o /tf-test/terraform.zip https://releases.hashicorp.com/terraform/0.10.8/terraform_0.10.8_linux_amd64.zip \
    && unzip /tf-test/terraform.zip -d /usr/local/bin
#COPY docker-entrypoint.sh /tf-test/
#RUN ["bundle", "install"]

#ENTRYPOINT [ "/tf-test/docker-entrypoint.sh" ]
#CMD ["--help"]
CMD [ "rake" ]