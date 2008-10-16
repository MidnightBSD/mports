# ex:ts=8
# New ports collection makefile for:	libt1
# Date created:			13, May, 1999
# Whom:				Ying-Chieh Liao <ijliao@csie.nctu.edu.tw>
#
# $MidnightBSD: mports/devel/t1lib/Makefile,v 1.1 2006/09/25 02:43:43 laffer1 Exp $
# $FreeBSD: ports/devel/t1lib/Makefile,v 1.33 2006/08/14 22:55:17 clsung Exp $
#

PORTNAME=	t1lib
PORTVERSION=	5.1.0
PORTREVISION=	1
PORTEPOCH=	1
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_SUNSITE}
MASTER_SITE_SUBDIR=	libs/graphics

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A Type 1 Rasterizer Library for UNIX/X11
LICENSE=	gpl2

USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool:15
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0
ALL_TARGET=	without_doc
USE_LDCONFIG=	yes

.if !defined(WITHOUT_X11)
USE_XLIB=	yes
CONFIGURE_ARGS+=	--with-x
PLIST_SUB+=	X11=""
.else
CONFIGURE_ARGS+=	--without-x
PLIST_SUB+=	X11="@comment "
.endif

post-patch:
	@${FIND} ${WRKSRC} -name "Makefile.in" | ${XARGS} ${REINPLACE_CMD} -e \
		's|^LIBTOOL[ ]*=.*|LIBTOOL=${LIBTOOL}|g'

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/t1lib_doc.pdf ${DOCSDIR}
.endif

.include <bsd.port.mk>
