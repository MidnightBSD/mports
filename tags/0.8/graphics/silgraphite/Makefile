# Created by: Dennis Herrmann <adox@mcx2.org>
# $FreeBSD: head/graphics/silgraphite/Makefile 389370 2015-06-13 13:52:03Z sunpoet $
# $MidnightBSD$

PORTNAME=	silgraphite
PORTVERSION=	2.3.1
CATEGORIES=	graphics devel
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Font engine for complex non-Roman writing systems

LICENSE=	lgpl2.1

OPTIONS_DEFINE=	FREETYPE
OPTIONS_DEFAULT=FREETYPE
OPTIONS_SUB=	yes

CONFIGURE_ARGS=	--without-xft --without-pangographite
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
USE_LDCONFIG=	yes
USES=		libtool pathfix pkgconfig

FREETYPE_CONFIGURE_WITH=freetype
FREETYPE_LIB_DEPENDS=	libfreetype.so:${PORTSDIR}/print/freetype2
FREETYPE_USES=		iconv

.include <bsd.port.mk>
