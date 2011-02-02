# New ports collection makefile for:	oniguruma
# Date created:	18. September 2007
# Whom:		Stevan Tiefert
#
# $MidnightBSD: mports/devel/oniguruma5/Makefile,v 1.3 2009/09/20 00:51:32 laffer1 Exp $
#

PORTNAME=	oniguruma
PORTVERSION=	5.9.0
CATEGORIES=	devel
MASTER_SITES=	http://www.geocities.jp/kosako3/oniguruma/archive/
DISTNAME=	onig-${PORTVERSION}
WRKSRC=		${WRKDIR}/onig-5.9.0
USE_AUTOTOOLS=	automake
USE_AUTOTOOLS=	aclocal
USE_AUTOTOOLS=	libtool
GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_LDCONFIG=	yes

MAINTAINER=	stevan_tiefert_midnight@yahoo.de
COMMENT=	Oniguruma is a regular expressions library.
LICENSE=	bsd2

.include <bsd.port.mk>
