# $MidnightBSD: mports/security/libmcrypt/Makefile,v 1.4 2009/09/20 02:07:17 laffer1 Exp $

PORTNAME=	libmcrypt
PORTVERSION=	2.5.8
CATEGORIES=	security
MASTER_SITES=	SF/mcrypt/Libmcrypt/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Multi-cipher cryptographic library (used in PHP)
LICENSE=	lgpl

GNU_CONFIGURE=	yes
USE_AUTOTOOLS=	libtool:22
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0
CONFIGURE_ARGS=	--enable-static
USE_LDCONFIG=	yes
MAKE_JOBS_SAFE=	yes

MAN3=		mcrypt.3

.include <bsd.port.mk>
