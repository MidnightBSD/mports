# New ports collection makefile for:	soundjuicer
# Date created:		20 Jan 2004
# Whom:			Alexander Nedotsukov <bland@FreeBSD.org>
#
# $MidnightBSD: mports/audio/sound-juicer/Makefile,v 1.6 2008/09/07 20:44:33 laffer1 Exp $
# $FreeBSD: ports/audio/sound-juicer/Makefile,v 1.39 2007/10/24 23:34:51 marcus Exp $
#   $MCom: ports/audio/sound-juicer/Makefile,v 1.71 2007/10/15 00:27:00 marcus Exp $
#

PORTNAME=	sound-juicer
PORTVERSION=	2.22.0
PORTREVISION=	1
CATEGORIES=	audio gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Clean, mean and lean CD ripper for GNOME2
LICENSE=	gpl2

LIB_DEPENDS=	musicbrainz.4:${PORTSDIR}/audio/libmusicbrainz \
		gnome-media-profiles.0:${PORTSDIR}/audio/gnome-media \
		cdio.8:${PORTSDIR}/sysutils/libcdio \
    		tag.6:${PORTSDIR}/audio/taglib

USE_BZIP2=	yes
USE_GETTEXT=	yes
USE_XORG=	x11
USE_GMAKE=	yes
INSTALLS_OMF=	yes
USE_GNOME=	gnomehack intlhack gnomeprefix libgnomeui nautiluscdburner \
		gnomedocutils
USE_GSTREAMER=	cdparanoia vorbis flac gconf good
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-ignore-missing-cd
INSTALLS_ICONS=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

MAN1=		sound-juicer.1
GCONF_SCHEMAS=	sound-juicer.schemas

post-patch:
	@${REINPLACE_CMD} -e 's|^\(SUBDIRS = .*\)tests\(.*\)|\1\2|' \
		${WRKSRC}/Makefile.in

.include <bsd.port.mk>
