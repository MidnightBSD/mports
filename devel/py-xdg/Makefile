PORTNAME=	xdg
PORTVERSION=	0.28
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	py${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python library to access freedesktop.org standards
WWW=		https://freedesktop.org/wiki/Software/pyxdg/

LICENSE=	lgpl

NO_ARCH=	yes
USES=		python
USE_PYTHON=	autoplist distutils

post-patch:
	@${REINPLACE_CMD} -e \
		's|%%LOCALBASE%%|${LOCALBASE}|g' \
			${WRKSRC}/xdg/BaseDirectory.py

.include <bsd.port.mk>
