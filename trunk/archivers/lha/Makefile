# New ports collection makefile for:    lha
# Date created:         26 Dec 1994
# Whom:                 ache
#
# $MidnightBSD: mports/archivers/lha/Makefile,v 1.5 2008/03/12 01:45:57 laffer1 Exp $
# $FreeBSD: ports/archivers/lha/Makefile,v 1.32 2004/09/22 06:16:54 dinoex Exp $
#

PORTNAME=	lha
PORTVERSION=	1.14i.ac20050924
PORTREVISION=	7
CATEGORIES=	archivers
MASTER_SITES=	http://osdn.dl.sourceforge.jp/lha/22231/ \
		http://iij.dl.sourceforge.jp/lha/22231/ \
		http://jaist.dl.sourceforge.jp/lha/22231/ \
		http://globalbase.dl.sourceforge.jp/lha/22231/ \
		http://keihanna.dl.sourceforge.jp/lha/22231/
DISTNAME=	${PORTNAME}-1.14i-ac20050924p1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Archive files using LZSS and Huffman compression (.lzh files)
LICENSE=	restricted
NO_CDROM=	requires advanced notification for cdrom distribution

USE_GMAKE=	yes
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	${MACHINE_ARCH}-portbld-freebsd7.0

MAN1=		lha.1
MANLANG=	ja
PLIST_FILES=	bin/lha

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/src/lha ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/man/lha.man ${PREFIX}/man/ja/man1/lha.1

.include <bsd.port.mk>
