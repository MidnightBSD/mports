PORTNAME=	lha
PORTVERSION=	1.14i.20211125
CATEGORIES=	archivers
PKGNAMESUFFIX=	-ac

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Archive files using LZSS and Huffman compression (.lzh files)
WWW=		https://lha.osdn.jp

LICENSE=	LHA
LICENSE_NAME=	LHA
LICENSE_TEXT=	No redistribution allowed
LICENSE_PERMS=	auto-accept

USES=		autoreconf cpe
CPE_VENDOR=	tsugio_okamoto

USE_GITHUB=	yes
GH_ACCOUNT=	jca02266
GH_TAGNAME=	release-${PORTVERSION:E}

RESTRICTED=	no permission to redistribute

GNU_CONFIGURE=	yes

TEST_TARGET=	check

PLIST_FILES=	bin/lha-ac \
		man/ja/man1/lha-ac.1.gz \
		man/man1/lha-ac.1.gz

OPTIONS_DEFINE=		NLS
NLS_CONFIGURE_ON=	--enable-multibyte-filename=auto
NLS_CONFIGURE_OFF=	--disable-multibyte-filename

do-install:
	-${MKDIR} ${MANPREFIX}/man/ja/man1
	${INSTALL_PROGRAM} ${WRKSRC}/src/lha ${PREFIX}/bin/lha-ac
	${INSTALL_MAN} ${WRKSRC}/man/lha.1 ${MANPREFIX}/man/man1/lha-ac.1
	${INSTALL_MAN} ${WRKSRC}/man/lha.n ${MANPREFIX}/man/ja/man1/lha-ac.1

.include <bsd.port.mk>
