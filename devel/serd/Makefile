# Created by: meka

PORTNAME=	serd
PORTVERSION=	0.30.12
CATEGORIES=	devel
MASTER_SITES=	http://download.drobilla.net/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C library for RDF syntax

LICENSE=	iscl
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		pkgconfig tar:bzip2 waf
USE_CSTD=	c99
USE_LDCONFIG=	yes

PLIST_SUB=	VERSION=${PORTVERSION}

post-install:
	@${STRIP_CMD} ${PREFIX}/bin/serdi
	@${STRIP_CMD} ${PREFIX}/lib/*.so

.include <bsd.port.mk>
