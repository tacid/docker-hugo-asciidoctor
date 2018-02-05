FROM asciidoctor/docker-asciidoctor
MAINTAINER tacid@tacid.kiev.ua

# Download and install hugo
ENV HUGO_VERSION 0.35
ENV HUGO_BINARY hugo_${HUGO_VERSION}_Linux-64bit.tar.gz

RUN curl -fsSL https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY} -o /tmp/hugo.tar.gz \
 	&& tar -xvzf /tmp/hugo.tar.gz -C /tmp/ \
	&& mv /tmp/hugo /usr/bin/hugo \
	&& rm -rf /tmp/hugo*

# Create working directory
RUN mkdir /srv/site

# Expose default hugo port
EXPOSE 1313

# Automatically build site
ENV HUGO_BASE_URL http://localhost:1313/
CMD hugo server -b ${HUGO_BASE_URL} --bind=0.0.0.0 -ws .

WORKDIR /srv/site
VOLUME /srv/site

CMD ["/bin/bash"]
