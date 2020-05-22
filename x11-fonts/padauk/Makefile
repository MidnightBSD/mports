# Created by: Kuan-Chung Chiu <buganini@gmail.com>

PORTNAME=	padauk
PORTVERSION=	2.8
DISTVERSIONSUFFIX=	0
CATEGORIES=	x11-fonts
MASTER_SITES=	http://scripts.sil.org/cms/scripts/render_download.php?&format=file&media_id=Mh_Padauk_zip&filename=/

MAINTAINER=	ports@MidnightBSD>org
COMMENT=	Unicode font supporting all the Myanmar characters

LICENSE=	OFL11

FETCH_BEFORE_ARGS=	-o ${DISTFILES}
NO_BUILD=	yes
USES=		fonts zip

do-install:
	@${MKDIR} ${STAGEDIR}${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/*.ttf ${STAGEDIR}${FONTSDIR}

.include <bsd.port.mk>
