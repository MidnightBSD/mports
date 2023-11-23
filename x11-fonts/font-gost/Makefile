PORTNAME=	gost
PORTVERSION=	0.2
PORTREVISION=	1
CATEGORIES=	x11-fonts
MASTER_SITES=	http://sd.ascon.ru/ftp/Public/Utils/DWG-DXF/ \
		FREEBSD_LOCAL/vg
PKGNAMEPREFIX=	font-
DISTNAME=	TTF_FON

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GOST TrueType fonts
WWW=		http://sd.ascon.ru/ftp/Public/Utils/DWG-DXF/

USES=		fonts zip
NO_BUILD=	yes
SUB_FILES=	pkg-message
WRKSRC=		${WRKDIR}/Fonts

do-install:
	@${MKDIR} ${STAGEDIR}${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/*.ttf ${STAGEDIR}${FONTSDIR}
	${INSTALL_DATA} ${WRKSRC}/*.TTF ${STAGEDIR}${FONTSDIR}

.include <bsd.port.mk>
