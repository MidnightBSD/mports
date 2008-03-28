# New ports collection makefile for:	xfs
# Date Created:				17 Feb 2006
# Whom:					Florent Thoumie <flz@FreeBSD.org>
#
# $FreeBSD: ports/x11-fonts/xfs/Makefile,v 1.13 2007/07/02 17:42:22 lesi Exp $
# $MidnightBSD: mports/x11-fonts/xfs/Makefile,v 1.1 2007/10/07 17:08:15 ctriv Exp $
#

PORTNAME=	xfs
PORTVERSION=	1.0.5
CATEGORIES=	x11-fonts

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org font server
LICENSE=	x11

XORG_CAT=	app
USE_XORG=	libfs xfont xtrans
USE_RC_SUBR=	xfs
ALL_TARGET=	all config

MAN1=		xfs.1

.if !defined(WITHOUT_XFS_CACHE)
USE_XORG+=	fontcacheproto x11
CFLAGS+=	-DFONTCACHE
.else
post-patch:
	${REINPLACE_CMD} -e 's|^cache|XCOMM &|' ${WRKSRC}/config.cpp
.endif

post-install:
	${INSTALL_SCRIPT} ${WRKSRC}/config ${PREFIX}/lib/X11/fs/config.default

.include <bsd.port.mk>
