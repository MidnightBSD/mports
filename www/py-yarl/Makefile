PORTNAME=	yarl
PORTVERSION=	1.4.2
CATEGORIES=	www python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Yet another URL library

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}multidict>=4.0:www/py-multidict@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}idna>=2.0:dns/py-idna@${PY_FLAVOR}

USES=		python:3.5+
USE_PYTHON=	autoplist distutils cython
NO_TEST=	yes

post-install:
	@${STRIP_CMD} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/yarl/_quoting.so

.include <bsd.port.mk>
