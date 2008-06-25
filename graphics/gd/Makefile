# New ports collection makefile for:	gd
# Date created:				27 Mar 1998
# Whom:					jeff@cetlink.net
#
# $MidnightBSD: mports/graphics/gd/Makefile,v 1.2 2007/04/27 18:50:41 ctriv Exp $
# $FreeBSD: ports/graphics/gd/Makefile,v 1.78 2005/12/18 10:30:10 dinoex Exp $
#

PORTNAME=	gd
PORTVERSION=	2.0.35
PORTREVISION?=	0
PORTEPOCH=	1
CATEGORIES+=	graphics
MASTER_SITES=	http://www.libgd.org/releases/
MASTER_SITE_SUBDIR=	graphics/gd
PKGNAMESUFFIX?=	${NOX11_SUFFIX}${PKGNAMESUFFIX2}

MAINTAINER?=	ports@MidnightBSD.org
COMMENT?=	A graphics library for fast creation of images
LICENSE=	agg

LIB_DEPENDS=	jpeg.9:${PORTSDIR}/graphics/jpeg \
		png.5:${PORTSDIR}/graphics/png \
		freetype.9:${PORTSDIR}/print/freetype2

MAKE_ENV=	WRKSRC="${WRKSRC}" CC="${CC}" CFLAGS="${CFLAGS}" CPPFLAGS="${CPPFLAGS}" LDFLAGS="${LDFLAGS}"
MAKEFILE=	${FILESDIR}/Makefile.bsd
USE_LDCONFIG=	yes
SCRIPTDIR=	${FILESDIR}
CPPFLAGS+=	-DHAVE_FT2BUILD_H
FAKE_OPTS=	trueprefix
WANT_PERL=	yes

.include <bsd.port.pre.mk>

.if defined(WITH_XPM) && !defined(WITHOUT_X11)
USE_XORG=	xpm x11
CPPFLAGS+=	-I${LOCALBASE}/include/X11 -I${LOCALBASE}/include -DHAVE_LIBXPM
LDFLAGS+=	-L${LOCALBASE}/lib -lXpm -lX11
LDFLAGS2=	-L${PREFIX}/lib -L${LOCALBASE}/lib
FEATURES=	GD_XPM GD_JPEG GD_FONTCONFIG GD_FREETYPE GD_GIF GD_PNG
.else
LDFLAGS2=	-L${PREFIX}/lib -L${LOCALBASE}/lib
FEATURES=	GD_JPEG GD_FONTCONFIG GD_FREETYPE GD_GIF GD_PNG
.endif

.if defined(GD_FONTS)
USE_PERL5_BUILD=	yes
SCRIPTS_ENV+=		GD_FONTS="${GD_FONTS}"
.endif

pre-everything::
	@${ECHO_MSG} "gd has the following tunables:"
	@${ECHO_MSG} "	WITH_XPM=yes			Turns on Xpm support"

post-configure:
	${SED} -e 's|@libdir@|${PREFIX}/lib|' \
		-e 's|@includedir@|${PREFIX}/include|' \
		-e 's|@VERSION@|${PORTVERSION}|' \
		-e 's|@GDLIB_MAJOR@|${PORTVERSION:C/([0-9]*).*/\1/1}|' \
		-e 's|@GDLIB_MINOR@|${PORTVERSION:C/[0-9]*[.]([0-9]).*/\1/1}|' \
		-e 's|@GDLIB_REVISION@|${PORTVERSION:C/.*[.]([0-9]*)/\1/1}|' \
		-e 's|@LDFLAGS@|${LDFLAGS2}|' \
		-e 's|@LIBS@|-lgd|' \
		-e 's|@FEATURES@|${FEATURES}|' \
		${WRKSRC}/config/gdlib-config.in \
		> ${WRKDIR}/gdlib-config

post-install:
	${INSTALL_DATA} ${WRKSRC}/gdfx.h ${WRKSRC}/gdhelpers.h \
		${PREFIX}/include/
	${INSTALL_SCRIPT} ${WRKDIR}/gdlib-config ${PREFIX}/bin/
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/index.html ${DOCSDIR}
.endif

.include <bsd.port.post.mk>
