# New ports collection makefile for:	xar
# Date created:		24 January 2005
# Whom:			Jeffrey H. Johnson <CPE1704TKS@bellsouth.net>
#
# $MidnightBSD: mports/archivers/xar/Makefile,v 1.3 2008/03/12 01:59:22 laffer1 Exp $
# $FreeBSD: ports/archivers/xar/Makefile,v 1.3 2006/12/13 12:41:19 roam Exp $
#

PORTNAME=	xar
PORTVERSION=	1.5.2
CATEGORIES=	archivers
MASTER_SITES=	${MASTER_SITE_GOOGLE_CODE} \
		${MASTER_SITE_GENTOO}
MASTER_SITE_SUBDIR=	distfiles

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OpenDarwin XML eXtensible ARchiver
LICENSE=	bsd3

USE_LDCONFIG=	yes

USE_GNOME=	libxml2
USE_GMAKE=	yes
USE_OPENSSL=	yes

GNU_CONFIGURE=	yes

MAN1=		xar.1

.include <bsd.port.mk>
