# Created by: Grzegorz Blach <gblach@FreeBSD.org>
# $FreeBSD: head/audio/libmpdclient/Makefile 394837 2015-08-20 07:11:37Z amdmi3 $
# $MidnightBSD$

PORTNAME=	libmpdclient
PORTVERSION=	2.10
CATEGORIES=	audio
MASTER_SITES=	http://www.musicpd.org/download/libmpdclient/2/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	API library for interfacing MPD

LICENSE=	unknown

GNU_CONFIGURE=	yes
USES=		tar:xz gmake libtool pathfix
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip

OPTIONS_DEFINE=	DOCS DOXYGEN
OPTIONS_SUB=	yes
DOXYGEN_IMPLIES=	DOCS

DOXYGEN_BUILD_DEPENDS=	doxygen:${PORTSDIR}/devel/doxygen
DOXYGEN_CONFIGURE_OFF=	--disable-documentation

.include <bsd.port.mk>
