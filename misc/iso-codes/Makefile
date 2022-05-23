PORTNAME=	iso-codes
PORTVERSION=	4.7
CATEGORIES=	misc

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lists of the country, language, and currency iso names

LICENSE=	lgpl2.1

USES=		gettext-tools gmake pathfix python:3.4+,build tar:xz

BUILD_DEPENDS+=	python3:lang/python3

GNU_CONFIGURE=	yes
NO_ARCH=	yes

USE_GITLAB=	yes
GL_SITE=	https://salsa.debian.org
GL_ACCOUNT=	iso-codes-team
GL_COMMIT=	59767ed869f3952575f7d0f639a290a4c4b315e5

BINARY_ALIAS=	python3=${PYTHON_VERSION}

.include <bsd.port.mk>
