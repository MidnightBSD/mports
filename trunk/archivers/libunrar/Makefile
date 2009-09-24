# New ports collection makefile for:    unrar
# Date created:				23 Sep 2005
# Whom:					samm@os2.kiev.ua
#
# $FreeBSD: ports/archivers/libunrar/Makefile,v 1.8 2006/09/28 12:18:55 barner Exp $
# $MidnightBSD: mports/archivers/libunrar/Makefile,v 1.5 2008/12/09 19:41:20 crash Exp $
#

PORTNAME=	libunrar
PORTVERSION=	3.9.5
PORTEPOCH=	1
CATEGORIES=	archivers
MASTER_SITES=	http://www.rarlab.com/rar/
DISTNAME=	unrarsrc-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library to work with RAR archivies
LICENSE=	publicdom

WRKSRC=		${WRKDIR}/unrar

USE_GMAKE=	yes
MAKEFILE=	makefile.unix
MAKE_ENV+=	LDFLAGS="${LDFLAGS}"
ALL_TARGET=	lib
USE_LDCONFIG=	yes

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/libunrar.so.3 ${PREFIX}/lib/
	cd ${PREFIX}/lib && ${LN} -sf libunrar.so.3 libunrar.so
	${MKDIR} ${PREFIX}/include/libunrar3
	${INSTALL_DATA} ${WRKSRC}/dll.hpp ${PREFIX}/include/libunrar3/dll.hpp

.include <bsd.port.mk>
