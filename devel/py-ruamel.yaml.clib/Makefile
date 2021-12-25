# Created by: Po-Chuan Hsieh <sunpoet@FreeBSD.org>

PORTNAME=	ruamel.yaml.clib
PORTVERSION=	0.2.6
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C version of reader, parser and emitter for ruamel.yaml

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		python:3.6+
USE_PYTHON=	autoplist concurrent distutils

post-install:
	${FIND} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR} -name '*.so' -exec ${STRIP_CMD} {} +
	${RM} -r ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/ruamel
	${REINPLACE_CMD} -e '/LICENSE/d; /__init__.py/d' ${_PYTHONPKGLIST}

.include <bsd.port.mk>
