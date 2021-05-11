# Created by: Po-Chuan Hsieh <sunpoet@FreeBSD.org>

PORTNAME=	cbor
PORTVERSION=	1.0.0
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RFC 7049 - Concise Binary Object Representation

LICENSE=	apache2

USES=		compiler python:3.6+
USE_PYTHON=	autoplist concurrent distutils

.include <bsd.port.pre.mk>

.if ${CHOSEN_COMPILER_TYPE} == gcc && ${COMPILER_VERSION} <= 42
post-patch:
	@${REINPLACE_CMD} -e '/pragma/d' ${WRKSRC}/c/cbormodule.c
.endif

post-install:
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/cbor/_cbor*.so

.include <bsd.port.post.mk>
