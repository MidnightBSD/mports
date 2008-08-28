# New ports collection makefile for:    unrar
# Date created:				23 Sep 2005
# Whom:					samm@os2.kiev.ua
#
# $FreeBSD: ports/archivers/libunrar/Makefile,v 1.8 2006/09/28 12:18:55 barner Exp $
# $MidnightBSD: mports/archivers/libunrar/Makefile,v 1.3 2008/03/12 01:45:57 laffer1 Exp $
#

PORTNAME=	libunrar
PORTVERSION=	3.7.8
PORTEPOCH=	1
CATEGORIES=	archivers
MASTER_SITES=	http://files2.rarlab.com/rar/ \
		http://files3.rarlab.com/rar/ \
		http://files4.rarlab.com/rar/ \
		http://files5.rarlab.com/rar/ \
		http://files6.rarlab.com/rar/
DISTNAME=	unrarsrc-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library to work with RAR archivies
LICENSE=	publicdom

WRKSRC=		${WRKDIR}/unrar

USE_GMAKE=	yes
MAKEFILE=	makefile.unix
MAKE_ENV+=	CXX="${CXX}" LDFLAGS="${LDFLAGS}"
ALL_TARGET=	lib
USE_LDCONFIG=	yes

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/libunrar.so.3 ${PREFIX}/lib/
	cd ${PREFIX}/lib && ${LN} -sf libunrar.so.3 libunrar.so
	${MKDIR} ${PREFIX}/include/libunrar3
	${INSTALL_DATA} ${WRKSRC}/dll.hpp ${PREFIX}/include/libunrar3/dll.hpp

.include <bsd.port.mk>
