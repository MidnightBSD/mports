# New ports collection makefile for:	libixp
# Date created:				31 December 2006
# Whom:					Phil Pereira <phil@bsdnexus.com>
#
# $MidnightBSD: mports/devel/libixp/Makefile,v 1.2 2007/03/22 03:12:42 ctriv Exp $
#

PORTNAME=	libixp
DISTVERSION=	0.2
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	http://libs.suckless.org/download/

FAKE_FLAGS+=	PREFIX=${TRUE_PREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A stand-alone client/server 9P library including ixpc client

#MAKE_ARGS=	PREFIX="${PREFIX}" X11LIB="${X11BASE}/lib" 
MAKE_ARGS=	X11LIB="${X11BASE}/lib" \
		X11INC="${X11BASE}/include" CC="${CC}" \
		MANPREFIX="${MANPREFIX}/man"

MAN1=		ixpc.1

#post-patch:
#	@${REINPLACE_CMD} -E 's|-O3|${CFLAGS}|; \
#		s|(-[LI])\$${PREFIX}|\1${LOCALBASE}|' \
#		${WRKSRC}/config.mk
#	@${REINPLACE_CMD} -e 's|cp -f $${M|${INSTALL_MAN} $${M|' \
#		${WRKSRC}/Makefile

.include <bsd.port.mk>
