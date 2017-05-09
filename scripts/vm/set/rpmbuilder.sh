#!/bin/bash

yum install fedora-review mock fedora-packager -y

cd /home/vagrant
mkdir rpmbuild
cd rpmbuild
mkdir BUILD BUILDROOT RPM RPMS SOURCES SPECS SRPM SRPMS
cd SPECS

cat >builder.sh<<EOF
#!/bin/sh -e

for i in ls *.spec; loop
 spectool -g -C ../SOURCES $i
 rpmbuild \
    -ba -bs \
    --define="_sourcedir ${PWD}/../SOURCES" \
    --define="_srcrpmdir ${PWD}/../SRPM" \
    --define="_rpmdir ${PWD}/../RPM" \
    $i
EOF
