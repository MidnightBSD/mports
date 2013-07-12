# $MidnightBSD: mports/audio/taglib/Makefile,v 1.7 2011/06/16 12:42:06 laffer1 Exp $

PORTNAME=	taglib
PORTVERSION=	1.8
CATEGORIES=	audio
MASTER_SITES=	http://cloud.github.com/downloads/taglib/taglib/ \
		http://developer.kde.org/~wheeler/files/src/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for manipulating ID3 tags and Ogg comments
LICENSE=	lgpl2.1

OPTIONS_DEFINE=	RCC

RCC_DESC=	Build with RusXMMS librcc patches (experimental)

USES=		cmake
CMAKE_ARGS=	-DWITH_ASF:BOOL=ON \
		-DWITH_MP4:BOOL=ON
MAKE_JOBS_SAFE=	yes
USE_LDCONFIG=	yes

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MRCC}
PKGNAMESUFFIX=	-rcc
EXTRA_PATCHES+=	${FILESDIR}/extrapatch-rcc
LIB_DEPENDS+=	rcc:${PORTSDIR}/devel/librcc
PLIST_SUB+=	RCC=""
.else
PLIST_SUB+=	RCC="@comment "
.endif

post-patch:
.if ${PORT_OPTIONS:MRCC}
	@${REINPLACE_CMD} -e 's|-ltag|-ltag -lrcc|g' \
		${WRKSRC}/taglib.pc.cmake ${WRKSRC}/taglib-config.cmake \
		${WRKSRC}/bindings/c/taglib_c.pc.cmake
.endif
	${REINPLACE_CMD} -e 's|$${LIB_INSTALL_DIR}/pkgconfig|libdata/pkgconfig|' \
		${WRKSRC}/CMakeLists.txt ${WRKSRC}/bindings/c/CMakeLists.txt

.include <bsd.port.mk>
