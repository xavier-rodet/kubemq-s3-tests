FROM kubemq/kubemq:v2.2.1

ARG SPACE_NAME
ENV SPACE_NAME=$SPACE_NAME
ARG SPACE_URL
ENV SPACE_URL=$SPACE_URL
ARG SPACE_KEY
ENV SPACE_KEY=$SPACE_KEY
ARG SPACE_TOKEN
ENV SPACE_TOKEN=$SPACE_TOKEN

USER root

WORKDIR /tmp

# https://www.digitalocean.com/community/questions/how-to-manage-digitalocean-spaces-using-s3cmd
# https://fedora.pkgs.org/32/fedora-updates-x86_64/s3cmd-2.1.0-1.fc32.noarch.rpm.html

RUN curl -O https://download-ib01.fedoraproject.org/pub/fedora/linux/updates/32/Everything/x86_64/Packages/f/file-libs-5.38-4.fc32.x86_64.rpm
RUN curl -O https://download-ib01.fedoraproject.org/pub/fedora/linux/releases/32/Everything/x86_64/os/Packages/p/python3-six-1.14.0-2.fc32.noarch.rpm
RUN curl -O https://download-ib01.fedoraproject.org/pub/fedora/linux/updates/32/Everything/x86_64/Packages/f/file-5.38-4.fc32.x86_64.rpm
RUN curl -O https://download-ib01.fedoraproject.org/pub/fedora/linux/updates/32/Everything/x86_64/Packages/p/python3-magic-5.38-4.fc32.noarch.rpm
RUN curl -O https://download-ib01.fedoraproject.org/pub/fedora/linux/releases/32/Everything/x86_64/os/Packages/p/python3-dateutil-2.8.0-8.fc32.noarch.rpm
RUN curl -O https://download-ib01.fedoraproject.org/pub/fedora/linux/releases/32/Everything/x86_64/os/Packages/p/python-setuptools-wheel-41.6.0-2.fc32.noarch.rpm
RUN curl -O https://download-ib01.fedoraproject.org/pub/fedora/linux/updates/32/Everything/x86_64/Packages/p/python-pip-wheel-19.3.1-4.fc32.noarch.rpm
RUN curl -O https://download-ib01.fedoraproject.org/pub/fedora/linux/releases/32/Everything/x86_64/os/Packages/r/readline-8.0-4.fc32.x86_64.rpm
RUN curl -O https://download-ib01.fedoraproject.org/pub/fedora/linux/updates/32/Everything/x86_64/Packages/l/libtirpc-1.2.6-1.rc4.fc32.x86_64.rpm
RUN curl -O https://download-ib01.fedoraproject.org/pub/fedora/linux/releases/32/Everything/x86_64/os/Packages/l/libnsl2-1.2.0-6.20180605git4a062cf.fc32.x86_64.rpm
RUN curl -O https://download-ib01.fedoraproject.org/pub/fedora/linux/updates/32/Everything/x86_64/Packages/g/glibc-langpack-en-2.31-6.fc32.x86_64.rpm
RUN curl -O https://download-ib01.fedoraproject.org/pub/fedora/linux/updates/32/Everything/x86_64/Packages/g/glibc-common-2.31-6.fc32.x86_64.rpm
RUN curl -O https://download-ib01.fedoraproject.org/pub/fedora/linux/updates/32/Everything/x86_64/Packages/g/glibc-2.31-6.fc32.x86_64.rpm
RUN curl -O https://download-ib01.fedoraproject.org/pub/fedora/linux/releases/32/Everything/x86_64/os/Packages/g/gdbm-libs-1.18.1-3.fc32.x86_64.rpm
RUN curl -O https://download-ib01.fedoraproject.org/pub/fedora/linux/updates/32/Everything/x86_64/Packages/l/libxcrypt-4.4.18-1.fc32.x86_64.rpm
RUN curl -O https://download-ib01.fedoraproject.org/pub/fedora/linux/updates/32/Everything/x86_64/Packages/p/python3-libs-3.8.7-2.fc32.x86_64.rpm

RUN curl -O https://download-ib01.fedoraproject.org/pub/fedora/linux/updates/32/Everything/x86_64/Packages/p/python3-3.8.7-2.fc32.x86_64.rpm
RUN curl -O https://download-ib01.fedoraproject.org/pub/fedora/linux/updates/32/Everything/x86_64/Packages/s/s3cmd-2.1.0-1.fc32.noarch.rpm


# RUN rpm -e --allmatches glibc
# RUN rpm -qa 'glibc*'
# glibc-common-2.28-127.el8.x86_64
# glibc-minimal-langpack-2.28-127.el8.x86_64
# glibc-2.28-127.el8.x86_64
# RUN rpm -e glibc-2.28-127.el8.x86_64
RUN rpm -ivh --force glibc-langpack-en-2.31-6.fc32.x86_64.rpm  glibc-common-2.31-6.fc32.x86_64.rpm glibc-2.31-6.fc32.x86_64.rpm 
RUN rpm -ivh --force python-pip-wheel-19.3.1-4.fc32.noarch.rpm python-setuptools-wheel-41.6.0-2.fc32.noarch.rpm readline-8.0-4.fc32.x86_64.rpm libtirpc-1.2.6-1.rc4.fc32.x86_64.rpm libnsl2-1.2.0-6.20180605git4a062cf.fc32.x86_64.rpm gdbm-libs-1.18.1-3.fc32.x86_64.rpm libxcrypt-4.4.18-1.fc32.x86_64.rpm python3-libs-3.8.7-2.fc32.x86_64.rpm 
RUN rpm -ivh python3-3.8.7-2.fc32.x86_64.rpm
RUN rpm -ivh --force python3-six-1.14.0-2.fc32.noarch.rpm file-libs-5.38-4.fc32.x86_64.rpm file-5.38-4.fc32.x86_64.rpm python3-magic-5.38-4.fc32.noarch.rpm python3-dateutil-2.8.0-8.fc32.noarch.rpm
RUN rpm -ivh s3cmd-2.1.0-1.fc32.noarch.rpm



RUN rm -R *

# RUN curl -O https://download-ib01.fedoraproject.org/pub/fedora/linux/releases/32/Everything/x86_64/os/Packages/u/unzip-6.0-47.fc32.x86_64.rpm
# RUN rpm -ivh unzip-6.0-47.fc32.x86_64.rpm
# RUN curl -LJO https://github.com/s3tools/s3cmd/releases/download/v2.1.0/s3cmd-2.1.0.zip
# RUN unzip s3cmd-2.1.0.zip -d s3cmd-2.1.0

WORKDIR /kubemq

# RUN echo "KBWWKD664K6MVDNG74B5 1ZceJy1AmoHt5yOrKPphNQT/t6oWnGgDC+TnMhd3Oh0 fra1 digitaloceanspaces.com [%(bucket)s.fra1.digitaloceanspaces.com] '' '/usr/bin/gpg' 'Yes' '' n y" | s3cmd --configure
RUN s3cmd --configure <<< $'KBWWKD664K6MVDNG74B5\n1ZceJy1AmoHt5yOrKPphNQT/t6oWnGgDC+TnMhd3Oh0\n\nfra1.digitaloceanspaces.com\n%(bucket)s.fra1.digitaloceanspaces.com\n\n\nYes\n\nY\nY'

# RUN s3cmd sync -r --delete-removed store s3://kubemq-test-space
# RUN s3cmd sync -r --delete-removed s3://kubemq-test-space store