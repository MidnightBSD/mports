PORTNAME=	ninja
PORTVERSION=	1.11.1
PORTREVISION=	1
DISTVERSIONPREFIX=	v
PORTEPOCH=	2
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Small build system closest in spirit to Make
WWW=		https://ninja-build.org/

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/COPYING

USE_GITHUB=	yes
GH_ACCOUNT=	ninja-build
WRKSRC=		${WRKDIR}/ninja-${PORTVERSION}

CONFLICTS=	irc/ninja-[0-9]*
USES=		python

PORTSCOUT=	limit:^1\.

PLIST_FILES=	bin/ninja
PORTDOCS=	README.md manual.asciidoc

OPTIONS_DEFINE=		DOCS BASH ZSH
OPTIONS_DEFAULT=	BASH ZSH

BASH_PLIST_FILES=	share/bash-completion/completions/ninja
ZSH_PLIST_FILES=	share/zsh/site-functions/_ninja

post-patch:
	@${REINPLACE_CMD} "s/'-g', //" ${WRKSRC}/configure.py

do-build:
	@(cd ${WRKSRC} && \
		CXX="${CXX}" CFLAGS="${CXXFLAGS}" ${PYTHON_CMD} configure.py --bootstrap)

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/ninja ${STAGEDIR}${PREFIX}/bin
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	(cd ${WRKSRC} && \
	    ${INSTALL_DATA} README.md doc/manual.asciidoc \
	    ${STAGEDIR}${DOCSDIR})

do-install-BASH-on:
	@${MKDIR} ${FAKE_DESTDIR}${PREFIX}/share/bash-completion/completions/
	${INSTALL_DATA} ${WRKSRC}/misc/bash-completion \
		${FAKE_DESTDIR}${PREFIX}/share/bash-completion/completions/ninja

do-install-ZSH-on:
	@${MKDIR} ${FAKE_DESTDIR}${PREFIX}/share/zsh/site-functions
	${INSTALL_DATA} ${WRKSRC}/misc/zsh-completion \
		${FAKE_DESTDIR}${PREFIX}/share/zsh/site-functions/_ninja

do-test: build
	cd ${WRKSRC} && ./ninja ninja_test && ./ninja_test

.include <bsd.port.mk>
