PORTNAME=	iso-codes
DISTVERSIONPREFIX=	v
DISTVERSION=	4.15.0
CATEGORIES=	misc

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lists of the country, language, and currency iso names
WWW=		https://salsa.debian.org/iso-codes-team/iso-codes

LICENSE=	lgpl2.1

USES=		gettext-tools gmake pathfix python:build tar:xz

BUILD_DEPENDS+=	python3:lang/python3

GNU_CONFIGURE=	yes
NO_ARCH=	yes

USE_GITLAB=	yes
GL_SITE=	https://salsa.debian.org
GL_ACCOUNT=	iso-codes-team

BINARY_ALIAS=	python3=${PYTHON_VERSION}

.include <bsd.port.mk>
