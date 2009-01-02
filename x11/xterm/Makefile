# New ports collection makefile for:	xterm
# Date created:				24.07.2004
# Whom:					krion
#
# $FreeBSD: ports/x11/xterm/Makefile,v 1.50 2007/09/05 12:11:37 krion Exp $
# $MidnightBSD: mports/x11/xterm/Makefile,v 1.9 2008/05/14 18:22:05 crash Exp $
#

PORTNAME=	xterm
PORTVERSION=	237
CATEGORIES=	x11
MASTER_SITES=	ftp://invisible-island.net/xterm/ \
		http://voodoo.bawue.com/download/
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Terminal emulator for the X Window System
LICENSE=	x11

USE_XORG=	xaw xft
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=--build=${MACHINE_ARCH}-portbld-freebsd6.0
CONFIGURE_ENV=	CPPFLAGS="-I${X11BASE}/include" \
		LIBS="-L${X11BASE}/lib"
CONFIGURE_ARGS+=--enable-wide-chars --enable-luit --with-utempter \
		--enable-narrowproto
MAN1=		resize.1 koi8rxterm.1 uxterm.1 xterm.1

OPTIONS=	256_COLOR "Enable 256 Color Support." Off

.include <bsd.port.pre.mk>

.if defined(WITH_256_COLOR)
CONFIGURE_ARGS+=	--enable-256-color
.endif

post-install:
	@${CHMOD} 4711 ${PREFIX}/bin/xterm

.include <bsd.port.post.mk>
