PORTNAME=	tools
DISTVERSION=	${QT6_VERSION}
CATEGORIES=	devel
PKGNAMEPREFIX=	qt6-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt declarative framework for dynamic user interfaces

BUILD_DEPENDS=	${LOCALBASE}/include/vulkan/vulkan.h:graphics/vulkan-headers
LIB_DEPENDS=	libxkbcommon.so:x11/libxkbcommon \
		libzstd.so:archivers/zstd

USES=		cmake compiler:c++17-lang gl llvm:min=17,lib,noexport python:build \
		qt-dist:6
USE_GL=		opengl
USE_LDCONFIG=	${PREFIX}/${QT_LIBDIR_REL}
USE_QT=		base declarative sqldriver-sqlite:run

CMAKE_ARGS+=	-DClang_DIR:PATH="${LLVM_PREFIX}/lib/cmake/clang" \
		-DLLVM_DIR:PATH="${LLVM_PREFIX}/lib/cmake/llvm"

post-install:
# Install symlinks for user-facing tools
	while read line; do \
		source="$$(${ECHO_CMD} $${line} | ${AWK} '{print $$1}')"; \
		target="${FAKE_DESTDIR}${TRUE_PREFIX}/$$(${ECHO_CMD} $${line} | ${AWK} '{print $$2}')"; \
		${RLN} $${source} $${target}; \
	done <${BUILD_WRKSRC}/user_facing_tool_links.txt

.include <bsd.port.mk>
