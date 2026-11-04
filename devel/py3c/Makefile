PORTNAME=	py3c
PORTVERSION=	1.4
DISTVERSIONPREFIX=	v
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Py3c helps you port C extensions to Python 3
WWW=		https://github.com/encukou/py3c

LICENSE=	mit

USES=		gmake

USE_GITHUB=	yes
GH_ACCOUNT=	encukou

NO_BUILD=	yes

do-install:
	${SETENVI} ${WRK_ENV} ${MAKE_CMD} \
	 prefix=${TRUE_PREFIX}                         \
	 pkgconfigdir=${TRUE_PREFIX}/libdata/pkgconfig \
	 DESTDIR=${FAKE_DESTDIR}                      \
	 -C ${WRKSRC}                             \
	 install

.include <bsd.port.mk>
