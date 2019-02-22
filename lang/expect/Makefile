# $MidnightBSD$

PORTNAME=	expect
PORTVERSION=	5.45.4
CATEGORIES=	lang tcl tk
MASTER_SITES=	SF/expect/Expect/${PORTVERSION}
DISTNAME=	${PORTNAME}${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sophisticated scripter based on Tcl/Tk

LICENSE=	publicdom
LICENSE_FILE=	${WRKSRC}/license.terms

#FAKE_OPTS+=	prefixhack

USES=		tcl:tea autoreconf
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-shared \
		--exec-prefix=${PREFIX} \
		--datadir=${DATADIR}
#--with-tclconfig=${TCL_LIBDIR} \
#--with-tclinclude=${TCL_INCLUDEDIR}
PLIST_SUB+=	PORTVERSION=${PORTVERSION}
TEST_TARGET=	test

WRKSRC=               ${WRKDIR}/${DISTNAME}

post-install:
	${LN} -sf expect${PORTVERSION}/libexpect${PORTVERSION}.so \
	    	${STAGEDIR}${PREFIX}/lib/libexpect.so.1
	${LN} -sf libexpect.so.1 \
		${STAGEDIR}${PREFIX}/lib/libexpect.so

.include <bsd.port.mk>
