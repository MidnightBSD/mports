# $MidnightBSD$

PORTNAME=	vala
PORTVERSION=	0.20.1
PORTREVISION=	0
CATEGORIES=	lang gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Programming language and compiler that converts Vala code into C code

LICENSE=	lgpl2.1

USES=		bison gettext gmake pathfix pkgconfig
USE_XZ=		yes
USE_GNOME=	glib20 gnomeprefix libxslt
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
USE_LDCONFIG=	yes

MAN1?=		valac.1 valac-${VALA_VER}.1
VALA_VER=	${PORTVERSION:R}

PLIST_SUB=	VERSION=${VALA_VER}

.if defined(VALA_SLAVE)
LIB_DEPENDS+=	vala-${VALA_VER}.0:${PORTSDIR}/lang/vala
CONFIGURE_ARGS+=--enable-vapigen
BUILD_DEPENDS+=	${SITE_PERL}/${PERL_ARCH}/XML/LibXML.pm:${PORTSDIR}/textproc/p5-XML-LibXML
RUN_DEPENDS+=	${SITE_PERL}/${PERL_ARCH}/XML/LibXML.pm:${PORTSDIR}/textproc/p5-XML-LibXML
MAN1=		vala-gen-introspect.1 vapigen.1
.else
CONFIGURE_ARGS+=--disable-vapigen
.endif

post-patch:
# We cheat here, because vala records vapigen related stuff in its .pc file
# This makes vapigen work again, although it might get weird when
# vala-vapigen isn't installed.
	@${REINPLACE_CMD} -e 's|@vapigen_decl@|vapigen=$${bindir}/vapigen-${VALA_VER}|g' \
		-e 's|@gen_introspect_decl@|gen_introspect=$${libdir}/vala-${VALA_VER}/gen-introspect-${VALA_VER}|g' \
		-e 's|@vala_gen_introspect_decl@|vala_gen_introspect=$${bindir}/vala-gen-introspect-${VALA_VER}|g' \
		${WRKSRC}/libvala.pc.in
	@${REINPLACE_CMD} -e 's|cp $$< $$@|cp libvala.pc libvala-${VALA_VER}.pc|g' \
		${WRKSRC}/Makefile.in

.if defined(VALA_SLAVE)
pre-build:
	@cd ${WRKSRC} && ${GMAKE} version.h
	@cd ${WRKSRC}/gobject-introspection && ${GMAKE} libgidl.la && \
		${GMAKE} gen-introspect

post-install:
	@cd ${WRKSRC}/gobject-introspection && ${GMAKE} ${FAKE_MAKEARGS} install
	@${INSTALL_MAN} ${WRKSRC}/doc/vapigen.1 ${WRKSRC}/doc/vala-gen-introspect.1 \
		 ${PREFIX}/man/man1/
.else
post-install:
	${LN} -fs ${PREFIX}/libdata/pkgconfig/libvala-${VALA_VER}.pc \
		${PREFIX}/libdata/pkgconfig/vala-1.0.pc
.endif

.include <bsd.port.mk>
