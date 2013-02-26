# $MidnightBSD: mports/lang/yabasic/Makefile,v 1.3 2013/02/24 02:31:43 laffer1 Exp $

PORTNAME=	yabasic
PORTVERSION=	2.763
PORTREVISION=	3
CATEGORIES=	lang
MASTER_SITES=	http://www.yabasic.de/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Yet another Basic for Unix and Windows
LICENSE=	artistic

USE_XORG=	x11 ice sm xt
USE_BISON=	build
GNU_CONFIGURE=	yes

MAN1=		yabasic.1
PORTDOCS=	yabasic.htm
PLIST_FILES=	bin/yabasic

post-patch:
	@${REINPLACE_CMD} -e "s|= -DUNIX|= @X_CFLAGS@ -DUNIX|g" ${WRKSRC}/Makefile.in

post-build test:
	cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${MAKE} check

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/yabasic.htm ${DOCSDIR}
.endif

.include <bsd.port.mk>
