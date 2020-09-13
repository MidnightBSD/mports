# Created by: Waitman Gobble <waitman@waitman.net>

PORTNAME=	aiodns
PORTVERSION=	1.1.1
PORTREVISION=	1
CATEGORIES=	dns python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple DNS resolver for asyncio

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pycares>0:dns/py-pycares@${PY_FLAVOR}

USES=		python:3.5+
USE_PYTHON=	autoplist concurrent distutils
NO_ARCH=	yes

PORTDOCS=	README.rst

OPTIONS_DEFINE=	DOCS

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README.rst ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
