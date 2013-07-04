# $MidnightBSD: mports/graphics/jbigkit/Makefile,v 1.3 2009/08/29 16:35:26 laffer1 Exp $

PORTNAME=	jbigkit
PORTVERSION=	1.6
PORTREVISION=	1
CATEGORIES=	graphics
MASTER_SITES=	http://www.cl.cam.ac.uk/~mgk25/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lossless compression for bi-level images such as scanned pages, faxes
LICENSE=	gpl2

WRKSRC=	${WRKDIR}/${PORTNAME}

USE_LDCONFIG=	yes

MAN1=	jbgtopbm.1 pbmtojbg.1

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${PREFIX}/share/doc/jbig
	${INSTALL_DATA} ${WRKSRC}/libjbig/jbig.doc ${PREFIX}/share/doc/jbig
.endif

post-build test:
	cd ${WRKSRC} && ${SETENV} LD_LIBRARY_PATH=${WRKSRC}/libjbig ${MAKE} test

.include <bsd.port.mk>
