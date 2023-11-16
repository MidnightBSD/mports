PORTNAME=	xmlstarlet
PORTVERSION=	1.6.1
CATEGORIES=	textproc
MASTER_SITES=	SF/xmlstar/${PORTNAME}/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Command Line XML Toolkit
WWW=		https://xmlstar.sourceforge.net/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

USE_GNOME=	libxslt
USES=		gnome iconv
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-libxml-prefix=${LOCALBASE} \
		--with-libxslt-prefix=${LOCALBASE} \
		${ICONV_CONFIGURE_ARG} \
		--disable-static-libs
PLIST_FILES=	bin/xml man/man1/xmlstarlet.1.gz
PORTDOCS=	xmlstarlet.txt \
		xmlstarlet-man.xml \
		xmlstarlet-ug.html xmlstarlet-ug.pdf \
		xmlstarlet-ug.ps xmlstarlet-ug.xml \
		html.css
OPTIONS_DEFINE=	DOCS

post-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKSRC}/doc && ${INSTALL_DATA} ${PORTDOCS} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
