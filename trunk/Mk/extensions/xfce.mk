# $MidnightBSD: mports/Mk/extensions/xfce.mk,v 1.5 2009/03/12 05:23:35 ctriv Exp $
#

.if !defined(_POSTMKINCLUDED) && !defined(Xfce_Pre_Include)

Xfce_Pre_Include=		xfce.mk
Xfce_Include_MAINTAINER=	ports@MidnightBSD.org

XFCE_VERSION=	4.6.0

# This file contains some variable definitions that are supposed to
# make your life easier when dealing with ports related to the Xfce
# desktop environment. It's automatically included when USE_XFCE
# is defined in the ports' makefile.

_USE_XFCE_ALL=			configenv libexo libgui libutil panel \
						thunar wm xfdev xfconf libmenu

MASTER_SITE_SUBDIR?=		xfce-${XFCE_VERSION}

configenv_CONFIGURE_ENV=	CPPFLAGS="${CPPFLAGS} -I${LOCALBASE}/include -L${LOCALBASE}/lib"

libexo_BUILD_DEPENDS=		libexo>=0.3.4:${PORTSDIR}/x11/libexo
libexo_RUN_DEPENDS=		libexo>=0.3.4:${PORTSDIR}/x11/libexo

libgui_BUILD_DEPENDS=		libxfce4gui>=${XFCE_VERSION}:${PORTSDIR}/x11-toolkits/libxfce4gui
libgui_RUN_DEPENDS=		libxfce4gui>=${XFCE_VERSION}:${PORTSDIR}/x11-toolkits/libxfce4gui

libutil_BUILD_DEPENDS=		libxfce4util>=${XFCE_VERSION}:${PORTSDIR}/x11/libxfce4util
libutil_RUN_DEPENDS=		libxfce4util>=${XFCE_VERSION}:${PORTSDIR}/x11/libxfce4util

panel_BUILD_DEPENDS=		xfce4-panel>=${XFCE_VERSION}:${PORTSDIR}/x11-wm/xfce4-panel
panel_RUN_DEPENDS=		xfce4-panel>=${XFCE_VERSION}:${PORTSDIR}/x11-wm/xfce4-panel

thunar_BUILD_DEPENDS=		Thunar>=1.0.0:${PORTSDIR}/x11-fm/thunar
thunar_RUN_DEPENDS=		Thunar>=1.0.0:${PORTSDIR}/x11-fm/thunar

wm_BUILD_DEPENDS=		xfce4-wm>=${XFCE_VERSION}:${PORTSDIR}/x11-wm/xfce4-wm
wm_RUN_DEPENDS=			xfce4-wm>=${XFCE_VERSION}:${PORTSDIR}/x11-wm/xfce4-wm

xfdev_RUN_DEPENDS=		xfce4-dev-tools:${PORTSDIR}/devel/xfce4-dev-tools

xfconf_BUILD_DEPENDS=	xfconf4>=${XFCE_VERSION}:${PORTSDIR}/sysutils/xfconf4 
xfconf_RUN_DEPENDS=		xfconf4>=${XFCE_VERSION}:${PORTSDIR}/sysutils/xfconf4 

libmenu_BUILD_DEPENDS=	libxfce4menu>=${XFCE_VERSION}:${PORTSDIR}/x11-toolkits/libxfce4menu
libmenu_BUN_DEPENDS=	libxfce4menu>=${XFCE_VERSION}:${PORTSDIR}/x11-toolkits/libxfce4menu


.endif

.if defined(_POSTMKINCLUDED) && !defined(Xfce_Post_Include)

Xfce_Post_Include=		xfce.mk

.for component in ${USE_XFCE}
BUILD_DEPENDS+=	${${component}_BUILD_DEPENDS}
LIB_DEPENDS+=	${${component}_LIB_DEPENDS}
RUN_DEPENDS+=	${${component}_RUN_DEPENDS}
CONFIGURE_ENV+=	${${component}_CONFIGURE_ENV}
.endfor

.for component in ${USE_XFCE}
. if ${_USE_XFCE_ALL:M${component}}==""
IGNORE=	cannot install: Unknown component ${component}
. endif
.endfor

.endif
