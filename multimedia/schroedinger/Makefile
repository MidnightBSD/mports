

PORTNAME=	schroedinger
PORTVERSION=	1.0.11
PORTREVISION=	3
CATEGORIES=	multimedia
MASTER_SITES=	http://diracvideo.org/download/schroedinger/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	High-speed Dirac codec

LICENSE=	gpl2 lgpl mit mpl
LICENSE_COMB=	dual
LICENSE_FILE_mit=	${WRKSRC}/COPYING.MIT
LICENSE_FILE_mpl=	${WRKSRC}/COPYING.MPL

LIB_DEPENDS=	liborc-0.4.so:devel/orc

USES=		libtool pkgconfig
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
USE_LDCONFIG=	yes

post-patch:
	@${REINPLACE_CMD} -e 's|^pkgconfigdir=.*|pkgconfigdir="\\$${prefix}/libdata/pkgconfig"|' \
		${WRKSRC}/configure
# Derived from upstream git commit ee011f33f80c9691a6cfd5116101fdcf8c3cd6f7
	@${REINPLACE_CMD} '/^wavelet_max_gain_OBJECTS =/s/=/= tmp-orc.$$(OBJEXT)/' \
		${WRKSRC}/testsuite/Makefile.in

.include <bsd.port.mk>
