# New ports collection Makefile for:	libksba
# Date created:				July 17 2002
# Whom:					Tilman Linneweh <arved@FreeBSD.org>
#
# $FreeBSD: ports/security/libksba/Makefile,v 1.32 2007/01/08 10:01:15 lofi Exp $
# $MidnightBSD: mports/security/libksba/Makefile,v 1.3 2007/12/30 02:06:36 laffer1 Exp $
#

PORTNAME=	libksba
PORTVERSION=	1.0.1
CATEGORIES=	security
MASTER_SITES=	${MASTER_SITE_GNUPG}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KSBA is an X.509 Library
LICENSE=	gpl2

LIB_DEPENDS=	gcrypt.15:${PORTSDIR}/security/libgcrypt \
		gpg-error.0:${PORTSDIR}/security/libgpg-error

USE_BZIP2=	yes
GNU_CONFIGURE=	yes
INSTALLS_SHLIB=	yes
USE_GETTEXT=	yes
USE_LDCONFIG=	yes
CONFIGURE_TARGET=
CONFIGURE_ARGS+=--build=${MACHINE_ARCH}-portbld-freebsd6.0
USE_PERL5_BUILD=yes

INFO=	ksba

.include <bsd.port.mk>
