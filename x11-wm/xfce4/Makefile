# $MidnightBSD: mports/x11-wm/xfce4/Makefile,v 1.4 2009/12/29 02:15:59 laffer1 Exp $
# $FreeBSD: ports/x11-wm/xfce4/Makefile,v 1.108 2008/06/06 14:17:20 edwin Exp $

PORTNAME=	xfce
PORTVERSION=	${XFCE_VERSION}
PKGNAMESUFFIX=	4
CATEGORIES=	x11-wm xfce
MASTER_SITES=	# empty
DISTFILES=	# empty
EXTRACT_ONLY=	# empty

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The "meta-port" for the XFce 4 desktop environment
LICENSE=	agg

USE_XFCE=	configenv

RUN_DEPENDS=	xfwm4:${PORTSDIR}/x11-wm/xfce4-wm \
		xfce4-appfinder:${PORTSDIR}/misc/xfce4-appfinder \
		xfce4-session:${PORTSDIR}/x11-wm/xfce4-session \
		xfce4-panel:${PORTSDIR}/x11-wm/xfce4-panel \
		xfdesktop:${PORTSDIR}/x11-wm/xfce4-desktop \
		startxfce4:${PORTSDIR}/sysutils/xfce4-utils \
		xfprint4:${PORTSDIR}/print/xfce4-print \
		xfce4-settings-manager:${PORTSDIR}/sysutils/xfce4-settings \
		${LOCALBASE}/lib/gtk-2.0/2.10.0/engines/libxfce.so:${PORTSDIR}/x11-themes/gtk-xfce-engine \
		thunar:${PORTSDIR}/x11-fm/thunar \
		orage:${PORTSDIR}/deskutils/orage \
		mousepad:${PORTSDIR}/editors/mousepad \
		Terminal:${PORTSDIR}/x11/Terminal

NO_BUILD=	yes
LATEST_LINK=	xfce4

.include <bsd.port.pre.mk>

.if exists(${LOCALBASE}/sbin/gdm)
WITH_GDM=	yes
.endif

.if defined(WITH_GDM)
RUN_DEPENDS+=	${LOCALBASE}/sbin/gdm:${PORTSDIR}/x11/gdm
PLIST_SUB+=	GDM=""
.else
PLIST_SUB+=	GDM="@comment "
.endif

.if !defined(WITHOUT_EXTRAS)
.if !defined(WITHOUT_THEMES)
RUN_DEPENDS+=	${LOCALBASE}/share/themes/Xfce/xfwm4/themerc:${PORTSDIR}/misc/xfce4-wm-themes
.endif

.if !defined(WITHOUT_PLUGINS)
RUN_DEPENDS+=	xfce4-mixer:${PORTSDIR}/audio/xfce4-mixer
.endif
.endif

do-install:	# empty

post-install:
.if defined(WITH_GDM)
	${MKDIR} -p ${PREFIX}/etc/gdm/Sessions ${PREFIX}/etc/dm/Sessions
	${INSTALL_SCRIPT} ${FILESDIR}/XFce4 ${PREFIX}/etc/gdm/Sessions
	${SED} -e 's|%%PREFIX%%|${TRUE_PREFIX}|' ${FILESDIR}/XFce4.desktop > ${PREFIX}/etc/dm/Sessions/XFce4.desktop
.endif

.include <bsd.port.post.mk>
