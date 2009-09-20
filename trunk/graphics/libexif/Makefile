# New ports collection makefile for:    libexif
# Date created:        Tue Feb 26 19:02:44 MST 2002
# Whom:                Peter Schmiedeskamp
#
# $FreeBSD: ports/graphics/libexif/Makefile,v 1.25 2006/03/29 06:54:33 pav Exp $
# $MidnightBSD: mports/graphics/libexif/Makefile,v 1.2 2008/03/28 02:48:08 laffer1 Exp $
#

PORTNAME=	libexif
PORTVERSION=	0.6.15
CATEGORIES=	graphics
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library to read digital camera file meta-data
LICENSE=	lgpl

USE_AUTOTOOLS=	libtool:22
USE_BZIP2=	yes
USE_GNOME=	gnomehack gnometarget pkgconfig ltverhack
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include"
USE_LDCONFIG=	yes

.if !defined(WITHOUT_NLS)
USE_GETTEXT=	yes
PLIST_SUB+=	NLS=""
CONFIGURE_ENV+=	LIBS="-L${LOCALBASE}/lib -lintl"
.else
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=	NLS="@comment "
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|-g -Wall||g' ${WRKSRC}/configure

.include <bsd.port.mk>
