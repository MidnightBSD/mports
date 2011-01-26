# New ports collection makefile for:	linux-nvu
# Date created:				2004-05-10
# Whom:					Ilya Khamushkin
#
# $MidnightBSD: mports/www/linux-nvu/Makefile,v 1.1 2008/03/04 19:04:05 laffer1 Exp $
# $FreeBSD: ports/www/linux-nvu/Makefile,v 1.6 2006/08/08 13:17:09 sat Exp $
#

PORTNAME=	nvu
PORTVERSION=	1.0
DISTVERSIONSUFFIX=	-pc-linux2.6.10-gnu
CATEGORIES=	www
MASTER_SITES=	http://cvs.nvu.com/download/ CSME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A complete Web Authoring System
LICENSE=	mpl

USE_BZIP2=	yes
WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

.include "${.CURDIR}/../linux-seamonkey/Makefile.common"
.include <bsd.port.mk>
