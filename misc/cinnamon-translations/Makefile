# Created by: Gustau Perez i Querol <gustau.perez@gmail.com>

PORTNAME=	cinnamon-translations
PORTVERSION=	4.8.3
CATEGORIES=	misc x11 gnome
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Translations for the cinnamon desktop

LICENSE=	gpl2

USE_GITHUB=	yes
GH_ACCOUNT=	linuxmint

USES=		gettext-tools
INSTALL_TARGET=	all
NO_ARCH=	yes

post-patch:
	@${REINPLACE_CMD} -e 's|usr/share|${FAKE_DESTDIR}${TRUE_PREFIX}/share|g' \
		${WRKSRC}/Makefile

.include <bsd.port.mk>
