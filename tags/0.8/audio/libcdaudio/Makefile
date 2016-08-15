# $MidnightBSD$
# $FreeBSD: ports/audio/libcdaudio/Makefile,v 1.26 2007/01/28 09:07:34 kris Exp $

PORTNAME=	libcdaudio
PORTVERSION=	0.99.12p2
PORTREVISION=	2
CATEGORIES=	audio
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for playing audio CDs

LICENSE=	gpl2

USES=		libtool pathfix pkgconfig
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

post-install:
	${STRIP_CMD} ${PREFIX}/lib/libcdaudio.so.1.*

.include <bsd.port.mk>
