# $MidnightBSD: mports/graphics/jasper/Makefile,v 1.9 2011/02/02 21:04:18 laffer1 Exp $

PORTNAME=	jasper
PORTVERSION=	1.900.1
PORTREVISION=	2
CATEGORIES=	graphics
MASTER_SITES=	http://www.ece.uvic.ca/~mdadams/jasper/software/ \
		${MASTER_SITE_IMAGEMAGICK}
MASTER_SITE_SUBDIR=	ImageMagick/delegates

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An implementation of the codec specified in the JPEG-2000 standard
LICENSE=	other

LIB_DEPENDS=	jpeg.11:${PORTSDIR}/graphics/jpeg

USE_AUTOTOOLS=	libtool
USE_ZIP=	yes
USE_GNOME=	 lthack
GNU_CONFIGURE=	yes
MAKE_JOBS_SAFE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
CONFIGURE_ARGS=	--enable-shared --enable-static \
		--mandir=${FAKE_DESTDIR}${TRUE_PREFIX}/man
USE_LDCONFIG=	yes

MASTER_SITE_IMAGEMAGICK=	\
	ftp://ftp.imagemagick.org/pub/%SUBDIR%/ \
	${MASTER_SITE_RINGSERVER:S,%SUBDIR%,graphics/&,}

OPTIONS=	OPENGL	"OpenGL support" off \
		UUID	"UUID support (required by GDAL)" off

.include <bsd.port.pre.mk>

.if defined(WITH_OPENGL)
USE_GL=	glut
CONFIGURE_ARGS+=--enable-opengl
PLIST_SUB+=	OPENGL=""
.else
CONFIGURE_ARGS+=--disable-opengl
PLIST_SUB+=	OPENGL="@comment "
.endif

.if defined(WITH_UUID)
EXTRA_PATCHES+=	${FILESDIR}/uuid.patch
.endif

.if !defined(NO_INSTALL_MANPAGES)
MAN1=		imgcmp.1 imginfo.1 jasper.1 jiv.1
.endif

post-install:
.if !defined(NO_INSTALL_MANPAGES)
	@cd ${WRKSRC}/src/appl && make install-man
.endif
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${WRKSRC}/doc/* ${DOCSDIR}
.endif

.include <bsd.port.post.mk>
