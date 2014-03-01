# $MidnightBSD$
# $FreeBSD: ports/audio/libaudiofile/Makefile,v 1.38 2004/03/07 04:35:35 marcus Exp $

PORTNAME=	libaudiofile
PORTVERSION=	0.3.6
CATEGORIES=	audio
MASTER_SITES=	http://www.68k.org/~michael/audiofile/ \
		ftp://oss.sgi.com/projects/audiofile/download/ \
		GNOME
DISTNAME=	audiofile-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A sound library for SGI audio file

LICENSE=	lgpl2.1

USES=		pathfix pkgconfig
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool
GNU_CONFIGURE=	yes

CONFLICTS=	osalp-0.7.*

.include <bsd.port.mk>
