# New ports collection makefile for:   libmodplug
# Date created:		3 February 2004
# Whom:			Emanuel Haupt <ehaupt@critical.ch>
#
# $MidnightBSD$
# $FreeBSD: ports/audio/libmodplug/Makefile,v 1.10 2006/06/29 17:52:14 ehaupt Exp $
#

PORTNAME=	libmodplug
PORTVERSION=	0.8.8.5
PORTREVISION=	2
CATEGORIES=	audio
MASTER_SITES=	SF/modplug-xmms/${PORTNAME}/${PORTVERSION} LOCAL/ehaupt

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ModPlug mod-like music shared libraries
LICENSE=	publicdom

USES=		gmake pathfix pkgconfig libtool
INSTALL_TARGET=	install-strip
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes

post-patch:
	@${REINPLACE_CMD} -e '/^CXXFLAGS=/d' \
		${WRKSRC}/configure

.include <bsd.port.mk>
