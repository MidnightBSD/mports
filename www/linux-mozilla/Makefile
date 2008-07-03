# New ports collection makefile for:	linux-mozilla
# Date created:				2001-11-24
# Whom:					trevor
#
# $MidnightBSD: mports/www/linux-mozilla/Makefile,v 1.1 2006/09/23 22:41:48 laffer1 Exp $
# $FreeBSD: ports/www/linux-mozilla/Makefile,v 1.52 2006/07/30 00:09:54 sat Exp $
#

PORTNAME=	mozilla
PORTVERSION=	1.7.13
DISTVERSIONPREFIX=	i686-pc-linux-gnu-
PORTREVISION=	2
CATEGORIES=	www
MASTER_SITE_SUBDIR=	${PORTNAME}/releases/${PORTNAME}${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The open source, standards compliant web browser
LICENSE=	mpl

RUN_DEPENDS=	${LINUXBASE}/usr/lib/libgtk-1.2.so.0:${PORTSDIR}/x11-toolkits/linux-gtk

.include "${.CURDIR}/../linux-seamonkey/Makefile.common"
.include <bsd.port.mk>
