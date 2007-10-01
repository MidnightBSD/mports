# New ports collection makefile for:   libmodplug
# Date created:		3 February 2004
# Whom:			Emanuel Haupt <ehaupt@critical.ch>
#
# $MidnightBSD$
# $FreeBSD: ports/audio/libmodplug/Makefile,v 1.10 2006/06/29 17:52:14 ehaupt Exp $
#

PORTNAME=	libmodplug
PORTVERSION=	0.8
CATEGORIES=	audio
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	modplug-xmms

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ModPlug mod-like music shared libraries

USE_LDCONFIG=	yes
USE_GMAKE=	yes
USE_GNOME=	pkgconfig
GNU_CONFIGURE=	yes

post-patch:
	@${REINPLACE_CMD} -e 's|{libdir}/pkgconfig|{prefix}/libdata/pkgconfig|' \
		${WRKSRC}/Makefile.in

.include <bsd.port.mk>
