# New ports collection makefile for:	gnomemedia2
# Date created:				06 May 2002
# Whom:					Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD: mports/audio/gnome-media/Makefile,v 1.3 2008/03/04 02:03:00 laffer1 Exp $
# $FreeBSD: ports/audio/gnome-media/Makefile,v 1.81 2007/10/24 23:34:46 marcus Exp $
#

PORTNAME=	gnome-media
PORTVERSION=	2.22.0
CATEGORIES=	audio gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Multimedia applications for the GNOME 2 desktop
LICENSE=	gpl2

USE_BZIP2=	yes
USE_GETTEXT=	yes
INSTALLS_OMF=	yes
INSTALLS_ICONS=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
GNOME_DESKTOP_VERSION=2
USE_GNOME=	gnomeprefix gnomehack intlhack gnomedesktop \
		gail nautiluscdburner
USE_GSTREAMER=	cdparanoia esound gconf good
CONFIGURE_ARGS=	--enable-ipv6
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

GCONF_SCHEMAS=	CDDB-Slave2.schemas gnome-audio-profiles.schemas \
		gnome-cd.schemas gnome-sound-recorder.schemas \
		gnome-volume-control.schemas

post-patch:
	@${REINPLACE_CMD} -e 's|[$$][(]CDROM_HOST[)]|freebsd|g' \
		${WRKSRC}/gnome-cd/Makefile.in
	@${REINPLACE_CMD} -e 's|acd0c|acd0|g ; s|== "xyes|= "xyes|g' \
		${WRKSRC}/configure

.include <bsd.port.mk>
