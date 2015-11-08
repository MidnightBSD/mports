# $MidnightBSD$

PORTNAME=	expect
PORTVERSION=	5.45
CATEGORIES=	lang tcl tk
MASTER_SITES=	SF/expect/Expect/${PORTVERSION}
DISTNAME=	${PORTNAME}${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sophisticated scripter based on Tcl/Tk

LICENSE=	unknown

LIBEXPECT_VER=	${PORTVERSION:S/.//}

WRKSRC=		${WRKDIR}/${PORTNAME}${PORTVERSION}

FAKE_OPTS+=	prefixhack

USES=		tcl
USE_TCL=	yes
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-shared \
		--exec-prefix=${PREFIX} \
		--datadir=${DATADIR} \
		--with-tclconfig=${TCL_LIBDIR} \
		--with-tclinclude=${TCL_INCLUDEDIR}
PLIST_SUB+=	EXPECT_VER=${PORTVERSION} \
		LIBEXPECT_VER=${LIBEXPECT_VER}

post-install:
	${LN} -sf expect${PORTVERSION}/libexpect${LIBEXPECT_VER}.so \
	    	${STAGEDIR}${PREFIX}/lib/libexpect.so.1
	${LN} -sf libexpect.so.1 \
		${STAGEDIR}${PREFIX}/lib/libexpect.so

regression-test: build
	cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${MAKE} test

.include <bsd.port.mk>
