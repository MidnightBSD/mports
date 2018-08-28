# $FreeBSD: ports/devel/libthai/Makefile,v 1.3 2006/03/31 10:01:33 garga Exp $
# $MidnightBSD$

PORTNAME=	libthai
PORTVERSION=	0.1.22
CATEGORIES=	devel
MASTER_SITES=	http://linux.thai.net/pub/thailinux/software/libthai/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Thai language support library

LICENSE=	lgpl2.1

LIB_DEPENDS=	libdatrie.so:${PORTSDIR}/devel/libdatrie

USES=		gmake libtool pathfix pkgconfig tar:xz
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip

OPTIONS_DEFINE=	DOXYGEN
OPTIONS_SUB=	yes

DOXYGEN_BUILD_DEPENDS=	doxygen:${PORTSDIR}/devel/doxygen
DOXYGEN_CONFIGURE_ENABLE=	doxygen-doc

.include <bsd.port.mk>
