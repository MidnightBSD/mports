# $MidnightBSD$

PORTNAME=	dirac
PORTVERSION=	1.0.2
PORTREVISION?=	0
CATEGORIES=	multimedia
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}-codec/Dirac-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT?=	Open source video codec from the BBC
LICENSE=	mpl

USE_AUTOTOOLS=	libtool:22
GNU_CONFIGURE=	yes
USE_GMAKE=	yes
MAKE_JOBS_SAFE=	yes
USE_GNOME=	pkgconfig gnomehack gnometarget
USE_LDCONFIG=	yes

CONFIGURE_ENV?=	CPPFLAGS=-I${LOCALBASE}/include \
		HAVE_LATEX=${FALSE} HAVE_DVIPDFM=${FALSE} \
		HAVE_DOXYGEN=${FALSE} HAVE_DOT=${FALSE}

.include <bsd.port.mk>
