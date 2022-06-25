PORTNAME=	torrentzip
PORTVERSION=	0.2
PORTREVISION=	2
CATEGORIES=	archivers
MASTER_SITES=	SF/trrntzip/trrntzip/TorrentZip%20v${PORTVERSION}
DISTNAME=	trrntzip_v${PORTVERSION:S/.//}_src

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Efficient way to prepare zipfiles for BitTorrent

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		autoreconf

GNU_CONFIGURE=	yes

WRKSRC=		${WRKDIR}/trrntzip

PLIST_FILES=	bin/trrntzip
PORTDOCS=	README

OPTIONS_DEFINE=	DOCS

pre-install:
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README ${DOCSDIR}/README

.include <bsd.port.mk>
