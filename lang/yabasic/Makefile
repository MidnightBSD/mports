# New ports collection makefile for:	yabasic
# Date created:		11 Nov 1999
# Whom:			Frank Gruender
#
# $MidnightBSD: mports/lang/yabasic/Makefile,v 1.1 2007/05/03 07:57:39 laffer1 Exp $
# $FreeBSD: ports/lang/yabasic/Makefile,v 1.31 2006/05/09 20:52:24 edwin Exp $
#

PORTNAME=	yabasic
PORTVERSION=	2.763
PORTREVISION=	1
CATEGORIES=	lang
MASTER_SITES=	http://www.yabasic.de/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Yet another Basic for Unix and Windows
LICENSE=	artistic

USE_XORG=	x11 ice sm xt
USE_BISON=	build
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0

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
