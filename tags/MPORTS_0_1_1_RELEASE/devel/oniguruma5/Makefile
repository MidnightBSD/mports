# New ports collection makefile for:	oniguruma
# Date created:	18. September 2007
# Whom:		Stevan Tiefert
#
# $MidnightBSD$
#

PORTNAME=	oniguruma
PORTVERSION=	5.9.0
CATEGORIES=	devel
MASTER_SITES=	http://www.geocities.jp/kosako3/oniguruma/archive/
DISTNAME=	onig-${PORTVERSION}
WRKSRC=		${WRKDIR}/onig-5.9.0
USE_AUTOTOOLS=	automake:19
USE_AUTOTOOLS=	aclocal:19
USE_AUTOTOOLS=	libtool:15
GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_LDCONFIG=	yes

MAINTAINER=	stevan_tiefert_midnight@yahoo.de
COMMENT=	Oniguruma is a regular expressions library.

.include <bsd.port.mk>
