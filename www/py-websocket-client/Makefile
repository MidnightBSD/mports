PORTNAME=	websocket-client
PORTVERSION=	1.4.2
CATEGORIES=	www python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Websocket client for python
WWW=		https://github.com/websocket-client/websocket-client

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		python
USE_PYTHON=	autoplist distutils

NO_ARCH=	yes
NO_TEST=	yes

OPTIONS_DEFINE=		OPTIONAL
OPTIONS_DEFAULT=	OPTIONAL
OPTIONAL_DESC=		SOCKS proxy support and performance boost

OPTIONAL_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}python-socks>0:net/py-python-socks@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}wsaccel>0:www/py-wsaccel@${PY_FLAVOR}

.include <bsd.mport.options.mk>

.include <bsd.port.mk>
