PORTNAME=	wv2
PORTVERSION=	0.4.2
PORTREVISION=	7
CATEGORIES=	textproc
MASTER_SITES=	SF/wvware/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library providing routines to access Microsoft Word files
WWW=		https://wvware.sourceforge.net/

LICENSE=	lgpl
LICENSE_FILE=	${WRKSRC}/COPYING.LIB

USES=		cmake gnome iconv pkgconfig libtool tar:bzip2
USE_GNOME=	libgsf
USE_CXXSTD=	c++14
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

post-patch:
	@${REINPLACE_CMD} -e 's|LIBGSF_INCLUDE_DIR|PC_LIBGSF_INCLUDE_DIRS|g' \
		-e 's|LIBGSF_LIBRARIES|PC_LIBGSF_LIBRARIES|g' \
		${WRKSRC}/CMakeLists.txt
	@${REINPLACE_CMD} -e 's|glib/giochannel.h|glib.h|g' \
		${WRKSRC}/src/olestream.h

.include <bsd.port.mk>
