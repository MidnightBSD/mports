PORTNAME=	yarl
PORTVERSION=	1.9.2
CATEGORIES=	www python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Yet another URL library
WWW=		https://github.com/aio-libs/yarl

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}multidict>=4.0:www/py-multidict@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}idna>=2.0:dns/py-idna@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist distutils cython

NO_TEST=	yes

pre-configure:
	@rm ${WRKSRC}/yarl/_quoting_c.c
	@cd ${WRKSRC}/yarl && ${PYTHON_CMD} -m cython -3 -o _quoting_c.c _quoting_c.pyx

post-install:
	@${STRIP_CMD} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/yarl/_quoting_c*.so

.include <bsd.port.mk>
