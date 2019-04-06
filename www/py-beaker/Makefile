PORTNAME=	beaker
PORTVERSION=	1.10.1
CATEGORIES=	www python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	Beaker-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Session and Caching library with WSGI Middleware

LICENSE=	bsd3

USES=		python
USE_PYTHON=	autoplist distutils
NO_ARCH=	yes

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} <= 3200
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}funcsigs>=1.0.2:devel/py-funcsigs@${PY_FLAVOR}
.endif

.include <bsd.port.post.mk>
