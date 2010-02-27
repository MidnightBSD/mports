# $FreeBSD: ports/audio/timemachine/Makefile,v 1.8 2009/07/31 13:49:12 dinoex Exp $
# $MidnightBSD$

PORTNAME=	timemachine
PORTVERSION=	0.3.2
CATEGORIES=	audio
MASTER_SITES=	http://plugin.org.uk/timemachine/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	JACK audio capture tool
LICENSE=	gpl2

LIB_DEPENDS=	jack.0:${PORTSDIR}/audio/jack \
		sndfile.1:${PORTSDIR}/audio/libsndfile

GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_GNOME=	gtk20

.include <bsd.port.pre.mk>

.if exists(${LOCALBASE}/lib/liblash.so.2)
LIB_DEPENDS+=	lash.2:${PORTSDIR}/audio/lash
.endif

.include <bsd.port.post.mk>
