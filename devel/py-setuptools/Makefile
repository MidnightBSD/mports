PORTNAME=	setuptools
PORTVERSION=	63.1.0
PORTREVISION=	3
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DIST_SUBDIR=	python

PATCH_SITES=	https://github.com/pypa/${PORTNAME}/commit/
PATCHFILES=	6653e747c3815b140156249205397ef3719581ee.patch:-p1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python packages installer
WWW=		https://github.com/pypa/setuptools \
		https://pypi.org/project/setuptools/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel044<0.46.0:devel/py-wheel044@${PY_FLAVOR}

USES=		cpe python
USE_PYTHON=	allflavors autoplist concurrent pep517 # pytest to return later

CPE_VENDOR=	python

NO_ARCH=	yes

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 31000
EXTRA_PATCHES+=	${PATCHDIR}/py39
.endif

.include <bsd.port.post.mk>
