# Created by: kirk@strauser.com

PORTNAME=	bash-completion
PORTVERSION=	2.11
PORTEPOCH=	2
CATEGORIES=	shells

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Programmable completion library for Bash

# bash-completion is licensed under gpl2+
# bash-completion-freebsd is licensed under bsd2
LICENSE=	bsd2 gpl2
LICENSE_COMB=	multi
LICENSE_FILE_bsd2=${WRKSRC}/freebsd/LICENSE
LICENSE_FILE_gpl2 =	${WRKSRC}/COPYING

TEST_DEPENDS=	runtest:misc/dejagnu \
		${LOCALBASE}/lib/tcllib/cmdline/cmdline.tcl:devel/tcllib

USES=		autoreconf gmake pathfix

GNU_CONFIGURE=	yes
NO_ARCH=	yes

SUB_FILES=	pkg-message
SUB_LIST=	RUNFILE=${DATADIR}/bash_completion.sh

GH_ACCOUNT=	scop
USE_GITHUB=	yes
GH_TUPLE=	0mp:bash-completion-freebsd:1.1.1:freebsd/freebsd

PORTSCOUT=	limit:^[0-9\.]*$$

OPTIONS_DEFINE=	CMAKE_MODULES DOCS
OPTIONS_SINGLE=	BASH
OPTIONS_SINGLE_BASH=	BASH_SHARED BASH_STATIC
OPTIONS_DEFAULT=BASH_SHARED CMAKE_MODULES
OPTIONS_SUB=	yes
BASH_SHARED_DESC=	Use shells/bash as backend
BASH_STATIC_DESC=	Use shells/bash-static as backend
CMAKE_MODULES_DESC=	Install bash-completion modules for cmake

BASH_SHARED_RUN_DEPENDS=bash:shells/bash
BASH_STATIC_RUN_DEPENDS=bash:shells/bash-static

.include <bsd.port.pre.mk>

# See PR 248829 for details
MAKE_CMD=	${LOCALBASE}/bin/gmake

post-configure:
	@${REINPLACE_CMD} \
		-e 's|/etc/ssl/openssl.cnf|${TRUE_PREFIX}& &|g' \
		-e 's|/usr/lib\(/aspell\)|${TRUE_PREFIX}/share\1|g' \
		-e 's|/usr/local|${TRUE_PREFIX}|g' \
		-e 's|/usr/ports|${PORTSDIR}|g' \
		-e 's|/usr\(/sbin/postconf\)|${TRUE_PREFIX}\1|g' \
		-e 's|/usr/share/info|&:${TRUE_PREFIX}/info|g' \
		-e 's|/var\(/lib/rpm/macros\)|${TRUE_PREFIX}\1|g' \
			${WRKSRC}/completions/*

post-install:
	cd ${WRKSRC}/freebsd/ && ${SETENV} ${MAKE_ENV} ${MAKE_CMD} ${MAKE_ARGS}

post-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}/
	cd ${WRKSRC}/ && ${INSTALL_DATA} CHANGES README.md doc/bash_completion.txt doc/bashrc doc/inputrc ${FAKE_DESTDIR}${DOCSDIR}/

do-test:
.for test in runCompletion runInstall runUnit
	-cd ${WRKSRC}/test && bash ${test}
.endfor

.include <bsd.port.post.mk>
