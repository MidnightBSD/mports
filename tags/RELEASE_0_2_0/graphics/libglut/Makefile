# New ports collection makefile for:    libglut
# Date created:         Tue Feb  7 12:02:49  1995
# Whom:                 anholt
#
# $MidnightBSD: mports/graphics/libglut/Makefile,v 1.6 2008/03/21 03:50:33 ctriv Exp $
# $FreeBSD: ports/graphics/libglut/Makefile,v 1.7 2006/06/19 20:06:53 shaun Exp $
#

PORTNAME=	libglut
PORTVERSION=	7.0.1
CATEGORIES=	graphics
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	mesa3d
DISTNAME=	MesaGLUT-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A graphics library similar to SGI's OpenGL # '
LICENSE=	restricted

# not public domain, but freely redistributable.

USE_BZIP2=	yes
USE_LDCONFIG=	yes
USE_GL=		glu
USE_XORG=	xmu xi

WRKSRC=		${WRKDIR}/Mesa-${PORTVERSION}/src/glut/glx

FAKE_OPTS=	trueprefix

pre-patch:
	${CP} ${FILESDIR}/Makefile ${WRKSRC}/

pre-install:
	@${MKDIR} ${PREFIX}/include/GL

.include <bsd.port.mk>
