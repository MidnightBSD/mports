# $MidnightBSD: mports/misc/gnome-icon-theme/Makefile,v 1.8 2010/08/14 03:39:27 laffer1 Exp $

PORTNAME=	gnome-icon-theme
PORTVERSION=	2.31.0
PORTREVISION=	1
CATEGORIES=	misc gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Collection of icons for the GNOME desktop

LICENSE=	gpl2

BUILD_DEPENDS=	${LOCALBASE}/share/icons/hicolor/index.theme:${PORTSDIR}/misc/hicolor-icon-theme \
		icon-naming-utils>=0.8.7:${PORTSDIR}/x11-themes/icon-naming-utils
RUN_DEPENDS=	${LOCALBASE}/share/icons/hicolor/index.theme:${PORTSDIR}/misc/hicolor-icon-theme

USE_BZIP2=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
USES=		pathfix
USE_GNOME=	intlhack
INSTALLS_ICONS=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

.include <bsd.port.mk>
