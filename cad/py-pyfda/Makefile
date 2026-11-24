PORTNAME=	pyfda
DISTVERSION=	0.9.5
CATEGORIES=	cad python devel
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GUI tool for designing and analysing discrete time filters
WWW=		https://github.com/chipmuenk/pyFDA

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.md

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}amaranth>0:cad/py-amaranth@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}docutils>0:textproc/py-docutils@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}markdown>0:textproc/py-markdown@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}matplotlib>=3.3:math/py-matplotlib@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}mplcursors>0:math/py-mplcursors@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}numexpr>=2.8.8:math/py-numexpr@${PY_FLAVOR} \
		${PYNUMPY} \
		${PYTHON_PKGNAMEPREFIX}scipy>=1.2.0:science/py-scipy@${PY_FLAVOR} \
		yosys:cad/yosys

USES=		python pyqt:5
USE_PYTHON=	distutils autoplist
USE_PYQT=	pyqt5:run

NO_ARCH=	yes

post-patch:
	@${REINPLACE_CMD} -e "s|find_namespace_packages()|find_namespace_packages(include=['pyfda', 'pyfda.*'])|" ${WRKSRC}/setup.py

.include <bsd.port.mk>
