PORTNAME=	lha
PORTVERSION=	1.14i
PORTREVISION=	11
CATEGORIES=	archivers
MASTER_SITES=	OSDN/lha
PKGNAMESUFFIX=	-ac${PKGNAMESUFFIX2}
DISTNAME=	${PORTNAME}-${PORTVERSION}-ac20050924p1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Archive files using LZSS and Huffman compression (.lzh files)

LICENSE=        lha
LICENSE_NAME=   lha license
LICENSE_PERMS=  dist-mirror pkg-mirror
LICENSE_TEXT=   Custom license with advanced notification required for CD distribution.

PLIST_FILES=	bin/lha \
		man/ja/man1/lha-ac.1.gz
#PLIST_DIRS=	man/ja/man1
GNU_CONFIGURE=	yes

RESTRICTED=	no permission to redistribute

OPTIONS_DEFINE=	NLS
NLS_CONFIGURE_ON=	--enable-multibyte-filename=auto
NLS_CONFIGURE_OFF=	--disable-multibyte-filename

do-install:
	-${MKDIR} ${MANPREFIX}/man/ja/man1
	${INSTALL_PROGRAM} ${WRKSRC}/src/lha ${PREFIX}/bin/lha
	${INSTALL_MAN} ${WRKSRC}/man/lha.n ${MANPREFIX}/man/ja/man1/lha.1

.include <bsd.port.mk>
