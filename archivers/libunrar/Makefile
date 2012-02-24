# $MidnightBSD: mports/archivers/libunrar/Makefile,v 1.7 2009/12/25 17:23:13 laffer1 Exp $

PORTNAME=	libunrar
PORTVERSION=	3.9.10
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
