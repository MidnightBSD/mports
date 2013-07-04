# New ports collection makefile for:    libexif
# Date created:        Tue Feb 26 19:02:44 MST 2002
# Whom:                Peter Schmiedeskamp
#
# $FreeBSD: ports/graphics/libexif/Makefile,v 1.25 2006/03/29 06:54:33 pav Exp $
# $MidnightBSD: mports/graphics/libexif/Makefile,v 1.4 2010/11/12 14:26:17 laffer1 Exp $
#

PORTNAME=	libexif
PORTVERSION=	0.6.18
PORTREVISION=	1
CATEGORIES=	graphics
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library to read digital camera file meta-data
LICENSE=	lgpl

USE_BZIP2=	yes
USE_GNOME=	gnomehack ltverhack pkgconfig
USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
CONFIGURE_ARGS=	--disable-docs
USE_LDCONFIG=	yes

.if !defined(WITHOUT_NLS)
USE_GETTEXT=	yes
PLIST_SUB+=	NLS=""
.else
CONFIGURE_ENV+=	am_cv_func_iconv=no
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=	NLS="@comment "
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|-g -Wall||g' ${WRKSRC}/configure
	@${REINPLACE_CMD} -e '/^SUBDIRS =/s|doc||g ; \
		 /^am__installdirs =/s|$$(docdir)||g ; \
		 /^install-data-am:/s|install-docDATA||g' ${WRKSRC}/Makefile.in

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for file in AUTHORS ChangeLog NEWS README
	${INSTALL_DATA} ${WRKSRC}/${file} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
