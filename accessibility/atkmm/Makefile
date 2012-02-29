# $MidnightBSD: mports/accessibility/atkmm/Makefile,v 1.1 2011/05/15 16:08:52 laffer1 Exp $
# $FreeBSD: ports/accessibility/atkmm/Makefile,v 1.2 2010/11/27 06:01:37 marcus Exp $
#

PORTNAME=	atkmm
PORTVERSION=	2.22.5
CATEGORIES=	accessibility gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C++ wrapper for ATK API library
LICENSE=	lgpl

LIB_DEPENDS=	glibmm-2.4.1:${PORTSDIR}/devel/glibmm

USE_BZIP2=	yes
USE_LDCONFIG=	yes
USE_GMAKE=	yes
MAKE_JOBS_SAFE=	yes
USE_GNOME=	gnomehack atk
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include " \
		LDFLAGS="-L${LOCALBASE}/lib"
CONFIGURE_ARGS=	--disable-documentation

.include <bsd.port.mk>
