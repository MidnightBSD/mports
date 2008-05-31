# New ports collection makefile for:	gnome-power-manager
# Date created:				03 May 2006
# Whom:					Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/sysutils/gnome-power-manager/Makefile,v 1.17 2008/04/19 17:53:39 miwi Exp $
#   $MCom: ports/sysutils/gnome-power-manager/Makefile,v 1.40 2008/03/10 22:50:08 ahze Exp $
#

PORTNAME=	gnome-power-manager
PORTVERSION=	2.22.1
PORTREVISION=	0
CATEGORIES=	sysutils gnome
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/${PORTNAME}/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Power management system for the GNOME Desktop
LICENSE=	gpl2

#BUILD_DEPENDS=	docbook2html:${PORTSDIR}/textproc/docbook-utils \
#    		${LOCALBASE}/share/sgml/docbook/4.1/catalog:${PORTSDIR}/textproc/docbook-410
LIB_DEPENDS=	hal.1:${PORTSDIR}/sysutils/hal \
		notify.1:${PORTSDIR}/devel/libnotify

USE_GETTEXT=	yes
USE_BZIP2=	yes
USE_GMAKE=	yes
INSTALLS_OMF=	yes
INSTALLS_ICONS=	yes
USE_AUTOTOOLS=	libtool:15
USE_GSTREAMER=	good
USE_GNOME=	gnomeprefix gnomehack intlhack libgnomeui libwnck \
		gnomedocutils gnomepanel
CONFIGURE_ARGS=	--disable-icon-framing \
		--disable-docbook-docs
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

GCONF_SCHEMAS=	gnome-power-manager.schemas

#MAN1=		gnome-power-manager.1 gnome-power-preferences.1 \
#		gnome-power-statistics.1

post-patch:
	@${REINPLACE_CMD} -e 's|-lresolv|| ; s|-Werror||g' \
		${WRKSRC}/configure

.include <bsd.port.mk>
