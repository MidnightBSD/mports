# $MidnightBSD: mports/security/libksba/Makefile,v 1.11 2011/04/17 19:40:09 laffer1 Exp $

PORTNAME=	libksba
PORTVERSION=	1.2.0
CATEGORIES=	security
MASTER_SITES=	${MASTER_SITE_GNUPG}
MASTER_SITE_SUBDIR=	${PORTNAME}
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} ${DISTNAME}${EXTRACT_SUFX}.sig
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KSBA is an X.509 Library
LICENSE=	gpl2

LIB_DEPENDS=	gpg-error.0:${PORTSDIR}/security/libgpg-error

USE_BZIP2=	yes
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS+=--enable-static
CONFIGURE_TARGET=	${MACHINE_ARCH}-portbld-freebsd7.0
USE_PERL5_BUILD=yes

INFO=	ksba

.include <bsd.port.mk>
