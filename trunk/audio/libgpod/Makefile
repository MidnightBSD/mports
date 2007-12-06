# New ports collection makefile for:	libgpod
# Date created:				Wed Jan 1 00:48:58 EST 2006
# Whom:					Devon Ryan <dpryan@dpryan.com>
#
# $MidnightBSD$
# $FreeBSD: ports/audio/libgpod/Makefile,v 1.16 2007/08/04 11:40:39 gabor Exp $
#

PORTNAME=	libgpod
PORTVERSION=	0.5.2
CATEGORIES=	audio
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	gtkpod

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A library for direct access of iPod's contents
LICENSE=	lgpl

USE_GNOME=	gtk20
USE_GETTEXT=	yes
USE_GMAKE=	yes
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
# Disable python bindings for now, something does not work there
CONFIGURE_ARGS=	--without-python

.if !defined(NOPORTDOCS)
CONFIGURE_ARGS+=	--with-html-dir="${PREFIX}/share/doc"
.endif

post-extract: .SILENT
	${REINPLACE_CMD} -e \
		's,libdir)/pkgconfig,prefix)/libdata/pkgconfig,' \
		${WRKSRC}/Makefile.in
.if defined(NOPORTDOCS)
	${REINPLACE_CMD} -e 's, docs,,' ${WRKSRC}/Makefile.in
.endif
	# Stop configure script want Perl and XML::Parser
	${REINPLACE_CMD} '19568,19590d' ${WRKSRC}/configure

.include <bsd.port.mk>
