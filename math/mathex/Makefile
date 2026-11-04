PORTNAME=	mathex
DISTVERSION=	0.3-b
CATEGORIES=	math science devel
MASTER_SITES=	SF/sscilib/mathex

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C++ library to parse/evaluate mathematical expressions
WWW=		https://sscilib.sourceforge.net/

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/license.txt

USES=		dos2unix zip
DOS2UNIX_FILES=	makefile

WRKSRC=		${WRKDIR}/${PORTNAME}
MAKEFILE=	makefile
ALL_TARGET=	${PORTNAME}
USE_LDCONFIG=	yes

PLIST_FILES=	${PREFIX}/include/mathex.h	\
		${PREFIX}/lib/lib${PORTNAME}.so	\
		${PREFIX}/lib/lib${PORTNAME}.so.0
EXAMPLES_PLIST_FILES=	${PROGS:C|^|${PREFIX}/bin/|}

PROGS=		curvetest inttest tabletest userfunctest

OPTIONS_DEFINE=	EXAMPLES

post-build:
	(cd ${WRKSRC} &&	\
	${CXX} ${LDFLAGS} -shared -o lib${PORTNAME}.so.0 -Wl,-soname,lib${PORTNAME}.so.0 ${PORTNAME}.o)

do-install:
	${INSTALL_DATA} ${WRKSRC}/mathex.h ${PREFIX}/include/
	${INSTALL_LIB} ${WRKSRC}/lib${PORTNAME}.so.0 ${PREFIX}/lib/
	${LN} -s lib${PORTNAME}.so.0 ${PREFIX}/lib/lib${PORTNAME}.so

do-install-EXAMPLES-on:
.for p in ${PROGS}
	${INSTALL_PROGRAM} ${WRKSRC}/${p} ${FAKE_DESTDIR}${PREFIX}/bin/
.endfor

.include <bsd.port.mk>
