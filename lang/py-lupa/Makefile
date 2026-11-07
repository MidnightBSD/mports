PORTNAME=	lupa
PORTVERSION=	2.8
PORTREVISION=	1
CATEGORIES=	lang python
MASTER_SITES=	PYPI \
		https://github.com/scoder/lupa/releases/download/lupa-${PORTVERSION}/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python wrapper around Lua and LuaJIT
WWW=		https://github.com/scoder/lupa

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

USES=		lua pkgconfig python
USE_PYTHON=	autoplist concurrent cython pep517 unittest

MAKE_ENV+=	LUPA_NO_BUNDLE=true LUPA_WITH_CYTHON=true \
		LUPA_WITH_LUA_CHECKS=true
PEP517_BUILD_CONFIG_SETTING=	-C--global-option=--lua-lib=${LUA_LIBDIR}/liblua-${LUA_VER}.so \
		-C--global-option=--lua-includes=${LUA_INCDIR}
TEST_ARGS=	lupa.tests.test

# Clean up bundled libraries
.if !defined(MAINTAINER_MODE)
EXTRACT_AFTER_ARGS=	--exclude ${DISTNAME}/third-party \
			--no-same-owner --no-same-permissions
.else
post-patch:
	@${RM} -r ${WRKSRC}/third-party/
.endif

post-install:
	${FIND} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR} -name '*.so' -exec ${STRIP_CMD} {} +

# Import the staged extension while loading uninstalled upstream test modules.
do-test:
	cd ${WRKDIR} && ${SETENVI} ${WRK_ENV} ${PYTHON_TEST_ENV} ${TEST_ENV} \
		${PYTHON_CMD} -c 'import sys, unittest, lupa; lupa.__path__.append(sys.argv.pop(1)); unittest.main(module=None)' \
		${WRKSRC}/lupa ${TEST_ARGS:NDESTDIR=*} -v

.include <bsd.port.mk>
