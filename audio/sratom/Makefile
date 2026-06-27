PORTNAME=	sratom
PORTVERSION=	0.6.22
PORTREVISION=	1
CATEGORIES=	audio
MASTER_SITES=	https://download.drobilla.net/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for serialising LV2 atoms to/from RDF

LICENSE=	iscl
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	lv2>=1.14.0:audio/lv2
LIB_DEPENDS=	libserd-0.so:devel/serd \
		libsord-0.so:devel/sord
RUN_DEPENDS=	lv2>=1.14.0:audio/lv2

USES=		meson pkgconfig python:build tar:xz
USE_LDCONFIG=	yes
MESON_ARGS=	-Ddocs=disabled
BINARY_ALIAS=	python3=${PYTHON_CMD}

PLIST_SUB=	VERSION=${PORTVERSION}

NO_TEST=	yes

post-install:
	@${STRIP_CMD} ${PREFIX}/lib/libsratom-0.so.${PORTVERSION}

.include <bsd.port.mk>
