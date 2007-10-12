# New ports collection makefile for:	xf86-video-openchrome
# Date Created:				17 Sep 2007
# Whom:					Florent Thoumie <flz@FreeBSD.org>
#
# $FreeBSD: ports/x11-drivers/xf86-video-openchrome/Makefile,v 1.1 2007/10/09 17:51:23 flz Exp $
# $MidnightBSD$
#

PORTNAME=	xf86-video-openchrome
PORTVERSION=	0.2.6
CATEGORIES=	x11-drivers
MASTER_SITES=	http://archive.ubuntu.com/ubuntu/pool/main/x/xserver-xorg-video-openchrome/
DISTFILES=	xserver-xorg-video-openchrome_${PORTVERSION}+svn357.orig.tar.gz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org openchrome display driver
LICENSE=	x11

USE_TGZ=	yes
WRKSRC=		${WRKDIR}/xserver-xorg-video-openchrome
NOMANCOMPRESS=	yes

USE_AUTOTOOLS=	autoconf:259:env automake:19:env libtool:15:env

XORG_CAT=	driver
USE_GL=		gl
USE_XORG=	xvmc xf86driproto glproto
MAN4=		via.4x

post-patch:
	@cd ${WRKSRC} && ${REINPLACE_CMD} -e 's:autoreconf:${AUTORECONF}:' autogen.sh

pre-configure:
	@(cd ${WRKSRC} && ${SETENV} AUTOMAKE=${AUTOMAKE} ACLOCAL=${ACLOCAL} ${SH} ./autogen.sh)

.include <bsd.port.mk>
