FROM identificator/android:latest

MAINTAINER DG

RUN locale-gen en_US.UTF-8
ENV LANG='en_US.UTF-8' LANGUAGE='en_US.UTF-8' LC_ALL='en_US.UTF-8'
RUN apt-get update \
    && apt-get install --no-install-recommends -y build-essential git ruby2.3-dev libcurl3 libcurl3-gnutls libcurl4-openssl-dev imagemagick mc vim\
    && gem install fastlane \
    && gem install bundler \
    && gem install curb \
    && gem install fastlane-plugin-badge \
    && mkdir tmp \
    && cd /opt \
    && mkdir app
COPY gradle-wrapper.properties /opt/android/tools/templates/gradle/wrapper/gradle/wrapper/
RUN /opt/android/tools/templates/gradle/wrapper/gradlew \    
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && apt-get autoremove -y && apt-get clean
