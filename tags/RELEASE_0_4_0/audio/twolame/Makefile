# $MidnightBSD: mports/audio/twolame/Makefile,v 1.5 2011/06/15 22:21:05 laffer1 Exp $

PORTNAME=	twolame
PORTVERSION=	0.3.13
CATEGORIES=	audio
MASTER_SITES=	SF \
		http://www.ecs.soton.ac.uk/~njh/twolame/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	MPEG Audio Layer 2 encoder
LICENSE=	gpl2

LIB_DEPENDS=	sndfile.1:${PORTSDIR}/audio/libsndfile

MAKE_JOBS_SAFE=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomehack  pkgconfig
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes

MAN1=		twolame.1

post-patch:
	@${REINPLACE_CMD} -e 's| -O3||g' \
		${WRKSRC}/configure

.include <bsd.port.mk>
