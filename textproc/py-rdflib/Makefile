PORTNAME=	rdflib
PORTVERSION=	6.2.0
CATEGORIES=	textproc python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python library for RDF manipulation
WWW=		https://pypi.org/project/rdflib/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}isodate>=0:devel/py-isodate@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyparsing>=0:devel/py-pyparsing@${PY_FLAVOR}

USES=		cpe python:3.7+
USE_PYTHON=	autoplist concurrent distutils pytest

NO_ARCH=	yes
NO_TEST=	yes

CPE_VENDOR=	rdflib_project

OPTIONS_DEFINE=	HTML
OPTIONS_DEFAULT=HTML
HTML_DESC=	HTML support

HTML_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}html5lib>=0:www/py-html5lib@${PY_FLAVOR}

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 30800
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}importlib-metadata>=0:devel/py-importlib-metadata@${PY_FLAVOR}
.endif

.include <bsd.port.post.mk>
