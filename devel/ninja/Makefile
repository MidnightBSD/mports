# $MidnightBSD$

PORTNAME=	ninja
PORTVERSION=	1.4.0
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ninja is a small build system closest in spirit to Make

LICENSE=	apache2

USE_GITHUB=	yes
GH_ACCOUNT=	martine
GH_TAGNAME=	v${PORTVERSION}
GH_COMMIT=	63d5b10

CONFLICTS=	irc/ninja-[0-9]*
USE_PYTHON_BUILD=	yes

PLIST_FILES=	bin/ninja
PORTDOCS=	COPYING HACKING.md README manual.asciidoc

.include <bsd.mport.options.mk>

do-build:
	@(cd ${WRKSRC} && \
		CXX=${CXX} CFLAGS="${CXXFLAGS}" ${PYTHON_CMD} bootstrap.py --verbose)

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/ninja ${PREFIX}/bin
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	(cd ${WRKSRC} && \
	    ${INSTALL_DATA} COPYING HACKING.md README doc/manual.asciidoc \
	    ${DOCSDIR})

.include <bsd.port.mk>
