PORTNAME=	tclap
DISTVERSION=	1.4.0-rc1
CATEGORIES=	devel
MASTER_SITES=	SF/${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Verbose replacement for getopt
WWW=		https://tclap.sourceforge.net/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		cmake:testing cpe python:test shebangfix tar:bz2
CPE_VENDOR=	${PORTNAME}_project

SHEBANG_GLOB=	*.py

CMAKE_TESTING_ON=	FREEBSD_TESTS # tests are broken: https://sourceforge.net/p/tclap/bugs/36/ (can't find directories)
NO_TEST=yes
NO_ARCH=	yes # builds tests unconditionally https://sourceforge.net/p/tclap/bugs/35/

OPTIONS_DEFINE=	DOCS

PORTDOCS=	*

.include <bsd.port.mk>
