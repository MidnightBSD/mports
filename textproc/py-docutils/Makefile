PORTNAME=	docutils
PORTVERSION=	0.22.4
PORTEPOCH=	1
CATEGORIES=	textproc python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python Documentation Utilities
WWW=		https://docutils.sourceforge.io/

LICENSE=	bsd2 bsd3 gpl3+ publicdom
LICENSE_COMB=	multi
LICENSE_FILE_bsd2=	${WRKSRC}/licenses/BSD-2-Clause.rst
LICENSE_FILE_bsd3=	${WRKSRC}/docutils/utils/smartquotes.py
LICENSE_FILE_gpl3+ =	${WRKSRC}/licenses/gpl-3-0.txt
LICENSE_FILE_publicdom=	${WRKSRC}/COPYING.rst

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}flit-core>=3.11<4:devel/py-flit-core@${PY_FLAVOR}

USES=		python:3.9+ shebangfix
USE_PYTHON=	autoplist concurrent pep517

SHEBANG_FILES=	docutils/writers/odf_odt/prepstyles.py \
		docutils/__main__.py \
		docutils/utils/smartquotes.py \
		docutils/utils/math/math2html.py

NO_ARCH=	yes

PORTSCOUT=	limit:^[0-9\.]*$$

OPTIONS_DEFINE=	PYGMENTS
PYGMENTS_DESC=	Syntax highlighting

PYGMENTS_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pygments>=0:textproc/py-pygments@${PY_FLAVOR}

do-test:
	cd ${WRKSRC} && ${PYTHON_CMD} test/alltests.py --verbose

.include <bsd.port.mk>
