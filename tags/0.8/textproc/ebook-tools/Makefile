# $MidnightBSD$

PORTNAME=	ebook-tools
PORTVERSION=	0.2.2
PORTREVISION=	1
CATEGORIES=	textproc
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Accessing and converting various ebook file formats

LICENSE=	mit

LIB_DEPENDS=	libzip.so:${PORTSDIR}/archivers/libzip

USES=		cmake
USE_LDCONFIG=	yes
USE_GNOME=	libxml2

post-extract:
	${MKDIR}	${WRKSRC}/build

.include <bsd.port.mk>
