VERSION=0.10.2
NAME=pam_ssh_agent_auth-$(VERSION)
TAR=$(NAME).tar.bz2
BUILDDIR=./build
SRCDIR=./src
SRCDEST=$(SRCDIR)/$(TAR)
UPSTREAM=http://downloads.sourceforge.net/project/pamsshagentauth/pam_ssh_agent_auth/v$(VERSION)/$(TAR)

prepare:
	mkdir -p $(SRCDIR)/installdir
	wget -qO $(SRCDEST) $(UPSTREAM)
	tar xvf $(SRCDEST) -C $(SRCDIR)
	# Compile
	cd $(SRCDIR)/$(NAME) && \
	    ./configure --libexecdir=/lib/security --with-mantype=man && \
	    make && \
	    make install DESTDIR=../installdir

debian: prepare
	fpm -s dir -t deb \
	    -n pam_ssh_agent_auth \
	    -v $(VERSION) \
	    -C $(SRCDIR)/installdir \
	    -p $(BUILDDIR)/pam_ssh_agent_auth_VERSION_ARCH.deb \
	    lib/security usr/local/share/man

clean:
	rm -rf $(SRCDIR)/*

all: prepare debian clean
