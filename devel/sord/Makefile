# Created by: Michael Beer <beerml@sigma6audio.de>

PORTNAME=	sord
PORTVERSION=	0.16.10
CATEGORIES=	devel
MASTER_SITES=	http://download.drobilla.net/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight C library for storing RDF data in memory

LICENSE=	iscl
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libserd-0.so:devel/serd \
		libpcre.so:devel/pcre

USES=		pkgconfig python:build tar:bzip2 waf
USE_LDCONFIG=	yes
PLIST_SUB=	VERSION=${PORTVERSION}

NO_TEST=	yes

post-install:
	@${STRIP_CMD} ${PREFIX}/lib/libsord-0.so.${PORTVERSION}
	@${STRIP_CMD} ${PREFIX}/bin/sord_validate
	@${STRIP_CMD} ${PREFIX}/bin/sordi

.include <bsd.port.mk>
