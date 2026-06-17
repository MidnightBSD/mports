PORTNAME=	hatchling
PORTVERSION=	1.27.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Modern, extensible Python build backend
WWW=		https://github.com/pypa/hatch/tree/master/backend

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}packaging>=24.2:devel/py-packaging@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pathspec>=0.10.1:devel/py-pathspec@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pluggy>=1.0.0:devel/py-pluggy@${PY_FLAVOR} \
		${PY_TOMLI} \
		${PYTHON_PKGNAMEPREFIX}trove-classifiers>=0:devel/py-trove-classifiers@${PY_FLAVOR}

USES=		python
USE_PYTHON=	allflavors autoplist concurrent pep517

NO_ARCH=	yes

fake-post-install:
	@if [ ! -e ${FAKE_DESTDIR}${PREFIX}/bin/hatchling ] && \
		[ -e ${FAKE_DESTDIR}${PREFIX}/bin/hatchling-${PYTHON_DEFAULT} ]; then \
		${MV} ${FAKE_DESTDIR}${PREFIX}/bin/hatchling-${PYTHON_DEFAULT} \
			${FAKE_DESTDIR}${PREFIX}/bin/hatchling; \
	fi

.include <bsd.port.mk>
