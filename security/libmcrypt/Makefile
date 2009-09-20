# $MidnightBSD: mports/security/libmcrypt/Makefile,v 1.3 2009/05/01 14:36:06 laffer1 Exp $

PORTNAME=	libmcrypt
PORTVERSION=	2.5.8
CATEGORIES=	security
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME:S/lib//}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Multi-cipher cryptographic library (used in PHP)
LICENSE=	lgpl

GNU_CONFIGURE=	yes
USE_AUTOTOOLS=	libtool:22
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0
CONFIGURE_ARGS=	--enable-static
USE_LDCONFIG=	yes

MAN3=		mcrypt.3

.include <bsd.port.mk>
