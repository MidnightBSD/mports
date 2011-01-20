# New ports collection makefile for:	gnomepanel
# Date created:				27 April 2002
# Whom:					Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD: mports/x11/gnome-panel/Makefile,v 1.9 2011/01/17 19:52:27 laffer1 Exp $
# $FreeBSD: ports/x11/gnome-panel/Makefile,v 1.90 2008/04/20 00:42:32 marcus Exp $
#   $MCom: ports/x11/gnome-panel/Makefile,v 1.177 2008/03/23 06:13:12 marcus Exp $
#

PORTNAME=	gnome-panel
PORTVERSION=	2.30.2
PORTREVISION?=	1
CATEGORIES=	x11 gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Panel component for the GNOME 2 Desktop
LICENSE=	gpl2

USE_BZIP2=	yes

.if !defined(REFERENCE_PORT)

LIB_DEPENDS=	gweather.1:${PORTSDIR}/net/libgweather \
		canberra-gtk.0:${PORTSDIR}/audio/libcanberra \
		polkit-gnome.0:${PORTSDIR}/sysutils/policykit-gnome \
                polkit.2:${PORTSDIR}/sysutils/policykit \
		polkit-gobject-1.0:${PORTSDIR}/sysutils/polkit \
		polkit-gtk-1.0:${PORTSDIR}/sysutils/polkit-gnome

USE_GETTEXT=	yes
INSTALLS_OMF=	yes
USE_LDCONFIG=	yes
INSTALLS_ICONS=	yes
USE_GNOME=	gnomeprefix gnomehack intlhack gnomedesktop librsvg2 \
		libwnck gnomemenus gnomedocutils ltverhack referencehack \
		libbonoboui
WANT_GNOME=	yes
GNOME_DESKTOP_VERSION=2
USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool:22
CONFIGURE_ARGS=	--with-kde-datadir=${LOCALBASE}/share \
		--with-kde-docdir=${LOCALBASE}/share/doc \
		--disable-network-manager
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

MAN1=		gnome-panel.1
GCONF_SCHEMAS=	clock.schemas fish.schemas \
		panel-compatibility.schemas panel-general.schemas \
		panel-global.schemas panel-object.schemas \
		panel-toplevel.schemas window-list.schemas \
		workspace-switcher.schemas

OPTIONS=	EVOLUTION "use the Evolution calendar if installed" on

.if defined(PACKAGE_BUILDING)
.undef WITHOUT_GNOME
WITH_GNOME=	yes
.endif

.include <bsd.port.pre.mk>

.if !defined(WITHOUT_EVOLUTION) && ${HAVE_GNOME:Mevolutiondataserver}!=""
USE_GNOME+=	evolutiondataserver
CONFIGURE_ARGS+=--enable-eds
.else
CONFIGURE_ARGS+=--disable-eds
.endif

post-patch:
	@${FIND} ${WRKSRC} -type f | \
		${XARGS} -n 10 ${REINPLACE_CMD} -e \
		's|"applications.menu"|"gnome-applications.menu"|'
	@${REINPLACE_CMD} -e 's|xsltproc -o| xsltproc --nonet -o|g' \
		${WRKSRC}/help/clock/Makefile.in \
		${WRKSRC}/help/fish/Makefile.in

.include <bsd.port.post.mk>

.endif
