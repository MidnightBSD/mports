PORTNAME=	asgiref
PORTVERSION=	3.7.2
PORTREVISION=	1
CATEGORIES=	www python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ASGI specs, helper code, and adapters
WWW=		https://github.com/django/asgiref/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		python
USE_PYTHON=	distutils autoplist

NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 31100
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}typing-extensions>=4:devel/py-typing-extensions@${PY_FLAVOR}
.endif

.include <bsd.port.post.mk>
