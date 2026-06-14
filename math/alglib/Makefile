PORTNAME=	alglib
DISTVERSION=	4.07.0
CATEGORIES=	math science
MASTER_SITES=	https://www.alglib.net/translator/re/
EXTRACT_SUFX=	.cpp.gpl.zip

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Numerical analysis and data processing library
WWW=		https://www.alglib.net/

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/gpl3.txt

USE_LDCONFIG=	yes
WRKSRC=		${WRKDIR}/${PORTNAME}-cpp

do-build:
	cd ${WRKSRC}/src && \
		${CXX} ${CXXFLAGS} -fPIC -Wl,-soname,lib${PORTNAME}.so.3 -shared -o lib${PORTNAME}.so.3 *.cpp

do-install:
	@${MKDIR} ${PREFIX}/include/lib${PORTNAME}
	${INSTALL_DATA} ${WRKSRC}/src/*.h ${PREFIX}/include/lib${PORTNAME}
	${INSTALL_LIB} ${WRKSRC}/src/lib${PORTNAME}.so.3 ${PREFIX}/lib
	@${LN} -s lib${PORTNAME}.so.3 ${PREFIX}/lib/lib${PORTNAME}.so

do-test:
	@cd ${WRKSRC} && \
		cd tests && \
		${CXX} ${CXXFLAGS} test_c.cpp -I ${FAKE_DESTDIR}${LOCALBASE}/include/libalglib ${FAKE_DESTDIR}${LOCALBASE}/lib/lib${PORTNAME}.so && \
		LD_PRELOAD=${FAKE_DESTDIR}${LOCALBASE}/lib/lib${PORTNAME}.so ./a.out

.include <bsd.port.mk>
