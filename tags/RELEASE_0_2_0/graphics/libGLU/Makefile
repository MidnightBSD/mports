# New ports collection makefile for:    libGLU
# Date created:		15 Oct 2007
# Whom:			luke@MidnightBSD.org
#
# $MidnightBSD$
#

PORTNAME=	libGLU
PORTVERSION=	7.0
CATEGORIES=	graphics
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	 mesa3d
DISTNAME=	MesaLib-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OpenGL utility library
LICENSE=	lgpl

CONFLICTS=	xorg-libraries-6.*

USE_BZIP2=	yes
USE_LDCONFIG= yes
USE_GL=		gl

WRKSRC=		${WRKDIR}/Mesa-${PORTVERSION}/src/glu/sgi

ALL_TARGET=	libGLU.so

post-patch:
	${CP} ${FILESDIR}/config ${WRKDIR}/Mesa-${PORTVERSION}/configs/current

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/libGLU.so.1 ${PREFIX}/lib
	${LN} -sf libGLU.so.1 ${PREFIX}/lib/libGLU.so
	${MKDIR} ${PREFIX}/include/GL
	${INSTALL_DATA} ${WRKDIR}/Mesa-${PORTVERSION}/include/GL/glu.h ${PREFIX}/include/GL

.include <bsd.port.mk>
