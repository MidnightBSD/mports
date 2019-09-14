# $MidnightBSD$

PORTNAME=	bash-completion
PORTVERSION=	2.8
PORTREVISION=	2
PORTEPOCH=	1
CATEGORIES=	shells

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Programmable completion library for Bash

LICENSE=	gpl2

BROKEN_armv6=	fails to build: gmake: install-recursive: Error 1
BROKEN_armv7=	fails to build: gmake: install-recursive: Error 1

TEST_DEPENDS=	runtest:misc/dejagnu \
		${LOCALBASE}/lib/tcllib/cmdline/cmdline.tcl:devel/tcllib

PORTSCOUT=	limit:^[0-9\.]*$$

OPTIONS_DEFINE=	CMAKE_MODULES DOCS
OPTIONS_SINGLE=	BASH
OPTIONS_SINGLE_BASH=	BASH_SHARED BASH_STATIC
OPTIONS_DEFAULT=BASH_SHARED CMAKE_MODULES
OPTIONS_SUB=	yes
BASH_SHARED_DESC=	Use shells/bash as backend
BASH_STATIC_DESC=	Use shells/bash-static as backend
CMAKE_MODULES_DESC=	Install bash-completion modules for cmake
FREEBSD_DESC=		Install completion functions for FreeBSD programs

NO_ARCH=	yes
GNU_CONFIGURE=	yes
USES=		autoreconf gmake pathfix

SUB_FILES=	pkg-message
SUB_LIST=	RUNFILE=${DATADIR}/bash_completion.sh

GH_ACCOUNT=	scop
USE_GITHUB=	yes

BASH_SHARED_RUN_DEPENDS=bash:shells/bash
BASH_STATIC_RUN_DEPENDS=bash:shells/bash-static

post-patch:
	@${REINPLACE_CMD} \
		-e '/^profiledir =/ s|(sysconfdir)/profile.d|(prefix)/share/bash-completion|' \
		-e 's|\((datadir)/cmake\)|\1/Modules|' \
			${WRKSRC}/Makefile.am

post-configure:
	@${REINPLACE_CMD} \
		-e 's|/etc/ssl/openssl.cnf|${PREFIX}& &|g' \
		-e 's|/usr/lib\(/aspell\)|${PREFIX}/share\1|g' \
		-e 's|/usr/local|${PREFIX}|g' \
		-e 's|/usr/ports|${PORTSDIR}|g' \
		-e 's|/usr\(/sbin/postconf\)|${PREFIX}\1|g' \
		-e 's|/usr/share/info|&:${PREFIX}/info|g' \
		-e 's|/var\(/lib/rpm/macros\)|${PREFIX}\1|g' \
			${WRKSRC}/completions/*

post-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}/
	cd ${WRKSRC}/ && ${INSTALL_DATA} CHANGES README.md doc/bash_completion.txt doc/bashrc doc/inputrc ${FAKE_DESTDIR}${DOCSDIR}/

do-test:
.for test in runCompletion runInstall runUnit
	-cd ${WRKSRC}/test && bash ${test}
.endfor

.include <bsd.port.mk>
