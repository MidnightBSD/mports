# New ports collection makefile for:	gnome-icon-theme
# Date Created:				05 October 2002
# Whom:					Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD: mports/misc/gnome-icon-theme/Makefile,v 1.3 2008/06/01 00:02:49 crash Exp $
# $FreeBSD: ports/misc/gnome-icon-theme/Makefile,v 1.33 2007/05/19 20:15:48 flz Exp $
#   $MCom: ports/misc/gnome-icon-theme/Makefile,v 1.99 2007/03/12 23:58:09 marcus Exp $
#

PORTNAME=	gnome-icon-theme
PORTVERSION=	2.22.0
CATEGORIES=	misc gnome
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/${PORTNAME}/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A collection of icons for the GNOME 2 desktop
LICENSE=	gpl2

BUILD_DEPENDS=	${LOCALBASE}/share/icons/hicolor/index.theme:${PORTSDIR}/misc/hicolor-icon-theme \
		icon-naming-utils>=0.8.1:${PORTSDIR}/x11-themes/icon-naming-utils
RUN_DEPENDS=	${LOCALBASE}/share/icons/hicolor/index.theme:${PORTSDIR}/misc/hicolor-icon-theme

USE_BZIP2=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
USE_GNOME=	gnomehack intlhack gnometarget gtk20
INSTALLS_ICONS=	yes
CONFIGURE_ARGS=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

post-patch:
	@${REINPLACE_CMD} -e 's|[(]datadir[)]/pkgconfig|(prefix)/libdata/pkgconfig|g' \
			${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} -e 's|@mkdir_p@|mkdir -p|g' \
		${WRKSRC}/po/Makefile.in.in

pre-install:
	@${MKDIR} ${PREFIX}/share/icons/gnome/48x48/apps

.include <bsd.port.mk>
