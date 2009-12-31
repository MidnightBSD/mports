# New ports collection makefile for:  libid3tag
# Date created:        26 November 2003
# Whom:			Sergey Akifyev <asa@gascom.ru>
#
# $MidnightBSD: mports/audio/libid3tag/Makefile,v 1.2 2008/02/28 17:16:41 laffer1 Exp $
# $FreeBSD: ports/audio/libid3tag/Makefile,v 1.9 2006/02/23 10:34:33 ade Exp $
#

PORTNAME=	libid3tag
PORTVERSION=	0.15.1b
PORTREVISION=	1
CATEGORIES=	audio
MASTER_SITES=	SF/mad/${PORTNAME}/${PORTVERSION} \
		ftp://ftp.mars.org/pub/mpeg/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ID3 tags library (part of MAD project)
LICENSE=	gpl2

USE_GNOME=	pkgconfig
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

post-patch:
	@${REINPLACE_CMD} -e 's|echo aout|echo elf|g' \
		${WRKSRC}/configure

post-build:
	cd ${WRKSRC} && CONFIG_FILES=id3tag.pc CONFIG_HEADERS= ${SH} ./config.status

post-install:
	${MKDIR} ${PREFIX}/libdata/pkgconfig
	${INSTALL_DATA} ${WRKSRC}/id3tag.pc ${PREFIX}/libdata/pkgconfig

.include <bsd.port.mk>
