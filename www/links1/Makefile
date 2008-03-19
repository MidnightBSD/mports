# New ports collection makefile for:	links
# Date created:		21 January 2000
# Whom:			Michael Vasilenko <acid@stu.cn.ua>
#
# $MidnightBSD: mports/www/links1/Makefile,v 1.7 2007/07/19 04:45:38 laffer1 Exp $
# $FreeBSD: ports/www/links1/Makefile,v 1.5 2006/05/14 02:04:43 edwin Exp $
#

PORTNAME=	links
PORTVERSION=	1.00pre20
PORTREVISION=	1
PORTEPOCH=	1
CATEGORIES=	www
MASTER_SITES=	http://www.jikos.cz/~mikulas/links/download/ \
		http://links.sourceforge.net/download/ \
		ftp://ftp.fu-berlin.de/unix/network/www/links/ 
MASTER_SITE_SUBDIR=	links

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lynx-like text WWW browser

GNU_CONFIGURE=	yes

USE_OPENSSL=	yes
NO_LATEST_LINK=	yes

MAN1=		links.1

.include <bsd.port.mk>
