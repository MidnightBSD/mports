# $MidnightBSD: mports/multimedia/v4l_compat/Makefile,v 1.4 2011/01/14 14:33:39 laffer1 Exp $

PORTNAME=	v4l_compat
PORTVERSION=	1.0.${DUMMYDATE}
PORTREVISION=	1
CATEGORIES=	multimedia
MASTER_SITES=	FREEBSD_LOCAL/kwm
DUMMYDATE=	20101027

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Video4Linux IOCTL header files
LICENSE=	unknown

NO_BUILD=	yes
BASE_HEADERS=	videodev.h videodev2.h
DVB_HEADERS=	audio.h ca.h dmx.h frontend.h net.h osd.h version.h video.h

do-install:
	${MKDIR} ${PREFIX}/include/linux/dvb
.for file in ${BASE_HEADERS}
	${INSTALL_DATA} ${WRKSRC}/${file} ${PREFIX}/include/linux/
.endfor
.for file in ${DVB_HEADERS}
	${INSTALL_DATA} ${WRKSRC}/dvb/${file} ${PREFIX}/include/linux/dvb/
.endfor
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/COPYING ${DOCSDIR}

.include <bsd.port.mk>
