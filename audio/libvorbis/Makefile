# New ports collection makefile for:	libvorbis
# Date created:				18 October 2000
# Whom:					t.vanklaveren@student.utwente.nl
#
# $MidnightBSD: mports/audio/libvorbis/Makefile,v 1.4 2008/04/10 04:00:44 ctriv Exp $
# $FreeBSD: ports/audio/libvorbis/Makefile,v 1.30 2006/02/23 10:34:37 ade Exp $
#

PORTNAME=	libvorbis
PORTVERSION=	1.2.0
PORTREVISION=	1
PORTEPOCH=	3
CATEGORIES=	audio
MASTER_SITES=	http://downloads.xiph.org/releases/vorbis/ \
		http://freebsd.unixfreunde.de/sources/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Audio compression codec library
LICENSE=	bsd3

LIB_DEPENDS=	ogg.5:${PORTSDIR}/audio/libogg

USE_AUTOTOOLS=	libtool:22
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
