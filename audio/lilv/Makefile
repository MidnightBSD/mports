PORTNAME=	lilv
PORTVERSION=	0.24.12
PORTREVISION=	1
CATEGORIES=	audio
MASTER_SITES=	https://download.drobilla.net/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Make use of LV2 plugins as simple as possible

LICENSE=	iscl
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	lv2>=1.14.0:audio/lv2
LIB_DEPENDS=	libserd-0.so:devel/serd \
		libsndfile.so:audio/libsndfile \
		libsord-0.so:devel/sord \
		libsratom-0.so:audio/sratom
RUN_DEPENDS=	lv2>=1.14.0:audio/lv2

USES=		pkgconfig python:build tar:bzip2 waf

USE_LDCONFIG=	yes

PLIST_SUB=	VERSION=${PORTVERSION}

NO_TEST=	yes

post-install:
	@${STRIP_CMD} ${PREFIX}/lib/liblilv-0.so.${PORTVERSION}
	@${STRIP_CMD} ${PREFIX}/bin/lilv-bench
	@${STRIP_CMD} ${PREFIX}/bin/lv2apply
	@${STRIP_CMD} ${PREFIX}/bin/lv2bench
	@${STRIP_CMD} ${PREFIX}/bin/lv2info
	@${STRIP_CMD} ${PREFIX}/bin/lv2ls

.include <bsd.port.mk>
