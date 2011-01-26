# New ports collection makefile for:	cracklib
# Date created:				12 Oct 2007
# Whom:					Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD: mports/security/cracklib/Makefile,v 1.1 2007/10/12 17:05:54 laffer1 Exp $
#

PORTNAME=	cracklib
PORTVERSION=	2.7
CATEGORIES=	security
MASTER_SITES=	http://www.crypticide.com/users/alecm/security/
DISTNAME=	${PORTNAME},${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Password-checking library
LICENSE=	other

MAN3=		cracklib.3
MLINKS=		cracklib.3 FascistCheck.3
USE_LDCONFIG=	yes

pre-su-install:
	${INSTALL_DATA} ${WRKSRC}/cracklib/libcrack.a ${DESTDIR}${PREFIX}/lib
	${INSTALL_DATA} ${WRKSRC}/cracklib/libcrack.so.1 ${DESTDIR}${PREFIX}/lib
	${LN} -sf libcrack.so.1 ${DESTDIR}${PREFIX}/lib/libcrack.so
	${INSTALL_DATA} ${WRKSRC}/cracklib/packer.h ${DESTDIR}${PREFIX}/include
	${INSTALL_SCRIPT} ${WRKSRC}/util/mkdict ${DESTDIR}${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/util/packer ${DESTDIR}${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/util/testlib ${DESTDIR}${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/util/testnum ${DESTDIR}${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/util/teststr ${DESTDIR}${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/util/unpacker ${DESTDIR}${PREFIX}/bin
	${INSTALL_MAN} ${FILESDIR}/cracklib.3 ${MAN3PREFIX}/man/man3
	${MKDIR} ${DESTDIR}${PREFIX}/libdata/cracklib

.include <bsd.port.mk>
