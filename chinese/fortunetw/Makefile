PORTNAME=	fortunetw
PORTVERSION=	1.4
CATEGORIES=	chinese
MASTER_SITES=	FREEBSD_LOCAL/sunpoet
MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Classic fortune file in Taiwan (UTF-8)

USES=		tar:xz

NO_ARCH=	yes
NO_BUILD=	yes

do-install:
	${MKDIR} ${PREFIX}/share/games/fortune/
.for file in bsdchat folksong liuyong stephehchow tangshi xiaoxing yijing
	${INSTALL_DATA} ${WRKSRC}/${file} ${WRKSRC}/${file}.dat ${PREFIX}/share/games/fortune/
.endfor

.include <bsd.port.mk>
