# New ports collection makefile for:	oniguruma
# Date created:	18. September 2007
# Whom:		Stevan Tiefert
#
# $MidnightBSD: mports/devel/oniguruma5/Makefile,v 1.4 2011/02/02 20:17:33 laffer1 Exp $
#

PORTNAME=	oniguruma
PORTVERSION=	5.9.0
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	http://www.geocities.jp/kosako3/oniguruma/archive/
PKGNAMESUFFIX=	5
DISTNAME=	onig-${PORTVERSION}

MAINTAINER=	stevan_tiefert_midnight@yahoo.de
COMMENT=	Oniguruma is a regular expressions library
LICENSE=	bsd2

WRKSRC=		${WRKDIR}/onig-5.9.0

USE_AUTOTOOLS=	automake aclocal libtool
GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_LDCONFIG=	yes

.include <bsd.port.mk>
