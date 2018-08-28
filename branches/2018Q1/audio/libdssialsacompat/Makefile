# $FreeBSD: ports/audio/libdssialsacompat/Makefile,v 1.5 2009/08/02 19:32:18 mezz Exp $
# $MidnightBSD$

PORTNAME=	libdssialsacompat
PORTVERSION=	1.0.8a
CATEGORIES=	audio
MASTER_SITES=	http://www.smbolton.com/linux/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Alsa compatibility library to build DSSI
LICENSE=	lgpl

USES=	libtool
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

post-patch:
	@${REINPLACE_CMD} -e 's|(libdir)/pkgconfig|(prefix)/libdata/pkgconfig|' ${WRKSRC}/Makefile.in

.include <bsd.port.mk>
