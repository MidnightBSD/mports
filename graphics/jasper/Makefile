# $MidnightBSD$

PORTNAME=	jasper
PORTVERSION=	1.900.1
PORTREVISION=	3
CATEGORIES=	graphics
MASTER_SITES=	http://www.ece.uvic.ca/~mdadams/jasper/software/ \
		${MASTER_SITE_IMAGEMAGICK}
MASTER_SITE_SUBDIR=	ImageMagick/delegates

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Implementation of the codec specified in the JPEG-2000 standard

LICENSE=	mit

LIB_DEPENDS=	libjpeg.so:${PORTSDIR}/graphics/jpeg

USES=		zip libtool:keepla
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
CONFIGURE_ARGS=	--enable-shared --enable-static \
		--mandir=${FAKE_DESTDIR}${TRUE_PREFIX}/man
USE_LDCONFIG=	yes

MASTER_SITE_IMAGEMAGICK=	\
	ftp://ftp.imagemagick.org/pub/%SUBDIR%/ \
	${MASTER_SITE_RINGSERVER:S,%SUBDIR%,graphics/&,}

OPTIONS_DEFINE= OPENGL UUID DOCS
UUID_DESC=	UUID support (required by GDAL)

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MOPENGL}
USE_XORG=	x11 xmu xi xext
USE_GL=		glut
CONFIGURE_ARGS+=--enable-opengl
PLIST_SUB+=	OPENGL=""
.else
CONFIGURE_ARGS+=--disable-opengl
PLIST_SUB+=	OPENGL="@comment "
.endif

.if ${PORT_OPTIONS:MUUID}
EXTRA_PATCHES+=	${FILESDIR}/uuid.patch
.endif

.if ${PORT_OPTIONS:MDOCS}
post-install:
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${WRKSRC}/doc/* ${DOCSDIR}/
.endif

.include <bsd.port.mk>
