PORTNAME=	cbor
PORTVERSION=	0.5.9.8
CATEGORIES=	devel rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for CBOR binary object representation
WWW=		https://cbor.io/

LICENSE=	Apache-2.0

USES=		gem

PIE_UNSAFE=	yes

.include <bsd.mport.options.mk>

.if ${OPSYS} == FreeBSD || ${OPSYS} == MidnightBSD
CONFIGURE_ARGS+=	--with-cflags="-Wno-error=incompatible-function-pointer-types"
.endif

.include <bsd.port.mk>
