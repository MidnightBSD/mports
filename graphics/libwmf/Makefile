PORTNAME=	libwmf
PORTVERSION=	0.2.8.4
PORTREVISION=	16
CATEGORIES=	graphics
MASTER_SITES=	SF/wvware/${PORTNAME}/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tools and library for converting Microsoft WMF (windows metafile)

LICENSE=	gpl2 # or later
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libpng.so:graphics/png \
		libfreetype.so:print/freetype2

CONFLICTS?=	libwmf-nox11-[0-9]*

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-sys-gd=no \
		--with-png=${LOCALBASE} --with-jpeg=${LOCALBASE} \
		--with-gsfontdir=${LOCALBASE}/share/ghostscript/fonts
INSTALL_TARGET=	install-strip
USES=		gnome jpeg libtool
USE_GNOME=	libxml2
USE_LDCONFIG=	yes

PORTDOCS=	*

OPTIONS_DEFINE=	X11 DOCS
OPTIONS_DEFAULT=X11
OPTIONS_SUB=	yes

X11_USE=	XORG=x11
X11_CONFIGURE_OFF=--with-x=no

.include <bsd.mport.options.mk>

post-patch:
	@${REINPLACE_CMD} -e 's|src include fonts doc|src include fonts|g' \
		${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} -e \
		's|@LIBWMF_GDK_PIXBUF_TRUE@|#|g ; \
		 s|@LIBWMF_GDK_PIXBUF_FALSE@||g ; \
		 s|: install-loaderLTLIBRARIES|:|g' ${WRKSRC}/src/Makefile.in

post-install:
.if ${PORT_OPTIONS:MDOCS}
	@${MKDIR} ${DOCSDIR}
	@${TAR} -C ${WRKSRC}/doc --exclude '*Makefile*' -cf - . | \
		${TAR} -C ${DOCSDIR} --unlink -xf -
.endif

.include <bsd.port.mk>
