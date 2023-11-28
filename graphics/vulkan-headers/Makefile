PORTNAME=	vulkan-headers
DISTVERSIONPREFIX=	v
DISTVERSION=	1.3.270
CATEGORIES=	graphics

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Headers for the Vulkan graphics API
WWW=		https://github.com/KhronosGroup/Vulkan-Headers

LICENSE=	apache2

USES=		cmake
USE_GITHUB=	yes
GH_ACCOUNT=	KhronosGroup
GH_PROJECT=	Vulkan-Headers
STRIP=		# nothing to strip
NO_ARCH=	yes

post-extract:
# genvk.py requires docgenerator.py from Vulkan-Docs, so drop useless shebang
	@${FIND} ${WRKSRC}/registry -name \*.py -exec ${REINPLACE_CMD} -i '' '/^#!/d' {} +

post-patch:
# MidnightBSD 3.x 
	@if [ -L /usr/include/sched.h ]; then \
		${REINPLACE_CMD} $$'/^namespace/i\\\n#undef major\\\n#undef minor\\\n\\\n' \
			${WRKSRC}/include/vulkan/vulkan_structs.hpp; \
	fi

.include <bsd.port.mk>
