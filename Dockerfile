FROM beevelop/android:latest

LABEL maintainer="DG"

RUN locale-gen en_US.UTF-8
ENV LANG='en_US.UTF-8' LANGUAGE='en_US.UTF-8' LC_ALL='en_US.UTF-8'

RUN apt-get update && apt-get install --no-install-recommends -y build-essential git ruby2.3-dev \
    && gem install fastlane \
    && gem install bundler \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && apt-get autoremove -y && apt-get clean
