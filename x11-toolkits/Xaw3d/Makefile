# New ports collection makefile for:	Xaw3d
# Date created:		18 November 1994
# Whom:			asami
#
# $MidnightBSD: mports/x11-toolkits/Xaw3d/Makefile,v 1.3 2007/10/25 04:34:28 laffer1 Exp $
# $FreeBSD: ports/x11-toolkits/Xaw3d/Makefile,v 1.47 2006/08/15 01:13:35 clsung Exp $
#

PORTNAME=	Xaw3d
PORTVERSION=	1.5E
PORTREVISION=	2
CATEGORIES=	x11-toolkits
MASTER_SITES=	ftp://ftp.visi.com/users/hawkeyd/X/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A 3-D Athena Widget set that looks like Motif
LICENSE=	unknown

WRKSRC=		${WRKDIR}/xc/lib/Xaw3d
USE_IMAKE=	yes
USE_XLIB=	yes
USE_LDCONFIG=	yes

BUILD_DEPENDS+=	${LOCALBASE}/lib/X11/config/Imake.tmpl:${PORTSDIR}/x11/xorg-cf-files

SUB_FILES=	pkg-message
SUB_LIST=	XAWVER="${XAWVER}"

.include <bsd.port.pre.mk>

post-extract:
	${MKDIR} ${WRKSRC}/X11/Xaw3d
	cd ${WRKSRC}/X11/Xaw3d; ${LN} -sf ../../*.h .

post-install:
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README.XAW3D ${DOCSDIR}

.include <bsd.port.post.mk>
