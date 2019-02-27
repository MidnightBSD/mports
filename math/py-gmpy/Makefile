# Created by: Wen Heping <wenheping@gmail.com>

PORTNAME=	gmpy
PORTVERSION=	1.17
CATEGORIES=	math python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python Extension that Wraps the GMP Library

LIB_DEPENDS=	libgmp.so:math/gmp

USES=		python zip
USE_PYTHON=	distutils autoplist

post-extract:
	${REINPLACE_CMD} -e 's#/usr/local#${LOCALBASE}#g' \
		${WRKSRC}/setup.py

.include <bsd.port.mk>
