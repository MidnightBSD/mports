

PORTNAME=	libEMF
PORTVERSION=	1.0.7
PORTREVISION=	1
CATEGORIES=	graphics
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Enhanced Metafile Library
LICENSE=	gpl2

OPTIONS_DEFINE=	DOCS

USES=		libtool
GNU_CONFIGURE=	yes

post-install:
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/html/* ${DOCSDIR}

.include <bsd.port.mk>
