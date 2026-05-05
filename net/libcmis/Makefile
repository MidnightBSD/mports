PORTNAME=	libcmis
PORTVERSION=	0.6.2
PORTREVISION=	7
CATEGORIES=	net devel
MASTER_SITES=	https://github.com/tdf/libcmis/releases/download/v${PORTVERSION}/ \
		https://dev-www.libreoffice.org/src/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Client library for the CMIS interface
WWW=		https://github.com/tdf/libcmis

LICENSE=	lgpl MPL11 gpl2
LICENSE_COMB=	dual

BUILD_DEPENDS=	cppunit-config:devel/cppunit \
		${LOCALBASE}/lib/libboost_regex.a:devel/boost-libs
LIB_DEPENDS=	libboost_program_options.so:devel/boost-libs \
		libcurl.so:ftp/curl

USES=		compiler:c++11-lib gmake gnome libtool localbase pathfix \
		pkgconfig tar:xz
USE_GNOME=	libxml2

CONFIGURE_ARGS=	--disable-werror --with-boost=${LOCALBASE} --without-man
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
USE_LDCONFIG=	yes

PLIST_SUB=	MAJVER=${PORTVERSION:R} SHLIBVER=${PORTVERSION:R:E}

.include <bsd.port.mk>
