# New ports collection makefile for:	libogg
# Date created:				18 October 2000
# Whom:					t.vanklaveren@student.utwente.nl
#
# $MidnightBSD: mports/audio/libogg/Makefile,v 1.4 2008/02/25 00:11:56 laffer1 Exp $
# $FreeBSD: ports/audio/libogg/Makefile,v 1.27 2006/02/23 10:34:35 ade Exp $
#

PORTNAME=	libogg
PORTVERSION=	1.1.3
PORTREVISION=	1
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
