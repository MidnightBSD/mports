PORTNAME=	txaio
PORTVERSION=	22.2.1
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Compatibility API between asyncio/Twisted/Trollius
WWW=		https://github.com/crossbario/txaio

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		python
USE_PYTHON=	autoplist distutils

OPTIONS_DEFINE=		TWISTED
OPTIONS_DEFAULT=	TWISTED

TWISTED_DESC=	Twisted network backend support

TWISTED_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}twisted>=20.3.0:devel/py-twisted@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}zope.interface>=5.2.0:devel/py-zope.interface@${PY_FLAVOR}

NO_TEST=	yes

.include <bsd.port.mk>
