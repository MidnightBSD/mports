# $MidnightBSD: mports/graphics/libwmf/Makefile,v 1.9 2011/12/15 00:57:47 laffer1 Exp $
# $FreeBSD: ports/graphics/libwmf/Makefile,v 1.41 2007/02/01 02:41:41 kris Exp $

PORTNAME=	libwmf
PORTVERSION=	0.2.8.4
PORTREVISION=	3
CATEGORIES=	graphics
MASTER_SITES=	SF/wvware/${PORTNAME}/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tools and library for converting Microsoft WMF (windows metafile)
LICENSE=	gpl2

BUILD_DEPENDS=	freetype-config:${PORTSDIR}/print/freetype2     # XXX
LIB_DEPENDS=	jpeg.11:${PORTSDIR}/graphics/jpeg \
		png15:${PORTSDIR}/graphics/png \
		freetype.9:${PORTSDIR}/print/freetype2

USE_AUTOTOOLS=	libtool
USE_GNOME=	libxml2
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0
CONFIGURE_ARGS=	--with-sys-gd=no \
		--with-png=${LOCALBASE} --with-jpeg=${LOCALBASE} \
		--with-gsfontdir=${LOCALBASE}/share/ghostscript/fonts
USE_LDCONFIG=	yes

.if defined(WITHOUT_X11)
PKGNAMESUFFIX=	-nox11
CONFIGURE_ARGS+=	--with-x=no
PLIST_SUB+=	X11='@comment '
.else
USE_XORG=	x11
PLIST_SUB+=	X11=''
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|src include fonts doc|src include fonts|g' \
		${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} -e 's|@LT_CURRENT@|2|g ; \
		 s|@LIBWMF_GDK_PIXBUF_TRUE@|#|g ; \
		 s|@LIBWMF_GDK_PIXBUF_FALSE@||g ; \
		 s|-release $$(LT_RELEASE)||g ; \
		 s|: install-loaderLTLIBRARIES|:|g' ${WRKSRC}/src/Makefile.in

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	${TAR} -C ${WRKSRC}/doc --exclude '*Makefile*' -cf - . | \
		${TAR} -C ${DOCSDIR} --unlink -xf -
	@${CHOWN} -R ${SHAREOWN}:${SHAREGROUP} ${DOCSDIR}
.endif

.include <bsd.port.mk>
