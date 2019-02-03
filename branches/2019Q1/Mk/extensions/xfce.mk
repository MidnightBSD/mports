# $MidnightBSD$
#
# Provide support for Xfce related ports.
#
# Feature:	xfce
# Usage:	USES=xfce or USES=xfce:ARGS
# Valid ARGS:	gtk3
#
# Variables, which can be set by the port:
#
# MASTER_SITE_SUBDIR	Path
# USE_XFCE		List of components
#

.if !defined(_INCLUDE_USES_XFCE_Mk)
_INCLUDE_USES_XFCE_Mk=	yes
_USES_POST+=	xfce

_USE_XFCE_ALL=	garcon libexo libgui libmenu libutil panel thunar xfconf

XFCE_MASTER_SITE_VER=	4.12

xfce_ARGS?=	# empty

CPPFLAGS+=	-I${LOCALBASE}/include
LIBS+=	-L${LOCALBASE}/lib

garcon_LIB_DEPENDS=	libgarcon-1.so:sysutils/garcon
garcon_USE_XFCE_REQ=	libmenu

libexo_LIB_DEPENDS=	libexo-1.so:x11/libexo
libexo_USE_XFCE_REQ=	libmenu

libgui_LIB_DEPENDS=	libxfcegui4.so:x11-toolkits/libxfce4gui
libgui_USE_XFCE_REQ=	libutil

libmenu_LIB_DEPENDS=	libxfce4ui-1.so:x11/libxfce4menu
libmenu_USE_XFCE_REQ=	xfconf

libutil_LIB_DEPENDS=	libxfce4util.so:x11/libxfce4util

panel_LIB_DEPENDS=	libxfce4panel-1.0.so:x11-wm/xfce4-panel
panel_RUN_DEPENDS=	xfce4-panel:x11-wm/xfce4-panel
panel_USE_XFCE_REQ=	garcon libexo xfconf

thunar_LIB_DEPENDS=	libthunarx-2.so:x11-fm/thunar
thunar_RUN_DEPENDS=	Thunar:x11-fm/thunar
thunar_USE_XFCE_REQ=	xfconf libmenu

xfconf_LIB_DEPENDS=	libxfconf-0.so:x11/xfce4-conf
xfconf_USE_XFCE_REQ=	libutil

.if defined(USE_XFCE)
# First, expand all USE_XFCE_REQ recursively.
.for comp in ${_USE_XFCE_ALL}
. for subcomp in ${${comp}_USE_XFCE_REQ}
${comp}_USE_XFCE_REQ+=${${subcomp}_USE_XFCE_REQ}
. endfor
.endfor

# Then, use already expanded USE_XFCE_REQ to expand USE_XFCE.
.if ${USE_XFCE} == yes
.else
.for comp in ${USE_XFCE}
. if ${_USE_XFCE_ALL:M${comp}} == ""
IGNORE=	cannot install: Unknown component ${comp}
. endif
_USE_XFCE+=	${${comp}_USE_XFCE_REQ} ${comp}
.endfor
.endif

# Remove duplicate components
USE_XFCE=	${_USE_XFCE:O:u}

.for comp in ${USE_XFCE}
. if defined(${comp}_BUILD_DEPENDS)
BUILD_DEPENDS+=	${${comp}_BUILD_DEPENDS}
. endif

. if defined(${comp}_LIB_DEPENDS)
LIB_DEPENDS+=	${${comp}_LIB_DEPENDS}
. endif

. if defined(${comp}_RUN_DEPENDS)
RUN_DEPENDS+=	${${comp}_RUN_DEPENDS}
. endif
.endfor

.if ${USE_XFCE:M*gui} == libgui
DEPRECATED?=	Depends on unmaintained x11-toolkits/libxfce4gui
. endif

.if ${xfce_ARGS} == gtk3
. if exists(${LOCALBASE}/lib/libxfce4ui-1.so) && !exists(${LOCALBASE}/lib/libxfce4ui-2.so)
BROKEN=	GTK3 option needs to be set in x11/libxfce4menu
. endif
.endif

.endif # end of defined(USE_XFCE)

.endif

.if defined(_POSTMKINCLUDED) && !defined(_INCLUDE_USES_XFCE_POST_MK)
_INCLUDE_USES_XFCE_POST_MK=	yes

.endif
