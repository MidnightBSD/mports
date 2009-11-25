# $MidnightBSD: mports/audio/libogg/Makefile,v 1.5 2009/09/20 00:37:31 laffer1 Exp $

PORTNAME=	libogg
PORTVERSION=	1.1.4
PORTEPOCH=	3
CATEGORIES=	audio
MASTER_SITES=	http://downloads.xiph.org/releases/ogg/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ogg bitstream library
LICENSE=	bsd3

USE_AUTOTOOLS=	libtool:22
GNU_CONFIGURE=	yes
USE_GNOME=	gnomehack
USE_LDCONFIG=	yes

.if defined(NOPORTDOCS)
MAKE_ENV=	DOC=""
.else
MAKE_ENV=	DOC=doc
.endif

.include <bsd.port.mk>
