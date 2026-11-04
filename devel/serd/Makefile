# Created by: meka

PORTNAME=	serd
PORTVERSION=	0.32.8
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	https://download.drobilla.net/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C library for RDF syntax

LICENSE=	iscl
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		meson pkgconfig python:build tar:xz
USE_LDCONFIG=	yes
MESON_ARGS=	-Ddocs=disabled
BINARY_ALIAS=	python3=${PYTHON_CMD}

NO_TEST=	yes

PLIST_SUB=	VERSION=${PORTVERSION}

post-install:
	@${STRIP_CMD} ${PREFIX}/bin/serdi
	@${STRIP_CMD} ${PREFIX}/lib/*.so

.include <bsd.port.mk>
