# New ports collection makefile for:	libvorbis
# Date created:				18 October 2000
# Whom:					t.vanklaveren@student.utwente.nl
#
# $MidnightBSD: mports/audio/libvorbis/Makefile,v 1.1 2006/10/03 16:07:36 wintellect Exp $
# $FreeBSD: ports/audio/libvorbis/Makefile,v 1.30 2006/02/23 10:34:37 ade Exp $
#

PORTNAME=	libvorbis
PORTVERSION=	1.2.0
PORTEPOCH=	3
CATEGORIES=	audio
MASTER_SITES=	http://downloads.xiph.org/releases/vorbis/ \
		http://freebsd.unixfreunde.de/sources/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Audio compression codec library

LIB_DEPENDS=	ogg.5:${PORTSDIR}/audio/libogg

GNU_CONFIGURE=	yes
USE_GNOME=	gnomehack
CONFIGURE_ARGS=	--with-ogg=${LOCALBASE}
USE_LDCONFIG=	yes

.if defined(NOPORTDOCS)
MAKE_ENV=	DOC=""
.else
MAKE_ENV=	DOC=doc
.endif

.include <bsd.port.mk>
