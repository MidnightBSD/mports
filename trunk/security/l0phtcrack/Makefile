# $MidnightBSD$

PORTNAME=	l0phtcrack
PORTVERSION=	1.5
CATEGORIES=	security
MASTER_SITES=	http://www.mavetju.org/download/adopted/ \
		http://mirror.amdmi3.ru/distfiles/${DIST_SUBDIR}/
#		http://www.cotse.com/sw/WinNT/
DISTNAME=	lcsrc
DIST_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cracks SAMBA or Windows NT passwords

LICENSE=	l0pthcrack
LICENSE_NAME=	l0pthcrack license
LICENSE_TEXT=	A mix of BSD and GPL code, possibly a violation
LICENSE_PERMS=	no-pkg-sell no-pkg-mirror

RESTRICTED=	uses GNU getopt with BSDish-licensed code from OpenSSL
NO_WRKSUBDIR=	yes
USES=		dos2unix perl5 zip
USE_PERL5=	build

PLIST_FILES=	bin/lc_CLI
PORTDOCS=	*

OPTIONS_DEFINE=	DOCS

post-extract:
	@${RM} ${WRKSRC}/*exe
	@${REINPLACE_CMD} -e 's|ommited|omitted|' ${WRKSRC}/util.c

do-build:
	cd ${WRKSRC} && ${CC} ${CFLAGS} -DMPU8086 *.c -o lc_CLI

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/lc_CLI ${STAGEDIR}${PREFIX}/bin

do-install-DOCS-on:
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/*.txt ${STAGEDIR}${DOCSDIR}

.include <bsd.port.mk>
