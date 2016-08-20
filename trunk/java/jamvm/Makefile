# $MidnightBSD$

PORTNAME=	jamvm
PORTVERSION=	1.5.4
PORTREVISION=	2
CATEGORIES=	java devel
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/JamVM%20${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Compact Java virtual machine

LICENSE=	gpl2

RUN_DEPENDS=	${LOCALBASE}/share/classpath/glibj.zip:${PORTSDIR}/java/classpath

GNU_CONFIGURE=	yes
OPTIONS_SUB=	yes
CONFIGURE_ARGS=	--with-classpath-install-dir=${LOCALBASE}
USES=		pkgconfig gmake

USE_GCC=	any

OPTIONS_DEFINE=	FFI ZIP
OPTIONS_DEFAULT=FFI ZIP
FFI_DESC=	use libffi to call native methods
ZIP_DESC=	turn-on zip support in the bootstrap loader

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MFFI}
LIB_DEPENDS+=		ffi:${PORTSDIR}/devel/libffi
CONFIGURE_ARGS+=	--enable-ffi
.endif

.if ${PORT_OPTIONS:MZIP}
BUILD_DEPENDS+=		zip:${PORTSDIR}/archivers/zip
PLIST_SUB+=		WITH_ZIP="" WITHOUT_ZIP="@comment "
.else
CONFIGURE_ARGS+=	--disable-zip
PLIST_SUB+=		WITH_ZIP="@comment " WITHOUT_ZIP=""
.endif

.include <bsd.port.pre.mk>

post-extract:
	@${REINPLACE_CMD} -e "s,\(^include_HEADERS = .*\)jni.h\(.*\),\1\2," ${WRKSRC}/src/Makefile.in

.include <bsd.port.post.mk>
