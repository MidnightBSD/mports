# New ports collection Makefile for: rxvt
# Date created:         5th December 1994
# Whom:                 gpalmer@FreeBSD.org
#
# $MidnightBSD: mports/x11/rxvt/Makefile,v 1.5 2008/04/04 01:43:47 laffer1 Exp $
# $FreeBSD: ports/x11/rxvt/Makefile,v 1.61 2006/12/09 05:06:13 rafan Exp $
#
# If possible, please consider updating the simple ports/x11-clocks/rclock
# (and maybe ports/chinese/rxvt) when you upgrade rxvt.  These ports all use
# the same distfile.

PORTNAME=	rxvt
PORTVERSION=	2.6.4
PORTREVISION=	5
CATEGORIES+=	x11
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A low memory usage xterm replacement that supports color
LICENSE=	gpl2

OPTIONS=	XIM "XIM (X Input Method) protocol support" On \
		XGETDEFAULT "Enable XGetDefault() resource checking" Off \
		BIG5 "BIG5 Chinese characters support" Off \
		GB "GB Chinese characters support" Off \
		KANJI "Kanji characters support" Off \
		GREEK_KEYBOARD "Greek keyboard support" Off \
		HALF_SHADOW "Use half width/height shadows" Off \
		MENUBAR "Enable menu bar system" Off \
		NEXT_SCROLLBAR "Enable NeXT'ish scrollbars" Off \
		XTERM_SCROLLBAR "Enable Xterm'ish scrollbars" Off \
		CLEARTEXTPASSWD "Use cleartext passwords" Off

USE_XORG=	xpm
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-utmp --enable-wtmp --enable-ttygid \
		--with-xpm --enable-xpm-background --enable-transparency \
		--with-xpm-includes=${LOCALBASE}/include/X11 \
		--with-xpm-library=${LOCALBASE}/lib
MAN1=		rxvt.1
PLIST_FILES=	bin/rxvt

# enable big5 support
.if defined(WITH_BIG5)
CONFIGURE_ARGS+=	--enable-big5
.endif # WITH_BIG5
#
# enable gb support
.if defined(WITH_GB)
CONFIGURE_ARGS+=	--enable-gb
.endif # WITH_GB
#
# enable greek keyboard support
.if defined(WITH_GREEK_KEYBOARD)
CONFIGURE_ARGS+=	--enable-greek
.endif # WITH_GREEK_KEYBOARD
#
# enable half width/height shadows scrollbar
.if defined(WITH_HALF_SHADOW)
CONFIGURE_ARGS+=	--enable-half-shadow
.endif
#
# enable kanji support
.if defined(WITH_KANJI)
CONFIGURE_ARGS+=	--enable-kanji
.endif # WITH_KANJI
#
# enable menubar
.if defined(WITH_MENUBAR)
CONFIGURE_ARGS+=	--enable-menubar
.endif # WITH_MENUBAR
#
# enable NeXT style scrollbar
.if defined(WITH_NEXT_SCROLLBAR)
CONFIGURE_ARGS+=	--enable-next-scroll
.endif
#
# make resources checking via XGetDefault()
.if defined(WITH_XGETDEFAULT)
CONFIGURE_ARGS+=	--enable-xgetdefault
.endif # WITH_XGETDEFAULT
#
# XIM (X Input Method) protocol support
.ifndef(WITHOUT_XIM)
CONFIGURE_ARGS+=	--enable-xim
.endif # WITH_XIM
#
# enable Xterm style scrollbar
.if defined(WITH_XTERM_SCROLLBAR)
CONFIGURE_ARGS+=	--enable-xterm-scroll
.endif # WITH_XTERM_SCROLLBAR
#

post-install:
	@${CHMOD} 4711 ${PREFIX}/bin/rxvt

.include <bsd.port.mk>
