# $FreeBSD: ports/audio/libdssialsacompat/Makefile,v 1.5 2009/08/02 19:32:18 mezz Exp $
# $MidnightBSD: mports/audio/libdssialsacompat/Makefile,v 1.1 2010/02/27 19:44:46 laffer1 Exp $

PORTNAME=	libdssialsacompat
PORTVERSION=	1.0.8a
CATEGORIES=	audio
MASTER_SITES=	http://www.smbolton.com/linux/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Alsa compatibility library to build DSSI
LICENSE=	lgpl

USE_AUTOTOOLS=	libtool
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

post-patch:
	@${REINPLACE_CMD} -e 's|(libdir)/pkgconfig|(prefix)/libdata/pkgconfig|' ${WRKSRC}/Makefile.in

.include <bsd.port.mk>
