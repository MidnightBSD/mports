PORTNAME=	mkdocs-git-revision-date-localized-plugin
PORTVERSION=	1.6.0
CATEGORIES=	textproc python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	mkdocs_git_revision_date_localized_plugin-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Enable displaying the localized date of the last git modification
WWW=		https://timvink.github.io/mkdocs-git-revision-date-localized-plugin/ \
		https://github.com/timvink/mkdocs-git-revision-date-localized-plugin

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}Babel>=2.7.0:devel/py-babel@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}GitPython>=3.1.59:devel/py-gitpython@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}mkdocs>=1.4<2:textproc/py-mkdocs@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}packaging>=20.0:devel/py-packaging@${PY_FLAVOR}

USES=		python:3.10+ python-setuptools:78
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

.include <bsd.port.mk>
