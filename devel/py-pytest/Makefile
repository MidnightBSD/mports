PORTNAME=	pytest
PORTVERSION=	3.6.4
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple powerful testing with Python

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools_scm>=0:devel/py-setuptools_scm@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}atomicwrites>=1.0:devel/py-atomicwrites@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}attrs>=17.4.0:devel/py-attrs@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}more-itertools>=4.0.0:devel/py-more-itertools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pluggy>=0.5:devel/py-pluggy@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}py>=1.5.0:devel/py-py@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}six>=1.10.0:devel/py-six@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent distutils

NO_ARCH=	yes
# circular dependencies.
NO_TEST=	yes

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 3000
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}funcsigs>=0:devel/py-funcsigs@${PY_FLAVOR}
.endif

.include <bsd.port.post.mk>
