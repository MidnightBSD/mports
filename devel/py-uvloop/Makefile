PORTNAME=	uvloop
PORTVERSION=	0.23.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast drop-in replacement of asyncio event loop based on libuv
WWW=		https://github.com/MagicStack/uvloop

LICENSE=	Apache-2.0 mit
LICENSE_COMB=	dual
LICENSE_FILE_Apache-2.0=	${WRKSRC}/LICENSE-APACHE
LICENSE_FILE_mit=	${WRKSRC}/LICENSE-MIT

USES=		python
USE_PYTHON=	autoplist concurrent cython pep517

# MidnightBSD uses the FreeBSD 13 kernel interfaces in bundled libuv.
MAKE_ENV+=	LIBUV_CONFIGURE_HOST=${ARCH}-portbld-freebsd13.0

OPTIONS_DEFINE=	DOCS EXAMPLES

PORTDOCS=	*
PORTEXAMPLES=	*

post-install:
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/uvloop/loop*.so

post-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}/
	cd ${WRKSRC}/ && ${INSTALL_DATA} PKG-INFO README.rst ${FAKE_DESTDIR}${DOCSDIR}/
	cd ${WRKSRC}/docs &&  ${COPYTREE_SHARE} . ${FAKE_DESTDIR}${DOCSDIR}/

post-install-EXAMPLES-on:
	${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}/
	cd ${WRKSRC}/examples/ && ${COPYTREE_SHARE} . ${FAKE_DESTDIR}${EXAMPLESDIR}/

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}packaging>=20:devel/py-packaging@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}cython>=3.2.4<4:lang/cython@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools>=60:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

.include <bsd.port.mk>
