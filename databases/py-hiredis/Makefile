PORTNAME=	hiredis
PORTVERSION=	2.0.0
CATEGORIES=	databases python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python extension that wraps hiredis
WWW=		https://github.com/pietern/hiredis-py

LICENSE=	bsd3

LIB_DEPENDS=	libhiredis.so:databases/hiredis

USES=		python
USE_PYTHON=	distutils autoplist

post-patch:
	@${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|' ${WRKSRC}/${PYSETUP}

.include <bsd.port.mk>
