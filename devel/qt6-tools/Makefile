PORTNAME=	tools
DISTVERSION=	${QT6_VERSION}
CATEGORIES=	devel
PKGNAMEPREFIX=	qt6-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt declarative framework for dynamic user interfaces

BUILD_DEPENDS=	${LOCALBASE}/include/vulkan/vulkan.h:graphics/vulkan-headers
LIB_DEPENDS=	libxkbcommon.so:x11/libxkbcommon \
		libzstd.so:archivers/zstd

USES=		cmake compiler:c++17-lang gl llvm:lib,noexport python:build \
		qt-dist:6
USE_GL=		opengl
USE_QT=		base declarative
USE_LDCONFIG=	${PREFIX}/${QT_LIBDIR_REL}

CMAKE_ARGS+=	-DClang_DIR:PATH="${LLVM_PREFIX}/lib/cmake/clang" \
		-DLLVM_DIR:PATH="${LLVM_PREFIX}/lib/cmake/llvm"

post-install:
	# Install symlinks for user-facing tools
	if ! grep -q ${FAKE_DESTDIR} "${WRKDIR}/.build/user_facing_tool_links.txt"; then ${REINPLACE_CMD} -e "s#^#${FAKE_DESTDIR}#" -e "s# # ${FAKE_DESTDIR}#" ${WRKDIR}/.build/user_facing_tool_links.txt; fi
	while read t; do \
		${RLN} $$t; \
	done <${WRKDIR}/.build/user_facing_tool_links.txt
	touch ${FAKE_DESTDIR}/usr/local/lib/qt6/cmake

.include <bsd.port.mk>
