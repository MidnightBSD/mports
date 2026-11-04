PORTNAME=	clearlooks-metacity
PORTVERSION=	2.0
PORTREVISION=	7
CATEGORIES=	x11-themes
MASTER_SITES=	http://www.stellingwerff.com/
#MASTER_SITES=	SOURCEFORGE/clearlooks

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Clearlooks Metacity theme
WWW=		https://clearlooks.sourceforge.net/

LICENSE=	unknown

BUILD_DEPENDS=	metacity>0:x11-wm/metacity
RUN_DEPENDS=	metacity>0:x11-wm/metacity

CONFLICTS=	gnome-themes-2.11.9[1-9]* gnome-themes-2.*

WRKSRC=		${WRKDIR}/Clearlooks/metacity-1/
USES=		gnome
USE_GNOME=	gnomeprefix
DATADIR=	share/themes/Clearlooks/metacity-1
NO_BUILD=	yes

PLIST_FILES=	%%DATADIR%%/metacity-theme-1.xml
PLIST_DIRS=	%%DATADIR%% \
		share/themes/Clearlooks

do-install:
	${MKDIR} ${PREFIX}/${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/metacity-theme-1.xml ${PREFIX}/${DATADIR}

.include <bsd.port.mk>
