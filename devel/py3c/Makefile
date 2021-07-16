# Created by: lev@FreeBSD.org

PORTNAME=	py3c
PORTVERSION=	1.3
DISTVERSIONPREFIX=	v
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Py3c helps you port C extensions to Python 3

LICENSE=	mit

USES=		gmake

USE_GITHUB=	yes
GH_ACCOUNT=	encukou

NO_BUILD=	yes

do-install:
	@${MAKE_CMD}                              \
	 prefix=${TRUE_PREFIX}                         \
	 pkgconfigdir=${TRUE_PREFIX}/libdata/pkgconfig \
	 DESTDIR=${FAKE_DESTDIR}                      \
	 -C ${WRKSRC}                             \
	 install

.include <bsd.port.mk>
