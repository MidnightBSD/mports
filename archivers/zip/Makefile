PORTNAME=	zip
PORTVERSION=	3.0
PORTREVISION=	1
CATEGORIES=	archivers
MASTER_SITES=	SF/info${PORTNAME}/Zip%203.x%20%28latest%29/${PORTVERSION}
DISTNAME=	${PORTNAME}${PORTVERSION:S/.//g}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Create/update ZIP files compatible with PKZIP
WWW=		https://infozip.sourceforge.net/Zip.html

LICENSE=	infozip
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		cpe

CPE_VENDOR=	info-zip_project

OPTIONS_DEFINE=	DOCS

MAKEFILE=	unix/Makefile
ALL_TARGET=	generic

PLIST_FILES=	bin/zip bin/zipcloak bin/zipnote bin/zipsplit \
		share/man/man1/zip.1.gz share/man/man1/zipcloak.1.gz \
		share/man/man1/zipnote.1.gz share/man/man1/zipsplit.1.gz
PORTDOCS=	*

do-install:
.for p in ${PLIST_FILES:Mbin*:T}
	${INSTALL_PROGRAM} ${WRKSRC}/${p} ${STAGEDIR}${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/man/${p}.1 ${STAGEDIR}${PREFIX}/share/man/man1
.endfor
	@${MKDIR} ${DOCSDIR}
	cd ${WRKSRC}/ && ${INSTALL_DATA} CHANGES README* TODO WHATSNEW WHERE ${DOCSDIR}

.include <bsd.port.mk>
