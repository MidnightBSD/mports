PORTNAME=	noto
PORTVERSION=	2.018
CATEGORIES=	x11-fonts
MASTER_SITES=	https://github.com/googlefonts/noto-emoji/raw/v2020-07-22-unicode13_0/fonts/
PKGNAMESUFFIX=	-emoji
DISTFILES=	NotoColorEmoji.ttf \
		NotoEmoji-Regular.ttf
DIST_SUBDIR=	Noto
EXTRACT_ONLY=	# empty

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Google Noto Fonts family (Emoji)

LICENSE=	apache2

USES=		fonts

NO_ARCH=	yes
NO_BUILD=	yes

do-install:
	${MKDIR} ${STAGEDIR}${FONTSDIR}
	${INSTALL_DATA} ${DISTDIR}/${DIST_SUBDIR}/NotoColorEmoji.ttf ${DISTDIR}/${DIST_SUBDIR}/NotoEmoji-Regular.ttf ${STAGEDIR}${FONTSDIR}

.include <bsd.port.mk>
