PORTNAME=	sphinxcontrib-serializinghtml
PORTVERSION=	2.0.0
CATEGORIES=	textproc
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	sphinxcontrib_serializinghtml-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sphinx extension which outputs serialized HTML files (json and pickle)
WWW=		https://www.sphinx-doc.org/en/master/ \
		https://github.com/sphinx-doc/sphinxcontrib-serializinghtml

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENCE.rst

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}flit-core>=3.7:devel/py-flit-core@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
