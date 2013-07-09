# $MidnightBSD: mports/deskutils/deskbar-applet/Makefile,v 1.2 2010/12/07 00:47:39 laffer1 Exp $

PORTNAME=	deskbar-applet
PORTVERSION=	2.32.0
CATEGORIES=	deskutils gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Omnipresent versatile search interface
LICENSE=	gpl2

BUILD_DEPENDS=	${PYTHON_SITELIBDIR}/dbus/__init__.py:${PORTSDIR}/devel/py-dbus
RUN_DEPENDS=	${PYTHON_SITELIBDIR}/dbus/__init__.py:${PORTSDIR}/devel/py-dbus

USE_BZIP2=	yes
USES=		pathfix gettext
USE_GNOME=	gnomeprefix pygnomedesktop intlhack
USE_PYTHON=	yes
USE_GMAKE=	yes
USE_DISPLAY=	yes
GNU_CONFIGURE=	yes
INSTALLS_ICONS=	yes
INSTALLS_OMF=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

GCONF_SCHEMAS=	deskbar-applet.schemas

OPTIONS_DEFINE=	EVO
OPTIONS_DEFAULT=EVO
EVO_DESC=	Enable evolution support

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MEVO}
USE_GNOME+=	evolutiondataserver
PLIST_SUB+=	EVO=""
.else
CONFIGURE_ARGS+=--disable-evolution
PLIST_SUB+=	EVO="@comment "
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/local|${LOCALBASE}|g ; \
		s|%%LOCALBASE%%|${LOCALBASE}|g' \
		${WRKSRC}/deskbar/handlers/mozilla.py \
		${WRKSRC}/deskbar/core/Utils.py
	@${REINPLACE_CMD} -e 's|<glib/g.*\.h>|<glib.h>|g' \
		${WRKSRC}/deskbar/handlers/evolution/evolution.[ch]

.include <bsd.port.mk>
