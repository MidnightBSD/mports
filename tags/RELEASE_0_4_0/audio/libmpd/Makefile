# $MidnightBSD: mports/audio/libmpd/Makefile,v 1.3 2010/02/27 16:23:34 laffer1 Exp $

PORTNAME=	libmpd
PORTVERSION=	0.19.0
CATEGORIES=	audio
MASTER_SITES=	http://download.sarine.nl/Programs/gmpc/${PORTVERSION}/ \
		http://freebsd.unixfreunde.de/sources/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Abstraction around libmpdclient
LICENSE=	gpl2

USE_AUTOTOOLS=	libtool
GNU_CONFIGURE=	yes
USE_GNOME=	pkgconfig glib20 gnomehack
USE_LDCONFIG=	yes

post-patch:
	@${REINPLACE_CMD} -e 's,libmpd-1.0\/libmpd,libmpd,' \
		${WRKSRC}/src/Makefile.in

.include <bsd.port.mk>
