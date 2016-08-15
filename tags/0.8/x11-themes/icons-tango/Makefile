# $MidnightBSD$
# $FreeBSD: ports/x11-themes/icons-tango/Makefile,v 1.19 2010/03/28 06:46:20 dinoex Exp $

PORTNAME=	icons-tango
PORTVERSION=	0.8.90
PORTREVISION=	1
CATEGORIES=	x11-themes
MASTER_SITES=	GENTOO
DISTNAME=	tango-icon-theme-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Basic set of icons for the most common usage

LICENSE=	other

BUILD_DEPENDS=	${LOCALBASE}/libexec/icon-name-mapping:${PORTSDIR}/x11-themes/icon-naming-utils \
		Magick-config:${PORTSDIR}/graphics/ImageMagick

GNU_CONFIGURE=	yes
USE_GNOME=	intlhack
USES+=		gettext-tools gmake pathfix pkgconfig
INSTALLS_ICONS=	yes

.include <bsd.port.mk>
