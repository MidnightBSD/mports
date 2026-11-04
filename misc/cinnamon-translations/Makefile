PORTNAME=	cinnamon-translations
PORTVERSION=	6.4.2
CATEGORIES=	misc x11 gnome
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Translations for the cinnamon desktop

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

USE_GITHUB=	yes
GH_ACCOUNT=	linuxmint

USES=		gettext-tools
NO_BUILD=	yes
INSTALL_TARGET=	all
NO_ARCH=	yes

post-patch:
	@${REINPLACE_CMD} -e 's|usr/share|${FAKE_DESTDIR}${TRUE_PREFIX}/share|g' \
		${WRKSRC}/Makefile

.include <bsd.port.mk>
