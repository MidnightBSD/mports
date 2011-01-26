# New ports collection makefile for:	libvisual
# Date created:		23 oktober 2004
# Whom:			Koop Mast <kwm@FreeBSD.org>
#
# $MidnightBSD: mports/graphics/libvisual04/Makefile,v 1.2 2009/09/20 01:56:19 laffer1 Exp $
# $FreeBSD: ports/graphics/libvisual04/Makefile,v 1.14 2008/06/06 13:34:42 edwin Exp $
#

PORTNAME=	libvisual
PORTVERSION=	0.4.0
PORTREVISION=	1
CATEGORIES=	graphics
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTNAME}-${PORTVERSION}
PKGNAMESUFFIX=	04

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Abstraction library that sits between apps and visual plugin
LICENSE=	lgpl

USE_AUTOTOOLS=	libtool:22
USE_GNOME=	gnomehack pkgconfig
USE_GETTEXT=	yes
GNU_CONFIGURE=	yes
CPPFLAGS=	-I${LOCALBASE}/include ${PTHREAD_CFLAGS}
LDFLAGS=	-L${LOCALBASE}/lib ${PTHREAD_LIBS}
CONFIGURE_ENV=	CPPFLAGS="${CPPFLAGS}" LDFLAGS="${LDFLAGS}"
USE_LDCONFIG=	yes
PLIST_SUB=	VER=-0.4

post-patch:
	@${REINPLACE_CMD} -e 's|-Wno-unused-variable||g;s|-O3|${CFLAGS}|g' \
		${WRKSRC}/libvisual/Makefile.in
	@${REINPLACE_CMD} -e 's|sys/sched.h||g' -e '/test.*==/s|==|=|g' ${WRKSRC}/configure
	@${FIND} ${WRKSRC} -name Makefile.in | ${XARGS} ${REINPLACE_CMD} -e 's|$$<|$${.ALLSRC}|g'

.include <bsd.port.mk>
