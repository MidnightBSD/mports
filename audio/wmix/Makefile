PORTNAME=	wmix
PORTVERSION=	3.1
CATEGORIES=	audio windowmaker
MASTER_SITES=	http://www.ne.jp/asahi/linux/timecop/software/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Audio mixer for the WindowMaker dock with TV-like OSD

LICENSE=	gpl2

OPTIONS_DEFINE=	DOCS

PLIST_FILES=	bin/wmix
ALL_TARGET=	${PORTNAME}
USES=		xorg
USE_XORG=	xpm
MAKE_ARGS=	CC="${CC}" CFLAGS="${CFLAGS} -I${LOCALBASE}/include" \
		LDFLAGS="${LDFLAGS} -L${LOCALBASE}/lib"

PORTDOCS=	AUTHORS BUGS INSTALL NEWS README

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/wmix ${STAGEDIR}${PREFIX}/bin
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
.for i in ${PORTDOCS}
	@${INSTALL_DATA} ${WRKSRC}/${i} ${STAGEDIR}${DOCSDIR}
.endfor

.include <bsd.port.mk>
