FROM linuxbrew/brew

RUN brew install zip python@3.8; \
echo 'export PATH="/home/linuxbrew/.linuxbrew/opt/python@3.8/bin:$PATH"' >> ~/.bashrc; \
brew tap aws/tap; \
brew install awscli aws-sam-cli


# CMD ["/bin/bash"]

RUN	useradd -m -s /bin/bash ec2-user \
	&& echo 'ec2-user ALL=(ALL) NOPASSWD:ALL' >>/etc/sudoers \
	&& echo 'export PATH="/home/linuxbrew/.linuxbrew/opt/python@3.8/bin:$PATH"' >> /home/ec2-user/.bash_profile

USER samcli

WORKDIR /home/samcli
