# New ports collection makefile for:	oniguruma
# Date created:	18. September 2007
# Whom:		Stevan Tiefert
#
# $MidnightBSD: mports/devel/oniguruma5/Makefile,v 1.2 2008/10/13 21:00:59 ctriv Exp $
#

PORTNAME=	oniguruma
PORTVERSION=	5.9.0
CATEGORIES=	devel
MASTER_SITES=	http://www.geocities.jp/kosako3/oniguruma/archive/
DISTNAME=	onig-${PORTVERSION}
WRKSRC=		${WRKDIR}/onig-5.9.0
USE_AUTOTOOLS=	automake:19
USE_AUTOTOOLS=	aclocal:19
USE_AUTOTOOLS=	libtool:22
GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_LDCONFIG=	yes

MAINTAINER=	stevan_tiefert_midnight@yahoo.de
COMMENT=	Oniguruma is a regular expressions library.
LICENSE=	bsd2

.include <bsd.port.mk>
