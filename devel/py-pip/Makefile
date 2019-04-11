# $MidnightBSD$

PORTNAME=	pip
PORTVERSION=	9.0.3
CATEGORIES=	devel python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tool for installing and managing Python packages

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

OPTIONS_DEFINE=	DOCS

DOCS_BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}sphinx>0:textproc/py-sphinx@${PY_FLAVOR}
DOCS_PORTDOCS=	*
DOCS_VARS=	PYDISTUTILS_BUILD_TARGET=build_sphinx \
		PYDISTUTILS_BUILDARGS="-n --all-files --fresh-env"

NO_ARCH=	yes
USES=		python shebangfix
USE_GITHUB=	yes
USE_PYTHON=	autoplist concurrent distutils

SHEBANG_FILES=	pip/__init__.py

GH_ACCOUNT=	pypa

NO_ARCH=	yes
NO_TEST=	yes

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	(cd ${WRKSRC}/build/sphinx/html && \
	${COPYTREE_SHARE} . ${FAKE_DESTDIR}${DOCSDIR} "! -name .buildinfo -and ! -name objects.inv")

.include <bsd.port.mk>
