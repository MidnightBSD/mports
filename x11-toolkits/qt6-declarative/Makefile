PORTNAME=	declarative
DISTVERSION=	${QT6_VERSION}
CATEGORIES=	x11-toolkits
PKGNAMEPREFIX=	qt6-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt declarative framework for dynamic user interfaces

BUILD_DEPENDS=	${LOCALBASE}/include/vulkan/vulkan.h:graphics/vulkan-headers
LIB_DEPENDS=	libxkbcommon.so:x11/libxkbcommon

USES=		cmake compiler:c++17-lang gl pkgconfig python \
		qt-dist:6
USE_GL=		opengl
USE_QT=		base languageserver shadertools:build
USE_LDCONFIG=	${PREFIX}/${QT_LIBDIR_REL}

.include <bsd.mport.options.mk>

.if ${ARCH} == aarch64 || ${ARCH} == amd64 || ${ARCH:Marmv?} || ${ARCH} == i386
PLIST_SUB+=	QML_JIT=""
.else
PLIST_SUB+=	QML_JIT="@comment "
.endif

post-install:
	-${RM} -vr ${PREFIX}/${QT_LIBDIR_REL}/cmake
	# Install symlinks for user-facing tools
	if ! grep -q ${FAKE_DESTDIR} "${WRKDIR}/.build/user_facing_tool_links.txt"; then ${REINPLACE_CMD} -e "s#^#${FAKE_DESTDIR}#" -e "s# # ${FAKE_DESTDIR}#" ${WRKDIR}/.build/user_facing_tool_links.txt; fi
	while read t; do \
                ${RLN} $$t; \
        done <${WRKDIR}/.build/user_facing_tool_links.txt
	touch ${FAKE_DESTDIR}/usr/local/lib/qt6/cmake

.include <bsd.port.mk>
