PORTNAME=	wheel
PORTVERSION=	0.48.0
CATEGORIES=	devel
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Built-package format for Python
WWW=		https://github.com/pypa/wheel

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}flit-core>=3.8:devel/py-flit-core@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}packaging>=24.0:devel/py-packaging@${PY_FLAVOR}

USES=		python
USES+=	cpe
CPE_VENDOR=	wheel_project
USE_PYTHON=	allflavors autoplist concurrent pep517
USE_PYTHON+=	pytest

EXTRACT_CMD=	${SETENV} LC_ALL=en_US.UTF-8 /usr/bin/bsdtar
NO_ARCH=	yes

fake-post-install:
	@if [ ! -e ${FAKE_DESTDIR}${PREFIX}/bin/wheel ] && \
		[ -e ${FAKE_DESTDIR}${PREFIX}/bin/wheel-${PYTHON_DEFAULT} ]; then \
		${MV} ${FAKE_DESTDIR}${PREFIX}/bin/wheel-${PYTHON_DEFAULT} \
			${FAKE_DESTDIR}${PREFIX}/bin/wheel; \
	fi

.include <bsd.port.mk>
