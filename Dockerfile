#
FROM kalilinux/kali-rolling:latest
LABEL jsg <hajorge2012@gmail.com>

# Update
RUN apt-get -y update && apt-get -y dist-upgrade && apt-get -y autoremove && apt-get clean

# Working Directory
WORKDIR /root
RUN mkdir ${HOME}/tools && \
  mkdir -p /usr/share/wordlists

RUN apt install seclists -y

# Install Essentials
RUN apt-get install -y \
  build-essential \
  iputils-ping\
  git \
  neovim \
  wget \
  curl \
  make \
  python3 \
  python3-pip \
  perl \
  net-tools \
  zsh \
  tmux \
  metasploit-framework \
  sudo \
  enum4linux \
  gobuster \
  smbclient \
  smbmap \
  snmp \ 
  sslscan \
  openvpn 

#config nvim 

## Basic Tools installation
RUN apt-get install -y \
  rlwrap\
  ftp\
  openvpn \
  traceroute \
  whois \
  host \
  htop \
  dnsutils \
  figlet \
  tcpdump \
  telnet \
  unzip \
  p7zip-full \
  locate \
  tree \
  nmap \
  nikto \
  netcat \
  cewl \
  openssh-server \
  gcc \
  powerline


## zsh
RUN git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh && \
  cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc && \
  chsh -s /bin/zsh && \
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.zsh-syntax-highlighting" --depth 1 && \
  echo "source $HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> "$HOME/.zshrc"

WORKDIR ${HOME}/tools
CMD /bin/zsh
