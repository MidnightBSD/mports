# $MidnightBSD$
# $FreeBSD: ports/print/freetype/Makefile,v 1.40 2007/01/26 15:46:46 shaun Exp $

PORTNAME=	freetype
PORTVERSION=	1.3.1
PORTREVISION=	9
CATEGORIES=	print
MASTER_SITES=	SF \
		http://sunsite.cnlab-switch.ch/ftp/mirror/freetype/freetype1/ \
		http://www.funet.fi/pub/mirrors/ftp.freetype.org/freetype1/ \
		http://ftp.sunet.se/pub/text-processing/freetype/freetype1/ \
		ftp://ftp.freetype.org/freetype/freetupe1/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Free and portable TrueType font rendering engine

LICENSE=	freetype
LICENSE_NAME=	The FreeType Project LICENSE
LICENSE_FILE=	${WRKSRC}/license.txt
LICENSE_PERMS=	dist-mirror

FAKE_OPTS+=	prefixhack

USES=		cpe libtool
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--disable-nls --enable-static --enable-shared

.include <bsd.port.mk>
