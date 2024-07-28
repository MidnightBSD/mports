PORTNAME=	exempi
DISTVERSION=	2.6.3
PORTREVISION=	1
CATEGORIES=	textproc
MASTER_SITES=	http://libopenraw.freedesktop.org/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Port of Adobe XMP SDK to work on UNIX
WWW=		http://libopenraw.freedesktop.org/wiki/Exempi

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	boost-libs>=0:devel/boost-libs
LIB_DEPENDS=	libexpat.so:textproc/expat2

USES=		cpe compiler:c++11-lang gmake iconv libtool localbase pathfix tar:xz
CPE_VENDOR=	${PORTNAME}_project
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip
GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=	--enable-unittest=no

NO_TEST=	yes

pre-configure:
	cd ${WRKSRC} && ${SETENV} ${CONFIGURE_ENV} NOCONFIGURE=1 ./autogen.sh

post-patch:
	@${REINPLACE_CMD} -e 's|$${libdir}/pkgconfig|${PREFIX}/libdata/pkgconfig|' \
		${WRKSRC}/configure

.include <bsd.port.mk>
