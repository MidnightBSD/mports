

PORTNAME=	raptor
PORTVERSION=	1.4.21
PORTREVISION=	4
CATEGORIES=	textproc
MASTER_SITES=	SF/librdf/${PORTNAME}/${PORTVERSION} \
		http://download.librdf.org/source/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RDF Parser Toolkit for Redland

LICENSE=	gpl2

LIB_DEPENDS=	libcurl.so:${PORTSDIR}/ftp/curl

USES=		libtool pathfix
USE_GNOME=	libxml2
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-xml2-config=${LOCALBASE}/bin/xml2-config \
		--with-curl-config=${LOCALBASE}/bin/curl-config \
		--with-html-dir=${PREFIX}/share/doc \
		--with-xml-parser=libxml --with-www=curl
INSTALL_TARGET=	install-strip

OPTIONS_DEFINE=	DOCS

post-patch:
	@${REINPLACE_CMD} -e 's|utils ||' ${WRKSRC}/Makefile.in

.include <bsd.port.mk>
