# New ports collection makefile for:	libogg
# Date created:				18 October 2000
# Whom:					t.vanklaveren@student.utwente.nl
#
# $MidnightBSD: mports/audio/libogg/Makefile,v 1.1 2006/10/03 16:00:04 wintellect Exp $
# $FreeBSD: ports/audio/libogg/Makefile,v 1.27 2006/02/23 10:34:35 ade Exp $
#

PORTNAME=	libogg
PORTVERSION=	1.1.3
PORTEPOCH=	3
CATEGORIES=	audio
MASTER_SITES=	http://downloads.xiph.org/releases/ogg/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ogg bitstream library

USE_AUTOTOOLS=        libtool:15
GNU_CONFIGURE=	yes
USE_GNOME=	gnomehack
INSTALLS_SHLIB=	yes

.if defined(NOPORTDOCS)
MAKE_ENV=	DOC=""
.else
MAKE_ENV=	DOC=doc
.endif

.include <bsd.port.mk>
