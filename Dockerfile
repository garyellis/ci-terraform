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
    unzip \
    which && \
    yum clean all

ENV RUBY_VERSION=2.4.3
#ENV RBENV_REPO=https://github.com/rbenv/rbenv.git
#ENV RBENV_RUBY_BUILD_REPO=https://github.com/rbenv/ruby-build.git
RUN git clone https://github.com/rbenv/rbenv.git ~/.rbenv && \
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile && \
    echo 'eval "$(rbenv init -)"' >> ~/.bash_profile && \
    . ~/.bash_profile && \
    mkdir -p "$(rbenv root)"/plugins && \
    git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build && \
    rbenv install $RUBY_VERSION && \
    rbenv global $RUBY_VERSION && \
    gem install bundler && gem env home


ENV TF_VERSIONS="0.8.7 0.11.3 0.11.6"
#ENV TFENV_REPO=https://github.com/kamatama41/tfenv.git
RUN git clone https://github.com/kamatama41/tfenv.git ~/.tfenv && \
    echo 'export PATH="$HOME/.tfenv/bin:$PATH"' >> ~/.bash_profile && \
    ln -s ~/.tfenv/bin/* /usr/local/bin && \
    for i in $TF_VERSIONS ; do tfenv install $i; done

ENV IUS_REPO=https://centos7.iuscommunity.org/ius-release.rpm
RUN yum -y install $IUS_REPO && \
    yum -y install \
    python36u \
    python36u-pip \
    python36u-devel && \
    python3.6 -m venv /venv && \
    echo '. /venv/bin/activate' >> ~/.bash_profile

CMD ["/bin/bash", "-c", "source ~/.bash_profile && /bin/bash"]
