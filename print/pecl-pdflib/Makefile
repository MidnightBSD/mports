PORTNAME=	pdflib
PORTVERSION=	4.1.3
CATEGORIES=	print

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PECL extension to create PDF on the fly

LICENSE=	php

LIB_DEPENDS=	libpdf.so:print/pdflib

USES=		php:pecl
USE_PHP=	gd:build
PHP_MODNAME=	pdf

CONFIGURE_ARGS=	--with-pdflib=${LOCALBASE}
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd10.4

.include <bsd.port.mk>
