# $MidnightBSD$

PORTNAME=	elementary
PORTVERSION=	1.13.2
CATEGORIES=	x11-toolkits enlightenment
MASTER_SITES=	http://download.enlightenment.org/rel/libs/${PORTNAME}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple widget toolkit using EFL

LICENSE=	lgpl2.1

LIB_DEPENDS=	libefl.so:${PORTSDIR}/devel/efl

DIST_SUBDIR=	enlightenment
GNU_CONFIGURE=	yes
USES=		gmake libtool lua pathfix pkgconfig tar:xz
USE_LDCONFIG=	yes
INSTALLS_ICONS=	yes
INSTALL_TARGET=	install-strip

PLIST_SUB=	BRANCHVERSION=${PORTVERSION:R} PORTVERSION=${PORTVERSION}

.include <bsd.mport.options.mk>

USES+=	compiler:c11

.if ${PORT_OPTIONS:MNLS}
USES+=			gettext
LDFLAGS+=		-L${LOCALBASE}/lib
PLIST_SUB+=		NLS=""
.else
CONFIGURE_ARGS+=	--disable-nls
PLIST_SUB+=		NLS="@comment "
.endif

.if ${PORT_OPTIONS:MEXAMPLES}
CONFIGURE_ARGS+=	--enable-install-examples
.endif

post-patch:
	@${REINPLACE_CMD} -e \
		's|= \$$(pkgdatadir)/examples|= $$(datadir)/examples/$$(PACKAGE)|' \
		${WRKSRC}/src/examples/Makefile.in

.include <bsd.port.mk>
