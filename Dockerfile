FROM registry.gitlab.com/pages/hugo:latest
MAINTAINER tacid@tacid.kiev.ua

ARG ASCIIDOCTOR_VERSION="1.5.6.1"
ENV asciidoctor_version=${ASCIIDOCTOR_VERSION}

RUN apk add --no-cache \
    bash \
    curl \
    ca-certificates \
    findutils \
    graphviz \
    make \
    openjdk8-jre \
    py2-pillow \
    py-setuptools \
    python2 \
    ruby \
    ruby-mathematical \
    ruby-pygments \
    ttf-liberation \
    unzip \
    which \
  && apk add --no-cache \
    --repository https://nl.alpinelinux.org/alpine/edge/community \
    font-bakoma-ttf \
  && apk add --no-cache --virtual .makedepends \
    build-base \
    libxml2-dev \
    python2-dev \
    py2-pip \
    ruby-dev \
  && gem install --no-document asciidoctor --version "${asciidoctor_version}" \
  && gem install --no-document asciidoctor-epub3 --version 1.5.0.alpha.7 \
  && gem install --no-document asciidoctor-pdf --version 1.5.0.alpha.16 \
  && gem install --no-document epubcheck --version 3.0.1 \
  && gem install --no-document kindlegen --version 3.0.3 \
  && gem install --no-document asciidoctor-revealjs --version 1.1.1 \
  && gem install --no-document asciidoctor-diagram \
  && gem install --no-document asciidoctor-confluence \
  && gem install --no-document asciidoctor-mathematical \
  && gem install --no-document rake rouge coderay thread_safe slim haml tilt \
  && pip install --no-cache-dir --upgrade pip \
  && pip install --no-cache-dir seqdiag actdiag nwdiag blockdiagcontrib-cisco 'blockdiag[pdf]' \
  && apk del -r --no-cache .makedepends
