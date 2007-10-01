# New ports collection makefile for:	mcrypt
# Date created:		Mon Jun 28 18:02:04 PDT 1999
# Whom:			nsayer@freebsd.org
#
# $FreeBSD: ports/security/libmcrypt/Makefile,v 1.54 2006/08/15 01:04:50 clsung Exp $
# $MidnightBSD$
#

PORTNAME=	libmcrypt
PORTVERSION=	2.5.7
PORTREVISION=	2
CATEGORIES=	security
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME:S/lib//}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Multi-cipher cryptographic library (used in PHP)

GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0
CONFIGURE_ARGS=	--enable-static
USE_LDCONFIG=	yes

MAN3=		mcrypt.3

.include <bsd.port.mk>
