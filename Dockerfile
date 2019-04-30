FROM ubuntu:18.04

# load all necessary packages
RUN apt update && \
apt install -y openssh-client && \
apt install -y openssh-server && \
apt install -y net-tools && \
apt install -y curl && \
apt install -y wget && \
apt install -y gnupg && \
apt install -y openjdk-8-jdk && \
apt install -y git

# install jenkins
RUN wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | apt-key add - && \
sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list' && \
apt update && apt install -y jenkins



#

RUN mkdir /var/lib/jenkins/.ssh && \
# echo "Host *\n\tStrictHostKeyChecking no\n" >> /var/lib/jenkins/.ssh/config && \
echo "Host *\n\tIdentityFile /var/lib/jenkins/.ssh/id_rsa" >> /var/lib/jenkins/.ssh/config

RUN mkdir -p /var/cache/jenkins/war && \
mkdir /var/log/jenkins || exit 0 && \
cd /var/cache/jenkins/war && \
jar -xvf /usr/lib/jenkins/jenkins.war && \
chmod a+w ./ 

RUN chown -R jenkins:jenkins /var/cache/jenkins && \
chown jenkins:jenkins /var/log/jenkins && \
chmod -R 775 /var/cache/jenkins && \
chmod -R 777 /var/log/jenkins && \
chown -R jenkins:jenkins /var/lib/jenkins && \
chown -R jenkins:jenkins /var/lib/jenkins/.ssh && \
chmod -R 0700 /var/lib/jenkins/.ssh && \
chmod -R 0600 /var/lib/jenkins/.ssh/*

#

RUN apt update && \
apt install sudo && \
echo '%jenkins ALL=(ALL) NOPASSWD: /usr/sbin/service *' > /etc/sudoers 


# add shell script that runs commands after entering container
ADD booting.sh /tmp/booting.sh
RUN chmod +x /tmp/booting.sh 

CMD ["/tmp/booting.sh"]

USER jenkins
# expose ports
EXPOSE 22
EXPOSE 8080
EXPOSE 50000
