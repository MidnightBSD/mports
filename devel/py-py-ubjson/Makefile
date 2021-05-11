# Created by: Po-Chuan Hsieh <sunpoet@FreeBSD.org>

PORTNAME=	py-ubjson
PORTVERSION=	0.16.1
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Universal Binary JSON encoder/decoder

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		python:3.6+
USE_PYTHON=	autoplist concurrent distutils

post-install:
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/_ubjson*.so

.include <bsd.port.mk>
