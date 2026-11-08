PORTNAME=	pygments
DISTVERSION=	2.21.0
CATEGORIES=	textproc python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Syntax highlighter written in Python
WWW=		https://pygments.org/

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hatchling>=1.27:devel/py-hatchling@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest>=8.2,1:devel/py-pytest@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-cov>=0:devel/py-pytest-cov@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-randomly>=0:devel/py-pytest-randomly@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wcag-contrast-ratio>=0.9:www/py-wcag-contrast-ratio@${PY_FLAVOR}

USES=		cpe python:3.9+
USE_PYTHON=	allflavors autoplist concurrent pep517 pytest

CONFLICTS_INSTALL=	py??-pygments-25

NO_ARCH=	yes

_USES_fake+=	774:fix-pygments-script

fix-pygments-script:
	@if [ "${PYTHON_VER}" != "${PYTHON_DEFAULT}" ] && \
		[ -e ${FAKE_DESTDIR}${PREFIX}/bin/pygmentize-${PYTHON_DEFAULT} ]; then \
		${MV} ${FAKE_DESTDIR}${PREFIX}/bin/pygmentize-${PYTHON_DEFAULT} \
			${FAKE_DESTDIR}${PREFIX}/bin/pygmentize; \
	fi

.include <bsd.port.mk>
