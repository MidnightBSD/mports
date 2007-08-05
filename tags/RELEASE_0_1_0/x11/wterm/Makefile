# New ports collection makefile for:   wterm
# Date created:		25 February 1999
# Whom:		 	Chris Piazza <cpiazza@FreeBSD.org>
#
# $MidnightBSD: mports/x11/wterm/Makefile,v 1.3 2007/03/25 02:52:45 ctriv Exp $
# $FreeBSD: ports/x11/wterm/Makefile,v 1.26 2006/11/30 22:44:28 dougb Exp $
#

PORTNAME=	wterm
PORTVERSION=	6.2.9
PORTREVISION=	2
CATEGORIES=	x11 windowmaker
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	luke@MidnightBSD.org
COMMENT=	A color vt102 terminal emulator with transparency support

BUILD_DEPENDS=	${PREFIX}/lib/libWINGs.a:${PORTSDIR}/x11-wm/windowmaker

USE_XLIB=	yes
USE_XPM=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-transparency --enable-xpm-background \
		--disable-delete-key --disable-backspace-key \
		--enable-next-scrollbar --enable-utmp --enable-wtmp \
		--enable-menubar --enable-graphics --with-term=xterm-color \
		--with-xpm-includes=${X11BASE} --with-xpm-library=${X11BASE} \
		--libdir=${PREFIX}/lib
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include -I${X11BASE}/include/WINGs -L${PREFIX}/lib" LDFLAGS="-L${PREFIX}/lib"

MAN1=		wterm.1
PLIST_FILES=	bin/wterm

post-extract:
	${RM} -f ${WRKSRC}/config.cache
	${RM} -f ${WRKSRC}/src/*.o

post-install:
	@${CHMOD} 4711 ${PREFIX}/bin/wterm

.include <bsd.port.mk>
