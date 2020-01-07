# $MidnightBSD$

PORTNAME=	jamvm
PORTVERSION=	1.5.4
PORTREVISION=	3
CATEGORIES=	java devel
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/JamVM%20${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Compact Java virtual machine

LICENSE=	gpl2

RUN_DEPENDS=	${LOCALBASE}/share/classpath/glibj.zip:java/classpath

CONFIGURE_ARGS=	--with-classpath-install-dir=${LOCALBASE}
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd9.1
GNU_CONFIGURE=	yes
OPTIONS_SUB=	yes
USES=		compiler gmake libtool pkgconfig

# temporary clang 3.3 in base 0.8/0.9 crashes
USE_GCC=	4.8

OPTIONS_DEFINE=	FFI ZIP
OPTIONS_DEFAULT=FFI ZIP
FFI_DESC=	use libffi to call native methods
ZIP_DESC=	turn-on zip support in the bootstrap loader

FFI_CONFIGURE_ENABLE=	ffi
FFI_LIB_DEPENDS=	libffi.so:${PORTSDIR}/devel/libffi
ZIP_BUILD_DEPENDS=	zip:${PORTSDIR}/archivers/zip
ZIP_CONFIGURE_ENABLE=	zip

.include <bsd.mport.options.mk>

.include <bsd.port.pre.mk>

.if ${COMPILER_TYPE} == clang
CONFIGURE_ARGS+=	--disable-int-inlining
.endif

post-extract:
	@${REINPLACE_CMD} -e "s,\(^include_HEADERS = .*\)jni.h\(.*\),\1\2," ${WRKSRC}/src/Makefile.in

post-install:
	cd ${PREFIX} && ln -fs share/classpath/glibj.zip lib/rt.jar
	${CP} -p ${WRKSRC}/lib/inst_classes.zip ${PREFIX}/share/jamvm/classes.zip

.include <bsd.port.post.mk>
