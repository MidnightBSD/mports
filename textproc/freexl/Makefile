PORTNAME=	freexl
DISTVERSION=	2.0.0
CATEGORIES=	textproc
MASTER_SITES=	https://www.gaia-gis.it/gaia-sins/freexl-sources/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library to extract valid data from within an Excel (.xls) spreadsheet
WWW=		https://www.gaia-gis.it/fossil/freexl/index

LICENSE=	gpl2+ lgpl2.1+ MPL11 
LICENSE_COMB=	dual

LIB_DEPENDS=	libexpat.so:textproc/expat2

USES=		cpe gmake iconv:wchar_t libtool pathfix minizip
CPE_VENDOR=	${PORTNAME}_project
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	ac_cv_search_locale_charset=no
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip
CFLAGS+=	-I${PREFIX}/include
LIBS+=		-L${PREFIX}/lib -liconv

NO_TEST=	yes

.include <bsd.port.mk>
