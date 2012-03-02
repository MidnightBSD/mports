# New ports collection makefile for:	gnome2-lite
# Date created:		Sun Nov  4 11:17:58 EST 2007
# Whom:			Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD: mports/x11/gnome2-lite/Makefile,v 1.7 2010/08/14 04:40:30 laffer1 Exp $
#

PORTREVISION=	1
CATEGORIES=	x11 gnome
PKGNAMESUFFIX=	-lite

COMMENT=	The "meta-port" of the GNOME desktop (trimmed)

RUN_DEPENDS=	${LOCALBASE}/libexec/gweather-applet-2:${PORTSDIR}/x11/gnome-applets \
    		gnome-audio-profiles-properties:${PORTSDIR}/audio/gnome-media \
	 	gnome-dictionary:${PORTSDIR}/deskutils/gnome-utils \
		eog:${PORTSDIR}/graphics/eog \
		gedit:${PORTSDIR}/editors/gedit \
		gnome-terminal:${PORTSDIR}/x11/gnome-terminal \
		gnome-session:${PORTSDIR}/x11/gnome-session \
		gnome-system-monitor:${PORTSDIR}/sysutils/gnome-system-monitor \
		nautilus:${PORTSDIR}/x11-fm/nautilus \
		${LOCALBASE}/share/gnome/help/user-guide/C/user-guide.xml:${PORTSDIR}/misc/gnome-user-docs \
		${LOCALBASE}/share/sounds/question.wav:${PORTSDIR}/audio/gnome-audio \
		${LOCALBASE}/share/themes/HighContrast/gtk-2.0/gtkrc:${PORTSDIR}/x11-themes/gnome-themes \
		evince:${PORTSDIR}/graphics/evince \
		gcalctool:${PORTSDIR}/math/gcalctool \
		${LOCALBASE}/lib/X11/fonts/bitstream-vera/Vera.ttf:${PORTSDIR}/x11-fonts/bitstream-vera \
		gconf-editor:${PORTSDIR}/sysutils/gconf-editor \
		gnome-control-center:${PORTSDIR}/sysutils/gnome-control-center \
    		gnome-mount:${PORTSDIR}/sysutils/gnome-mount

MASTERDIR=	${.CURDIR}/../gnome2
CONFLICTS=	gnome2-[0-9]*

DESCR=		${.CURDIR}/pkg-descr
PKGMESSAGE=	${.CURDIR}/pkg-message

.include "${MASTERDIR}/Makefile"
