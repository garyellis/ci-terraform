FROM centos:7.4.1708

RUN yum -y install \
    install \
    git-core \
    zlib \
    zlib-devel \
    gcc-c++ \
    patch \
    readline \
    readline-devel \
    libyaml-devel \
    libffi-devel \
    openssl-devel \
    make \
    bzip2 \
    autoconf \
    automake \
    libtool \
    bison \
    curl \
    sqlite-devel \
    unzip  && \
    yum clean all

ENV RUBY_VERSION=2.4.3
RUN git clone https://github.com/rbenv/rbenv.git ~/.rbenv && \
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile && \
    echo 'eval "$(rbenv init -)"' >> ~/.bash_profile && \
    . ~/.bash_profile && \
    mkdir -p "$(rbenv root)"/plugins && \
    git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build && \
    rbenv install $RUBY_VERSION && \
    rbenv global $RUBY_VERSION && \
    gem install bundler && gem env home

ENV TERRAFORM_VERSION=0.11.3
RUN curl -RO https://releases.hashicorp.com/terraform/$TERRAFORM_VERSION/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin && rm -f *.zip && \
    terraform version

ENTRYPOINT ["/bin/bash", "-c", "source ~/.bash_profile && /bin/bash"]
