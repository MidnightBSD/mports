PORTNAME=	pycompilation
DISTVERSION=	0.4.12
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Package for compilation (meta programming)

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYNUMPY} \
		${PYTHON_PKGNAMEPREFIX}appdirs>0:devel/py-appdirs@${PY_FLAVOR}

USES=		python
USE_PYTHON=	distutils cython_run autoplist

NO_ARCH=	yes

.include <bsd.port.mk>
