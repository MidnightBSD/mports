PORTNAME=	cachecontrol
DISTVERSION=	0.14.0
CATEGORIES=	www python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Caching algorithms in httplib2 for use with requests session object
WWW=		https://github.com/psf/cachecontrol

LICENSE=	Apache-2.0

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}flit-core>=3.2<4:devel/py-flit-core@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}msgpack>=0.5.2<2.0.0:devel/py-msgpack@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}requests>=2.16.0:www/py-requests@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cherrypy>0:www/py-cherrypy@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}mock>0:devel/py-mock@${PY_FLAVOR}

USES=		python
USE_PYTHON=	pep517 autoplist concurrent pytest # 24 tests fail, see https://github.com/psf/cachecontrol/issues/331
NO_ARCH=	yes

CONFLICTS_INSTALL=	py*-cachecontrol # bin/doesitcache

OPTIONS_DEFINE=		FILECACHE REDIS
OPTIONS_DEFAULT=	FILECACHE
FILECACHE_DESC=		FileCache support
REDIS_DESC=		Redis support

FILECACHE_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}filelock>=3.7.1:sysutils/py-filelock@${PY_FLAVOR}
REDIS_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}redis>=2.10.5:databases/py-redis@${PY_FLAVOR}

.include <bsd.port.mk>
