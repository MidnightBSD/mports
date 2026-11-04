PORTNAME=	astyle
PORTVERSION=	3.6.13
CATEGORIES=	devel textproc
MASTER_SITES=	SF/astyle/astyle/astyle%20${PORTVERSION:R}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Source code indenter and formatter for C, C++, C\#, and Java
WWW=		https://astyle.sourceforge.net/ \
		https://gitlab.com/saalen/astyle

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/../../LICENSE.md

USES=		compiler:c++11-lang dos2unix gmake tar:bz2

ALL_TARGET=	astyle
MAKE_ENV=	CXX="${CXX}"
WRKSRC_SUBDIR=	build/${CHOSEN_COMPILER_TYPE}

DOS2UNIX_GLOB=	*.ini

OPTIONS_DEFINE=	DOCS EXAMPLES

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/bin/astyle ${PREFIX}/bin

do-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/../../doc/* ${FAKE_DESTDIR}${DOCSDIR}

do-install-EXAMPLES-on:
	${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/../../file/* ${FAKE_DESTDIR}${EXAMPLESDIR}

.include <bsd.port.mk>
