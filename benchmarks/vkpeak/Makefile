PORTNAME=	vkpeak
DISTVERSION=	20260112
CATEGORIES=	benchmarks

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Profile Vulkan devices to find their peak capacities
WWW=		https://github.com/nihui/vkpeak

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	vulkan-headers>0:graphics/vulkan-headers
LIB_DEPENDS=	libvulkan.so:graphics/vulkan-loader

USES=		cmake compiler:c++11-lib
USE_GITHUB=	yes
GH_ACCOUNT=	nihui
GH_TUPLE=	nihui:glslang:fe88f421038e1bb0a25cd5c1b2dfe505db82d08f:nglslang/ncnn/glslang \
		Tencent:ncnn:20260113:ncnn/ncnn
PLIST_FILES=	bin/${PORTNAME}

do-install:
	${INSTALL_PROGRAM} ${INSTALL_WRKSRC}/${PORTNAME} \
		${PREFIX}/bin

.include <bsd.port.mk>
