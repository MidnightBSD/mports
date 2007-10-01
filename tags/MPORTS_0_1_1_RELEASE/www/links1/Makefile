# New ports collection makefile for:	links
# Date created:		21 January 2000
# Whom:			Michael Vasilenko <acid@stu.cn.ua>
#
# $MidnightBSD: mports/www/links1/Makefile,v 1.6 2007/07/19 04:30:17 laffer1 Exp $
# $FreeBSD: ports/www/links1/Makefile,v 1.5 2006/05/14 02:04:43 edwin Exp $
#

PORTNAME=	links
PORTVERSION=	1.00pre20
PORTEPOCH=	1
CATEGORIES=	www
MASTER_SITES=	http://artax.karlin.mff.cuni.cz/~mikulas/vyplody/links/download/ \
		${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	links

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lynx-like text WWW browser

GNU_CONFIGURE=	yes

USE_OPENSSL=	yes
NO_LATEST_LINK=	yes

MAN1=		links.1

.include <bsd.port.mk>
