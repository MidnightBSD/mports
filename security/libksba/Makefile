# $MidnightBSD: mports/security/libksba/Makefile,v 1.8 2009/10/03 04:10:32 laffer1 Exp $

PORTNAME=	libksba
PORTVERSION=	1.0.7
CATEGORIES=	security
MASTER_SITES=	${MASTER_SITE_GNUPG}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KSBA is an X.509 Library
LICENSE=	gpl2

LIB_DEPENDS=	gcrypt.16:${PORTSDIR}/security/libgcrypt \
		gpg-error.0:${PORTSDIR}/security/libgpg-error

USE_BZIP2=	yes
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
USE_GETTEXT=	yes
USE_LDCONFIG=	yes
CONFIGURE_TARGET=
CONFIGURE_ARGS+=--build=${MACHINE_ARCH}-portbld-freebsd6.0
USE_PERL5_BUILD=yes

INFO=	ksba

.include <bsd.port.mk>
