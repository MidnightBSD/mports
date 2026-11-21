PORTNAME=	dash-bootstrap-components
DISTVERSION=	2.0.4
CATEGORIES=	www python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME:S/-/_/g}-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Bootstrap themed components for use in Plotly Dash
WWW=		https://www.dash-bootstrap-components.com/ \
		https://github.com/dbc-team/dash-bootstrap-components

LICENSE=	Apache-2.0

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hatchling>0:devel/py-hatchling@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}dash>=3.0.4:www/py-dash@${PY_FLAVOR}

USES=		python:3.9+
USE_PYTHON=	pep517 autoplist

NO_ARCH=	yes

post-install:
	${RM} -rf ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/examples
	${RM} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/LICENSE
	${RM} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/NOTICE.txt
	${RM} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/README.md
	${RM} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/pyproject.toml
	@${REINPLACE_CMD} -e '/site-packages\/examples\//d' \
		-e '/site-packages\/LICENSE$$/d' \
		-e '/site-packages\/NOTICE\.txt$$/d' \
		-e '/site-packages\/README\.md$$/d' \
		-e '/site-packages\/pyproject\.toml$$/d' \
		${_PYTHONPKGLIST}

.include <bsd.port.mk>
