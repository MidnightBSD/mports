# $MidnightBSD: mports/audio/libofa/Makefile,v 1.9 2013/03/20 12:46:56 laffer1 Exp $

PORTNAME=	libofa
PORTVERSION=	0.9.3
PORTREVISION=	5
CATEGORIES=	audio
MASTER_SITES=	GOOGLE_CODE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The Open Fingerprint Architecture Library
LICENSE=	gpl2

LIB_DEPENDS=	fftw3:${PORTSDIR}/math/fftw3 \
		expat:${PORTSDIR}/textproc/expat2 \
		curl:${PORTSDIR}/ftp/curl

PROJECTHOST=	musicip-libofa
USE_DOS2UNIX=	yes
USE_AUTOTOOLS=	libtool
USE_PATHFIX=	yes
USE_PKGCONFIG=	yes
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
MAKE_JOBS_SAFE=	yes
USE_LDCONFIG=	yes

.include <bsd.port.mk>
