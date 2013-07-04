# $MidnightBSD: mports/multimedia/v4l_compat/Makefile,v 1.6 2011/09/05 14:30:28 laffer1 Exp $

PORTNAME=	v4l_compat
PORTVERSION=	1.0.${DUMMYDATE}
CATEGORIES=	multimedia
MASTER_SITES=	FREEBSD_LOCAL/kwm

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Video4Linux IOCTL header files
LICENSE=	unknown

DUMMYDATE=	20120501

NO_BUILD=	yes
BASE_HEADERS=	input.h uinput.h videodev.h videodev2.h
DVB_HEADERS=	audio.h ca.h dmx.h frontend.h net.h osd.h version.h video.h

do-install:
	${MKDIR} ${PREFIX}/include/linux/dvb
.for f in ${BASE_HEADERS}
	${INSTALL_DATA} ${WRKSRC}/${f} ${PREFIX}/include/linux/
.endfor
.for f in ${DVB_HEADERS}
	${INSTALL_DATA} ${WRKSRC}/dvb/${f} ${PREFIX}/include/linux/dvb/
.endfor
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/COPYING ${DOCSDIR}

.include <bsd.port.mk>
