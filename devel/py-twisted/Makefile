PORTNAME=	twisted
PORTVERSION=	17.9.0
CATEGORIES=	devel net python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	Twisted-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Asynchronous networking framework written in Python

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}constantly>=15.1:devel/py-constantly@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}hyperlink>=17.1.1:www/py-hyperlink@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}incremental>=16.10.1:devel/py-incremental@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}zope.interface>=3.6.0:devel/py-zope.interface@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}Automat>=0.3.0:devel/py-Automat@${PY_FLAVOR}
RUN_DEPENDS:=	${BUILD_DEPENDS}

USES=		python tar:bzip2
USE_PYTHON=	autoplist concurrent distutils

NO_TEST=yes

post-install:
	${FIND} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/ -name '*.so' -exec ${STRIP_CMD} {} +

.include <bsd.port.mk>
