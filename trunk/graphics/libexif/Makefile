# $FreeBSD: ports/graphics/libexif/Makefile,v 1.25 2006/03/29 06:54:33 pav Exp $
# $MidnightBSD$

PORTNAME=	libexif
PORTVERSION=	0.6.21
PORTREVISION=	1
CATEGORIES=	graphics
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library to read digital camera file meta-data

LICENSE=	lgpl

OPTIONS_DEFINE=	DOCS NLS

USES=		gmake pathfix pkgconfig
USE_BZIP2=	yes
USE_GNOME=	ltverhack
USE_AUTOTOOLS=	libtool
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
CONFIGURE_ARGS=	--disable-docs
USE_LDCONFIG=	yes

PORTDOCS=	AUTHORS ChangeLog NEWS README

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MNLS}
USES+=		gettext
PLIST_SUB+=	NLS=""
.else
CONFIGURE_ENV+=	am_cv_func_iconv=no
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=	NLS="@comment "
.endif

post-patch:
	@${REINPLACE_CMD} -e '/^SUBDIRS =/s|doc||g ; \
		 /^am__installdirs =/s|$$(docdir)||g ; \
		 /^install-data-am:/s|install-docDATA||g' ${WRKSRC}/Makefile.in

post-install:
	@${MKDIR} ${DOCSDIR}
.for file in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/${file} ${DOCSDIR}
.endfor

.include <bsd.port.mk>
