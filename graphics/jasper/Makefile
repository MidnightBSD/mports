# $MidnightBSD$

PORTNAME=	jasper
PORTVERSION=	1.900.1
PORTREVISION=	17
CATEGORIES=	graphics
MASTER_SITES=	https://www.ece.uvic.ca/~frodo/jasper/software/ \
		ftp://ftp.imagemagick.org/pub/ImageMagick/delegates/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Implementation of the codec specified in the JPEG-2000 standard

LICENSE=	mit

OPTIONS_DEFINE=	OPENGL UUID DOCS
OPTIONS_DEFAULT=UUID
OPTIONS_SUB=	yes
UUID_DESC=	UUID support (required by GDAL)

CONFIGURE_ARGS=	--enable-shared --enable-static
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
USES=		jpeg libtool:keepla localbase zip

OPENGL_CONFIGURE_ENABLE=opengl
OPENGL_USE=		GL=glut XORG=x11,xext,xi,xmu
UUID_EXTRA_PATCHES=	${PATCHDIR}/uuid.patch

post-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}/
	${INSTALL_DATA} ${WRKSRC}/doc/* ${FAKE_DESTDIR}${DOCSDIR}/

.include <bsd.port.mk>
