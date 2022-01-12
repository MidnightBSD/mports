PORTNAME=	png
PORTVERSION=	1.6.37
PORTREVISION=	1
CATEGORIES=	graphics
MASTER_SITES=	SF/lib${PORTNAME}/lib${PORTNAME}16/${PORTVERSION} \
		ftp://ftp.simplesystems.org/pub/lib${PORTNAME}/${PORTNAME}/src/lib${PORTNAME}16/
PATCH_SITES=	SF/apng/lib${PORTNAME}/lib${PORTNAME}16/
DISTNAME=	lib${PORTNAME}-${PORTVERSION}

FAKE_OPTS=	trueprefix

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for manipulating PNG images

LICENSE=	Libpng
LICENSE_GROUPS=	FSF GPL OSI
LICENSE_NAME=	libpng License
LICENSE_FILE=	${WRKSRC}/LICENSE
LICENSE_PERMS=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

USES=		cpe libtool tar:xz
CPE_PRODUCT=	libpng
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-pkgconfigdir=${PREFIX}/libdata/pkgconfig
INSTALL_TARGET=	install-strip
TEST_TARGET=	check-TESTS
USE_LDCONFIG=	yes

OPTIONS_DEFINE=	APNG SIMD
OPTIONS_DEFAULT=APNG
OPTIONS_DEFAULT_amd64=	SIMD
APNG_DESC=Enable Animated PNG support
SIMD_CONFIGURE_OFF=	--enable-hardware-optimizations=no
SIMD_CONFIGURE_ON=	--enable-hardware-optimizations=yes

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MAPNG} || make(makesum)
PATCHFILES=	${DISTNAME}-apng.patch.gz
.endif

.include <bsd.port.mk>
