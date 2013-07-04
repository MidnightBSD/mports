# $MidnightBSD: mports/devel/libunicode/Makefile,v 1.1 2010/03/18 00:28:42 laffer1 Exp $

PORTNAME=	libunicode
PORTVERSION=	0.4
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME
MASTER_SITE_SUBDIR=	sources/libunicode/0.4
DISTNAME=	${PORTNAME}-${PORTVERSION}.gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A library for manipulating Unicode characters and strings
LICENSE=	gpl2

USE_AUTOTOOLS=	libtool
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--localstatedir=${PREFIX}/share \
		--datadir=${PREFIX}/share
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LIBS="-L${LOCALBASE}/lib"
WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

.include <bsd.port.mk>
