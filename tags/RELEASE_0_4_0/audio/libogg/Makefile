# $MidnightBSD: mports/audio/libogg/Makefile,v 1.9 2011/02/02 20:03:23 laffer1 Exp $

PORTNAME=	libogg
PORTVERSION=	1.2.2
PORTEPOCH=	4
CATEGORIES=	audio
MASTER_SITES=	http://downloads.xiph.org/releases/ogg/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ogg bitstream library
LICENSE=	bsd3

USE_AUTOTOOLS=	libtool
GNU_CONFIGURE=	yes
USE_GNOME=	gnomehack
USE_LDCONFIG=	yes
MAKE_JOBS_SAFE=	yes

.if defined(NOPORTDOCS)
MAKE_ENV=	DOC=""
.else
MAKE_ENV=	DOC=doc
.endif

.include <bsd.port.mk>
