# $MidnightBSD$
# $FreeBSD: ports/net/ortp/Makefile,v 1.13 2007/03/25 16:47:00 pav Exp $

PORTNAME=	ortp
PORTVERSION=	0.23.0
PORTREVISION=	2
CATEGORIES=	net
MASTER_SITES=	SAVANNAH/linphone/ortp/sources

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Real-time Transport Protocol (RTP) library

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libsrtp.so:${PORTSDIR}/net/libsrtp \
		libzrtpcppcore.so:${PORTSDIR}/security/libzrtpcppcore

CONFLICTS_INSTALL=	linphone-base-[0-9]*

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-silent-rules --disable-strict \
		--enable-zrtp --with-srtp
INSTALL_TARGET=	install-strip
USES=		libtool pathfix pkgconfig
USE_LDCONFIG=	yes

.include <bsd.port.mk>
