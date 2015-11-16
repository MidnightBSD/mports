# $MidnightBSD$

PORTNAME=	yabasic
PORTVERSION=	2.767
CATEGORIES=	lang
MASTER_SITES=	http://www.yabasic.de/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Yet another Basic for Unix and Windows

LICENSE=	artistic

USE_XORG=	x11 ice sm xt
USES=		bison
GNU_CONFIGURE=	yes

PORTDOCS=	yabasic.htm
PLIST_FILES=	bin/yabasic

post-patch:
	@${REINPLACE_CMD} -e "s|= -DUNIX|= @X_CFLAGS@ -DUNIX|g" ${WRKSRC}/Makefile.in

post-build test:
	cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${MAKE} check

post-install:
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/yabasic.htm ${DOCSDIR}

.include <bsd.port.mk>
