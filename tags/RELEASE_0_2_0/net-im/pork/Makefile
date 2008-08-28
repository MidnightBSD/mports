# New ports collection makefile for:   pork
# Date created:			04 Feb 2003
# Whom:				Bob Bomar <bob@bomar.us>
#
# $MidnightBSD: mports/net-im/pork/Makefile,v 1.1.1.1 2006/09/17 03:33:51 archite Exp $
# $FreeBSD: ports/net-im/pork/Makefile,v 1.16 2005/11/09 07:48:17 pav Exp $
#

PORTNAME=		pork
PORTVERSION=		0.99.8.1
CATEGORIES=		net-im
MASTER_SITES=		${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	ojnk

MAINTAINER=		ports@MidnightBSD.org
COMMENT=		Console-based AIM client

USE_PERL5=		yes
USE_GETOPT_LONG=	yes
USE_OPENSSL=		yes

GNU_CONFIGURE=		yes
CONFIGURE_TARGET=--build=${MACHINE_ARCH}-portbld-freebsd${OSREL}

.include <bsd.port.mk>
