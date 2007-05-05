# New ports collection makefile for:	yabause
# Date created:		2006-08-23
# Whom:			Jose Alonso Cardenas Marquez <acm@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/emulators/yabause/Makefile,v 1.7 2007/01/16 21:57:13 acm Exp $
#

PORTNAME=	yabause
PORTVERSION=	0.8.0
PORTREVISION=	1
CATEGORIES=	emulators
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sega Saturn system emulator

LIB_DEPENDS=	gtkglext-x11-1.0.0:${PORTSDIR}/x11-toolkits/gtkglext

GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_SDL=	yes
USE_GCC=	3.4+
USE_AUTOTOOLS=	automake:19 aclocal:19 autoconf:259
USE_XLIB=	yes

CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0
WRKSRC=	${WRKDIR}/${PORTNAME}

SUB_FILES=	pkg-message
MAN1=	yabause.1

post-install:
	@${ECHO_CMD}; ${CAT} ${PKGMESSAGE}; ${ECHO_CMD}

.include <bsd.port.mk>
