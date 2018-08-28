# $MidnightBSD$

PORTNAME=	ninja
PORTVERSION=	1.7.2
DISTVERSIONPREFIX=	v
PORTEPOCH=	2
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ninja is a small build system closest in spirit to Make

LICENSE=	apache2

USE_GITHUB=	yes
GH_ACCOUNT=	ninja-build
WRKSRC=		${WRKDIR}/ninja-${PORTVERSION}

CONFLICTS=	irc/ninja-[0-9]*
USES=		python:build

PLIST_FILES=	bin/ninja
PORTDOCS=	HACKING.md README manual.asciidoc

OPTIONS_DEFINE=	DOCS

do-build:
	@(cd ${WRKSRC} && \
		CXX="${CXX}" CFLAGS="${CXXFLAGS}" ${PYTHON_CMD} configure.py --bootstrap)

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/ninja ${PREFIX}/bin
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	(cd ${WRKSRC} && \
	    ${INSTALL_DATA} HACKING.md README doc/manual.asciidoc \
	    ${DOCSDIR})

.include <bsd.port.mk>
