PORTREVISION=	3
PKGNAMESUFFIX=	-wayland
CATEGORIES+=	wayland

# https://github.com/nigels-com/glew/issues/172
MAINTAINER=	ports@MidnightBSD.org

MASTERDIR=	${.CURDIR}/../glew
PLIST=		${.CURDIR}/pkg-plist
PKGMESSAGE=	${.CURDIR}/pkg-message

USE_GL=		egl opengl
USE_XORG=	# empty
MAKE_ARGS=	NAME=${PORTNAME:tu}${PKGNAMESUFFIX}
INSTALL_TARGET=	install.lib

OPTIONS_DEFINE=	# empty

post-patch:	slave-post-patch
slave-post-patch:
	@${REINPLACE_CMD} 's/Makefile.$$(SYSTEM)/&-egl-glvnd/' ${WRKSRC}/Makefile
	@${SED} 's/linux/${OPSYS:tl}/' ${WRKSRC}/config/Makefile.linux-egl-glvnd \
		>${WRKSRC}/config/Makefile.${OPSYS:tl}-egl-glvnd
	@${REINPLACE_CMD} -e '/^Name:/s/${PORTNAME}/${PKGBASE}/' \
		${WRKSRC}/${PORTNAME}.pc.in
# GCC 4.2 doesn't support redefining same typedef
	@${REINPLACE_CMD} '/typedef.*EGLint;/d' ${WRKSRC}/include/GL/eglew.h

post-install:
	${INSTALL_PROGRAM} ${WRKSRC}/bin/glewinfo \
		${PREFIX}/bin/glewinfo${PKGNAMESUFFIX}
	${INSTALL_PROGRAM} ${WRKSRC}/bin/visualinfo \
		${PREFIX}/bin/visualinfo${PKGNAMESUFFIX}
	${MKDIR} ${PREFIX}/include/GL
	${INSTALL_DATA} ${WRKSRC}/include/GL/eglew.h \
		${PREFIX}/include/GL
	${INSTALL_DATA} ${WRKSRC}/${PORTNAME}.pc \
		${PREFIX}/libdata/pkgconfig/${PKGBASE}.pc

.include "${MASTERDIR}/Makefile"
