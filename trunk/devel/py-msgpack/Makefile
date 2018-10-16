# $MidnightBSD$

PORTNAME=	msgpack
PORTVERSION=	0.5.6
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	MessagePack (de)serializer for Python

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		python
USE_PYTHON=	autoplist distutils

post-install:
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/msgpack/_packer.so
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/msgpack/_unpacker.so

.include <bsd.port.mk>
