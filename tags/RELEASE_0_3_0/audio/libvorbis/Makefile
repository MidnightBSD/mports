# $MidnightBSD: mports/audio/libvorbis/Makefile,v 1.7 2009/11/25 02:32:38 laffer1 Exp $

PORTNAME=	libvorbis
PORTVERSION=	1.3.1
PORTEPOCH=	3
CATEGORIES=	audio
MASTER_SITES=	http://downloads.xiph.org/releases/vorbis/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Audio compression codec library
LICENSE=	bsd3

LIB_DEPENDS=	ogg.7:${PORTSDIR}/audio/libogg

USE_AUTOTOOLS=	libtool:22
GNU_CONFIGURE=	yes
USE_GNOME=	gnomehack
CONFIGURE_ARGS=	--with-ogg=${LOCALBASE} \
		--disable-docs		# don't rebuild
USE_LDCONFIG=	yes
MAKE_JOBS_SAFE=	yes

.if defined(NOPORTDOCS)
MAKE_ENV=	DOC=""
.else
MAKE_ENV=	DOC=doc
.endif

.include <bsd.port.mk>
