# $MidnightBSD: mports/audio/libaudiofile/Makefile,v 1.7 2011/03/18 19:46:43 laffer1 Exp $
# $FreeBSD: ports/audio/libaudiofile/Makefile,v 1.38 2004/03/07 04:35:35 marcus Exp $

PORTNAME=	libaudiofile
PORTVERSION=	0.2.7
CATEGORIES=	audio
MASTER_SITES=	http://www.68k.org/~michael/audiofile/ \
		ftp://oss.sgi.com/projects/audiofile/download/ \
		GNOME
DISTNAME=	audiofile-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A sound library for SGI audio file
LICENSE=	gpl2

USE_GNOME=	gnomehack  pkgconfig
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool
GNU_CONFIGURE=	yes

CONFLICTS=	osalp-0.7.*

.include <bsd.port.mk>
