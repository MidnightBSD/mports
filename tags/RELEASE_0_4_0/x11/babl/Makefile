# $MidnightBSD: mports/x11/babl/Makefile,v 1.7 2012/03/02 02:25:04 laffer1 Exp $

PORTNAME=	babl
PORTVERSION=	0.1.10
CATEGORIES=	x11
MASTER_SITES=	ftp://ftp.gimp.org/pub/%SUBDIR%/ \
		http://gimp.mirrors.hoobly.com/%SUBDIR%/ \
		http://ftp.gwdg.de/pub/misc/grafik/gimp/%SUBDIR%/ \
		ftp://ftp.fh-heilbronn.de/mirrors/ftp.gimp.org/%SUBDIR%/ \
		ftp://ftp.insync.net/pub/mirrors/ftp.gimp.org/%SUBDIR%/ \
		http://www.mirrorservice.org/sites/ftp.gimp.org/pub/%SUBDIR%/ \
		${MASTER_SITE_RINGSERVER:S,%SUBDIR%,graphics/%SUBDIR%,}
MASTER_SITE_SUBDIR=	babl/${PORTVERSION:R}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Dynamic pixel format conversion library
LICENSE=	gpl3

USE_LDCONFIG=	yes
USE_BZIP2=	yes
USE_AUTOTOOLS=	libtool
USE_GNOME=	ltverhack
USE_PKGCONFIG=	build
USE_PATHFIX=	yes
USE_GMAKE=	yes
CONFIGURE_ARGS=	--disable-introspection

OPTIONS_DEFINE=	SIMD

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MSIMD}
CONFIGURE_ARGS+=--disable-mmx \
		--disable-sse \
		--disable-altivec
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|x86_64|amd64|g' \
		${WRKSRC}/configure

.include <bsd.port.mk>
