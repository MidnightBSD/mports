# $MidnightBSD$

PORTNAME=	libvorbis
PORTVERSION=	1.3.4
PORTEPOCH=	3
CATEGORIES=	audio
MASTER_SITES=	http://downloads.xiph.org/releases/vorbis/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Audio compression codec library

LICENSE=	bsd3

LIB_DEPENDS=	ogg:${PORTSDIR}/audio/libogg

USE_AUTOTOOLS=	libtool
GNU_CONFIGURE=	yes
USE_GNOME=	gnomehack
CONFIGURE_ARGS=	--with-ogg=${LOCALBASE} \
		--disable-docs		# don't rebuild
USE_LDCONFIG=	yes

.if defined(NOPORTDOCS)
MAKE_ENV=	DOC=""
.else
MAKE_ENV=	DOC=doc
.endif

.include <bsd.port.mk>
