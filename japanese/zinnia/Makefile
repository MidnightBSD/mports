PORTNAME=	zinnia
PORTVERSION=	0.06
CATEGORIES=	japanese
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple, customizable, and portable online handwriting recognition system
WWW=		http://zinnia.sourceforge.net/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		libtool
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

PORTDOCS=	index-ja.html index.html

OPTIONS_DEFINE=	DOCS

post-patch:
	@${REINPLACE_CMD} -e \
		'/^pkgconfigdir/s!=.*!= ${PREFIX}/libdata/pkgconfig!' \
			${WRKSRC}/Makefile.in

post-install:
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/doc/,} ${STAGEDIR}${DOCSDIR}

.include <bsd.port.mk>
