# New ports collection makefile for:	libvorbis
# Date created:				18 October 2000
# Whom:					t.vanklaveren@student.utwente.nl
#
# $MidnightBSD$
# $FreeBSD: ports/audio/libvorbis/Makefile,v 1.30 2006/02/23 10:34:37 ade Exp $
#

PORTNAME=	libvorbis
PORTVERSION=	1.1.2
PORTEPOCH=	3
CATEGORIES=	audio
MASTER_SITES=	http://downloads.xiph.org/releases/vorbis/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Audio compression codec library

LIB_DEPENDS=	ogg.5:${PORTSDIR}/audio/libogg

GNU_CONFIGURE=	yes
USE_GNOME=	gnomehack
CONFIGURE_ARGS=	--with-ogg=${LOCALBASE}
INSTALLS_SHLIB=	yes

.if defined(NOPORTDOCS)
MAKE_ENV=	DOC=""
.else
MAKE_ENV=	DOC=doc
.endif

.include <bsd.port.mk>
