# $MidnightBSD: mports/devel/libical/Makefile,v 1.6 2010/08/02 23:10:28 laffer1 Exp $

PORTNAME=	libical
PORTVERSION=	0.44
CATEGORIES=	devel
MASTER_SITES=	SF/freeassociation/${PORTNAME}/${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An implementation of the IETF's Calendaring and Scheduling protocols 
LICENSE=	lgpl

USE_GNOME=	gnomehack
USE_AUTOTOOLS=	libtool
GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_PERL5_BUILD=yes
USE_LDCONFIG=	yes
CONFIGURE_ENV+= CPPFLAGS="${CPPFLAGS} -I${LOCALBASE}/include"

.if !defined(WITHOUT_PYTHON)
CONFIGURE_ARGS=	--enable-python=yes
USE_PYTHON=	yes
.else
CONFIGURE_ARGS=	--enable-python=no
.endif

.include <bsd.port.pre.mk>
.if ${ARCH} == "amd64" || ${ARCH} == "ia64"
CONFIGURE_ENV+=	CFLAGS="${CFLAGS} -fPIC"
.endif

.include <bsd.port.post.mk>
