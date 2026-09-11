PORTNAME=	gnome-backgrounds
PORTVERSION=	50.0
PORTREVISION=	0
CATEGORIES=	x11-themes graphics gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Collection of backgrounds for GNOME
WWW=		https://gitlab.gnome.org/GNOME/gnome-backgrounds

LICENSE=	CC-BY-SA-3.0
LICENSE_FILE=	${WRKSRC}/COPYING

PORTSCOUT=	limit:^50\.

NO_ARCH=	yes
USES=		gettext-runtime meson tar:xz

post-install:
	@${MKDIR} ${PREFIX}/share/cinnamon-background-properties
	@${FIND} ${PREFIX}/share/gnome-background-properties -type f -name '*.xml' \
		-exec ${RLN} {} ${PREFIX}/share/cinnamon-background-properties \;

.include <bsd.port.mk>
