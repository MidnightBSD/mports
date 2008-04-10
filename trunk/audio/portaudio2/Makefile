# New ports collection makefile for:	portaudio
# Date created:		18 May 2003
# Whom:			michaelnottebrock@gmx.net and lioux@FreeBSD.org
#
# $MidnightBSD: mports/audio/portaudio2/Makefile,v 1.2 2008/02/28 14:29:22 laffer1 Exp $
# $FreeBSD: ports/audio/portaudio2/Makefile,v 1.13 2007/02/25 13:30:18 sat Exp $
#

PORTNAME=	portaudio
PORTVERSION=	19.b${SNAPREV}
CATEGORIES=	audio
MASTER_SITES=	CENKES
# svn export -rSNAPREV https://www.portaudio.com/repos/portaudio/branches/v19-devel
LATEST_LINK=	${PORTNAME}2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Portable cross-platform Audio API
LICENSE=	x11

SNAPREV=	1175
USE_BZIP2=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-static --without-alsa --without-jack --without-asihpi \
		--libdir=${PREFIX}/lib/${PORTNAME}2 --includedir=${PREFIX}/include/${PORTNAME}2
USE_LDCONFIG=	${PREFIX}/lib/${PORTNAME}2

post-patch:
	@${GREP} -lre -lpthread ${WRKSRC}|${XARGS} ${REINPLACE_CMD} -e 's|-lpthread|${PTHREAD_LIBS}|'
	@${REINPLACE_CMD} -e '/pkgconfig/s|$$[(]libdir[)]|${PREFIX}/libdata|' ${WRKSRC}/Makefile.in

.include <bsd.port.mk>
