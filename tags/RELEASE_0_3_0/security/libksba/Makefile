# $MidnightBSD: mports/security/libksba/Makefile,v 1.9 2009/10/16 22:55:58 laffer1 Exp $

PORTNAME=	libksba
PORTVERSION=	1.0.8
CATEGORIES=	security
MASTER_SITES=	${MASTER_SITE_GNUPG}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KSBA is an X.509 Library
LICENSE=	gpl2

LIB_DEPENDS=	gpg-error.0:${PORTSDIR}/security/libgpg-error

USE_BZIP2=	yes
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
USE_LDCONFIG=	yes
CONFIGURE_TARGET=
CONFIGURE_ARGS+=--enable-static
CONFIGURE_ARGS+=--build=${MACHINE_ARCH}-portbld-freebsd7.0
USE_PERL5_BUILD=yes

INFO=	ksba

.include <bsd.port.mk>
