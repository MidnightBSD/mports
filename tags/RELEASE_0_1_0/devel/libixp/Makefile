# New ports collection makefile for:	libixp
# Date created:				31 December 2006
# Whom:					Phil Pereira <phil@bsdnexus.com>
#
# $MidnightBSD: mports/devel/libixp/Makefile,v 1.3 2007/04/04 19:49:28 wintellect Exp $
#

PORTNAME=	libixp
DISTVERSION=	0.2.42
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	http://libs.suckless.org/download/
USE_BZIP2=	yes
FAKE_OPTS=	trueprefix

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A stand-alone client/server 9P library including ixpc client

MAKE_ARGS=	X11LIB="${X11BASE}/lib" \
		X11INC="${X11BASE}/include" CC="${CC}" \
		MANPREFIX="${MANPREFIX}/man"

MAN1=		ixpc.1


.include <bsd.port.mk>
