# $MidnightBSD$
# $FreeBSD: ports/x11-themes/icons-tango-extras/Makefile,v 1.6 2010/03/28 06:46:20 dinoex Exp $

PORTNAME=	icons-tango-extras
PORTVERSION=	0.1.0
PORTREVISION=	2
CATEGORIES=	x11-themes
MASTER_SITES=	http://tango.freedesktop.org/releases/ \
		GENTOO
DISTNAME=	tango-icon-theme-extras-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Extra set of icons from the Tango project

LICENSE=	other

BUILD_DEPENDS=	${LOCALBASE}/libexec/icon-name-mapping:${PORTSDIR}/x11-themes/icon-naming-utils \
		${LOCALBASE}/share/icons/Tango/16x16/actions/add.png:${PORTSDIR}/x11-themes/icons-tango \
		Magick-config:${PORTSDIR}/graphics/ImageMagick
RUN_DEPENDS=	${LOCALBASE}/share/icons/Tango/16x16/actions/add.png:${PORTSDIR}/x11-themes/icons-tango

GNU_CONFIGURE=	yes
USES=		gmake pkgconfig
USE_GNOME=	intlhack
INSTALLS_ICONS=	yes

.include <bsd.port.mk>
