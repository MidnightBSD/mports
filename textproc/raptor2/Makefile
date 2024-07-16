PORTNAME=	raptor2
DISTVERSION=	2.0.16
PORTREVISION=	3
CATEGORIES=	textproc
MASTER_SITES=	https://download.librdf.org/source/

PATCH_SITES=	https://github.com/dajobe/raptor/commit/
PATCHFILES=	4dbc4c1da2a033c497d84a1291c46f416a9cac51.patch:-p1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RDF Parser Toolkit for Redland
WWW=		https://librdf.org/raptor/

LICENSE=	apache2 gpl2 gpl3 lgpl2.1
LICENSE_COMB=	dual

LIB_DEPENDS=	libcurl.so:ftp/curl \
		libicuuc.so:devel/icu \
		libyajl.so:devel/yajl

CONFLICTS=	raptor-1.4.1[0-9]* raptor-1.4.21

USE_GNOME=	libxml2 libxslt
USES=		gnome libtool:keepla pathfix pkgconfig
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-xml2-config=${LOCALBASE}/bin/xml2-config \
		--with-curl-config=${LOCALBASE}/bin/curl-config \
		--with-icu-config=${LOCALBASE}/bin/icu-config \
		--with-www=curl
GNU_CONFIGURE_MANPREFIX=${PREFIX}/share
INSTALL_TARGET=	install-strip

USE_LDCONFIG=	yes

.include <bsd.port.mk>
