PORTNAME=	libdnet
PORTVERSION=	1.13
DISTVERSIONPREFIX=	v
CATEGORIES?=	net

MAINTAINER?=	ports@MidnightBSD.org
COMMENT=	Simple interface to low level networking routines

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

USES?=		autoreconf libtool

USE_GITHUB=	yes
GH_ACCOUNT=	5u623l20

GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--without-check

.if !defined(LIBDNET_SLAVE)
CONFIGURE_ARGS+=	--without-python
USE_LDCONFIG=	yes
.endif

.include <bsd.port.mk>
