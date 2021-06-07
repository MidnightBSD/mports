PORTNAME=	astroid
PORTVERSION=	2.5.6
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Abstract syntax tree for Python with inference support

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING.LESSER

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}lazy-object-proxy>=1.4.0:devel/py-lazy-object-proxy@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wrapt>=1.11<1.13:devel/py-wrapt@${PY_FLAVOR}

USES=		python:3.7+
USE_PYTHON=	autoplist concurrent distutils

NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 30800
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}typed-ast>=1.4.0<1.5:devel/py-typed-ast@${PY_FLAVOR}
.endif

.include <bsd.port.post.mk>
