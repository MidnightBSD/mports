#
# $MidnightBSD: ports/textproc/ebook-tools/Makefile,v 1.1 2008/08/09 16:52:22 miwi Exp $
#

PORTNAME=	ebook-tools
PORTVERSION=	0.1.1
CATEGORIES=	textproc kde
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Accessing and converting various ebook file formats
LICENSE=	mit

LIB_DEPENDS=	zip.1:${PORTSDIR}/archivers/libzip

USE_KDE4=	kdehier kdeprefix
USE_CMAKE=	yes
CMAKE_VERBOSE=	yes
USE_LDCONFIG=	yes
USE_GNOME=	libxml2 pkgconfig

post-extract:
	${MKDIR}	${WRKSRC}/build

.include <bsd.port.mk>
