# Ports collection makefile for: wpop3d
# Date created:   3 September 2006
# Whom:           wintellect
#
# $MidnightBSD: mports/mail/wpop3d/Makefile,v 1.3 2007/11/08 02:57:52 laffer1 Exp $
#

PORTNAME=	wpop3d
PORTVERSION=	1.2
PORTREVISION=	1
CATEGORIES=	mail
MASTER_SITES=	${MASTER_SITE_LOCAL}

MAINTAINER=	wintellect@bsdnexus.com
COMMENT=	A pop3 server for retrieval of remote mail on a UNIX system
LICENSE=	bsd2

GNU_CONFIGURE=	yes
CONFIGURE_TARGET=-build=${MACHINE_ARCH}-portbld-freebsd6.0
MAN1=		wpop3d.1

PLIST_FILES=	sbin/wpop3d

.include <bsd.port.mk>
