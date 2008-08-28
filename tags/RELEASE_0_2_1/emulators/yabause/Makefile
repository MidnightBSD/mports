# New ports collection makefile for:	yabause
# Date created:		2006-08-23
# Whom:			Jose Alonso Cardenas Marquez <acm@FreeBSD.org>
#
# $MidnightBSD: mports/emulators/yabause/Makefile,v 1.2 2008/03/24 18:22:08 laffer1 Exp $
# $FreeBSD: ports/emulators/yabause/Makefile,v 1.7 2007/01/16 21:57:13 acm Exp $
#

PORTNAME=	yabause
PORTVERSION=	0.9.2
CATEGORIES=	emulators
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sega Saturn system emulator

LIB_DEPENDS=	gtkglext-x11-1.0.0:${PORTSDIR}/x11-toolkits/gtkglext

GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_SDL=	yes
USE_AUTOTOOLS=	automake:19 aclocal:19 autoconf:261
USE_XLIB=	yes

CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0

SUB_FILES=	pkg-message
MAN1=	yabause.1

post-install:
	@${ECHO_CMD}; ${CAT} ${PKGMESSAGE}; ${ECHO_CMD}

.include <bsd.port.mk>
