# Created by: Satoshi Asami <asami@FreeBSD.org>

PORTNAME=	yeahconsole
PORTVERSION=	0.3.4
CATEGORIES=	x11
MASTER_SITES=	http://phrat.de/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Terminal wrapper for creating drop-down consoles

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		xorg
USE_XORG=	x11
ALL_TARGET=	${PORTNAME}

PLIST_FILES=	bin/yeahconsole
PORTDOCS=	README

OPTIONS_DEFINE=	DOCS

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${STAGEDIR}${PREFIX}/bin

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
