# Created by: Po-Chuan Hsieh <sunpoet@FreeBSD.org>

PORTNAME=	libfido2
PORTVERSION=	1.7.0
CATEGORIES=	security
MASTER_SITES=	https://developers.yubico.com/libfido2/Releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Provides library functionality for FIDO 2.0

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libcbor.so:devel/libcbor

USES=		cmake compiler:c11 pkgconfig ssl

CFLAGS+=	-D_WITH_GETLINE
CMAKE_OFF=	FUZZ LIBFUZZER NFC_LINUX USE_HIDAPI
CMAKE_ON=	BUILD_EXAMPLES BUILD_MANPAGES BUILD_SHARED_LIBS BUILD_STATIC_LIBS BUILD_TOOLS

PLIST_SUB=	PORTVERSION=${PORTVERSION}

OPTIONS_DEFINE=	DOCS

.include <bsd.port.pre.mk>

post-patch:
# we do not ship libcrypto.pc in base system
.if ${SSL_DEFAULT} == base
	@${REINPLACE_CMD} -e '/libcrypto/d' ${WRKSRC}/CMakeLists.txt ${WRKSRC}/src/libfido2.pc.in
.endif

.include <bsd.port.post.mk>