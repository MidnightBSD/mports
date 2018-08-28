# $MidnightBSD$
# $FreeBSD: ports/devel/libconfuse/Makefile,v 1.7 2008/04/25 12:50:35 garga Exp $

PORTNAME=	libconfuse
PORTVERSION=	2.7
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	SAVANNAH/confuse
DISTNAME=	confuse-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Configuration file parsing library

LICENSE=	iscl

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-nls --enable-shared
INSTALL_TARGET=	install-strip
USES=		iconv pathfix pkgconfig libtool
USE_LDCONFIG=	yes

.include <bsd.port.mk>
