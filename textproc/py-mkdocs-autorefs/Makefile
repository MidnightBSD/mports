PORTNAME=	mkdocs-autorefs
DISTVERSION=	1.2.0
CATEGORIES=	textproc python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	mkdocs_autorefs-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Automatically link across pages in MkDocs
WWW=		https://github.com/mkdocstrings/autorefs

LICENSE=	iscl
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pdm-backend>0:devel/py-pdm-backend@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}markdown>=3.3:textproc/py-markdown@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}markupsafe>=2.0.1:textproc/py-markupsafe@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}mkdocs>=1.1:textproc/py-mkdocs@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist pep517

NO_ARCH=	yes

.include <bsd.port.mk>
