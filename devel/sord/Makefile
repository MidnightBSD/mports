# Created by: Michael Beer <beerml@sigma6audio.de>

PORTNAME=	sord
PORTVERSION=	0.16.22
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	https://download.drobilla.net/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight C library for storing RDF data in memory

LICENSE=	iscl
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libserd-0.so:devel/serd \
		libpcre2-8.so:devel/pcre2 \
		libzix-0.so:devel/zix

USES=		meson pkgconfig python:build tar:xz
USE_LDCONFIG=	yes
MESON_ARGS=	-Ddocs=disabled
PLIST_SUB=	VERSION=${PORTVERSION}

NO_TEST=	yes

post-install:
	@${STRIP_CMD} ${PREFIX}/lib/libsord-0.so.${PORTVERSION}
	@${STRIP_CMD} ${PREFIX}/bin/sord_validate
	@${STRIP_CMD} ${PREFIX}/bin/sordi

.include <bsd.port.mk>
