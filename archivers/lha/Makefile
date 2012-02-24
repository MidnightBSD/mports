# New ports collection makefile for:    lha
# Date created:         26 Dec 1994
# Whom:                 ache
#
# $MidnightBSD: mports/archivers/lha/Makefile,v 1.6 2011/08/20 14:20:12 laffer1 Exp $
# $FreeBSD: ports/archivers/lha/Makefile,v 1.32 2004/09/22 06:16:54 dinoex Exp $
#

PORTNAME=	lha
PORTVERSION=	1.14i
PORTREVISION=	8
CATEGORIES=	archivers
MASTER_SITES=	http://www2m.biglobe.ne.jp/~dolphin/lha/prog/
DISTNAME=	${PORTNAME}-${PORTVERSION:S/.//}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Archive files using LZSS and Huffman compression (.lzh files)
LICENSE=	restricted
NO_CDROM=	requires advanced notification for cdrom distribution

CONFIGURE_TARGET=	${MACHINE_ARCH}-portbld-freebsd7.0

MAN1=		lha.1
MANLANG=	ja
PLIST_FILES=	bin/lha

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/src/lha ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/man/lha.man ${PREFIX}/man/ja/man1/lha.1

.include <bsd.port.mk>
