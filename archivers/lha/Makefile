PORTNAME=	lha
PORTVERSION=	1.14i
PORTREVISION=	9
CATEGORIES=	archivers
MASTER_SITES=	http://www2m.biglobe.ne.jp/~dolphin/lha/prog/
DISTNAME=	${PORTNAME}-${PORTVERSION:S/.//}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Archive files using LZSS and Huffman compression (.lzh files)
WWW=		http://www2m.biglobe.ne.jp/~dolphin/lha/lha.htm

LICENSE=	lha
LICENSE_NAME=	lha license
LICENSE_PERMS=	dist-mirror pkg-mirror auto-accept
LICENSE_FILE=	${FILESDIR}/LICENSE

NO_CDROM=	requires advanced notification for cdrom distribution

USES=		cpe
CPE_VENDOR=	tsugio_okamoto

MANLANG=	ja
PLIST_FILES=	bin/lha

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/src/lha ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/man/lha.man ${PREFIX}/man/ja/man1/lha.1

.include <bsd.port.mk>
