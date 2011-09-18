# New ports collection makefile for:   libmodplug
# Date created:		3 February 2004
# Whom:			Emanuel Haupt <ehaupt@critical.ch>
#
# $MidnightBSD: mports/audio/libmodplug/Makefile,v 1.4 2009/12/31 23:05:10 laffer1 Exp $
# $FreeBSD: ports/audio/libmodplug/Makefile,v 1.10 2006/06/29 17:52:14 ehaupt Exp $
#

PORTNAME=	libmodplug
PORTVERSION=	0.8.8.1
CATEGORIES=	audio
MASTER_SITES=	SF/modplug-xmms/${PORTNAME}/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ModPlug mod-like music shared libraries
LICENSE=	publicdom

USE_LDCONFIG=	yes
USE_GMAKE=	yes
USE_GNOME=	pkgconfig
GNU_CONFIGURE=	yes
MAKE_JOBS_SAFE=	yes

post-patch:
	@${REINPLACE_CMD} -e '/^CXXFLAGS=/d' \
		${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's|{libdir}/pkgconfig|{prefix}/libdata/pkgconfig|' \
		${WRKSRC}/Makefile.in

.include <bsd.port.mk>
