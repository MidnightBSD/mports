# $MidnightBSD: mports/x11-toolkits/Xaw3d/Makefile,v 1.9 2010/09/04 15:57:27 laffer1 Exp $

PORTNAME=	Xaw3d
PORTVERSION=	1.5E
PORTREVISION=	5
CATEGORIES=	x11-toolkits
MASTER_SITES=	ftp://ftp.visi.com/users/hawkeyd/X/ \
		ftp.slackware.com/pub/slackware/slackware_source/x/xaw3d/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A 3-D Athena Widget set that looks like Motif
LICENSE=	mit

WRKSRC=		${WRKDIR}/xc/lib/Xaw3d
USE_IMAKE=	yes
USE_XORG=	x11 xext xt xmu sm ice xpm
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
