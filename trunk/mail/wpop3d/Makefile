# Ports collection makefile for: wpop3d
# Date created:   3 September 2006
# Whom:           wintellect
#
# $MidnightBSD: mports/mail/wpop3d/Makefile,v 1.1 2006/09/25 13:28:52 laffer1 Exp $
#

PORTNAME=	wpop3d
PORTVERSION=	1.2
CATEGORIES=	mail
MASTER_SITES=	http://www.bsdnexus.com/wpop3d/
DISTNAME=	wpop3d-1.2

MAINTAINER=	wintellect@bsdnexus.com
COMMENT=	A pop3 server for retrieval of remote mail on a UNIX system

GNU_CONFIGURE=	yes
CONFIGURE_TARGET=-build=${MACHINE_ARCH}-portbld-freebsd6.0
MAN1=		wpop3d.1

PLIST_FILES=	sbin/wpop3d

.include <bsd.port.mk>

