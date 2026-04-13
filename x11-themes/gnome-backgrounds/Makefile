PORTNAME=	gnome-backgrounds
PORTVERSION=	43
PORTREVISION=	1
CATEGORIES=	x11-themes graphics gnome
MASTER_SITES=	GNOME/sources/${PORTNAME}/${PORTVERSION:C/^([0-9]+)\..*/\1/}
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Collection of backgrounds for GNOME

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

PORTSCOUT=	limitw:1,even

NO_ARCH=	yes
USES=		gettext meson tar:xz

post-install:
	@${MKDIR} ${PREFIX}/share/cinnamon-background-properties
	@${FIND} ${PREFIX}/share/gnome-background-properties -type f -name '*.xml' \
		-exec ${RLN} {} ${PREFIX}/share/cinnamon-background-properties \;

.include <bsd.port.mk>
