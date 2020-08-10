# Created by: Alexey Dokuchaev <danfe@FreeBSD.org>

PORTNAME=	lzbench
PORTVERSION=	1.8
DISTVERSIONPREFIX=	v
CATEGORIES=	benchmarks

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	In-memory benchmark of open-source LZ77/LZSS/LZMA compressors

LICENSE=	mit bsd2 gpl2 lgpl
LICENSE_COMB=	multi

USES=		compiler:c11 gmake
USE_GITHUB=	yes
GH_ACCOUNT=	inikep

PLIST_FILES=	bin/lzbench
PORTDOCS=	NEWS README.md

OPTIONS_DEFINE=	DOCS

post-patch:
	@${REINPLACE_CMD} -e '/PROGOS/s,Linux,${OPSYS},' \
		${WRKSRC}/_lzbench/lzbench.h

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/lzbench ${PREFIX}/bin

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/,} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
