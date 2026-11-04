PORTNAME=	trove-classifiers
PORTVERSION=	2025.12.1.14
PORTREVISION=	1
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	trove_classifiers-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Canonical source for classifiers on PyPI
WWW=		https://github.com/pypa/trove-classifiers

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}calver>=0:devel/py-calver@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

USES=		python
USE_PYTHON=	allflavors autoplist concurrent pep517

NO_ARCH=	yes

fake-post-install:
	@if [ ! -e ${FAKE_DESTDIR}${PREFIX}/bin/trove-classifiers ] && \
		[ -e ${FAKE_DESTDIR}${PREFIX}/bin/trove-classifiers-${PYTHON_DEFAULT} ]; then \
		${MV} ${FAKE_DESTDIR}${PREFIX}/bin/trove-classifiers-${PYTHON_DEFAULT} \
			${FAKE_DESTDIR}${PREFIX}/bin/trove-classifiers; \
	fi

.include <bsd.port.mk>
