# $MidnightBSD: mports/textproc/ebook-tools/Makefile,v 1.1 2009/01/04 00:57:04 ctriv Exp $

PORTNAME=	ebook-tools
PORTVERSION=	0.2.2
CATEGORIES=	textproc kde
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Accessing and converting various ebook file formats
LICENSE=	mit

LIB_DEPENDS=	zip:${PORTSDIR}/archivers/libzip

USE_CMAKE=	yes
USE_LDCONFIG=	yes
USE_GNOME=	libxml2

post-extract:
	${MKDIR}	${WRKSRC}/build

.include <bsd.port.mk>
