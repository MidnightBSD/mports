# $MidnightBSD$

PORTNAME=	lha
PORTVERSION=	1.14i
PORTREVISION=	9
CATEGORIES=	archivers
MASTER_SITES=	http://www2m.biglobe.ne.jp/~dolphin/lha/prog/
DISTNAME=	${PORTNAME}-${PORTVERSION:S/.//}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Archive files using LZSS and Huffman compression (.lzh files)

LICENSE=	lha
LICENSE_NAME=	lha license
LICENSE_PERMS=	dist-mirror pkg-mirror
LICENSE_TEXT=	Custom license with advanced notification required for CD distribution.

NO_CDROM=	requires advanced notification for cdrom distribution

MANLANG=	ja
PLIST_FILES=	bin/lha

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/src/lha ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/man/lha.man ${PREFIX}/man/ja/man1/lha.1

.include <bsd.port.mk>
