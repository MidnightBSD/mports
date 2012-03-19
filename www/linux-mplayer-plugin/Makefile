# New ports collection makefile for:	linux-mplayerplug-in
# Date Created:		17 June 2006
# Whom:			Andrew Pantyukhin <infofarmer@FreeBSD.org>
#
# $MidnightBSD: mports/www/linux-mplayer-plugin/Makefile,v 1.3 2010/05/29 06:30:38 laffer1 Exp $
# $FreeBSD: ports/www/linux-mplayer-plugin/Makefile,v 1.6 2007/02/06 00:19:32 sat Exp $
#

PORTNAME=	mplayerplug-in
PORTVERSION=	3.55
PORTREVISION=	3
DISTVERSIONSUFFIX=	-1.rh9.rf
CATEGORIES=	www multimedia
MASTER_SITES=	CENKES http://apt.sw.be/packages/mplayerplug-in/ \
		ftp://fr2.rpmfind.net/linux/dag/redhat/9/en/i386/dag/RPMS/
PKGNAMEPREFIX=	linux-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Embed MPlayer into browser
LICENSE=	unknown

RUN_DEPENDS=	mplayer:${PORTSDIR}/multimedia/mplayer

NO_BUILD=	yes
USE_LINUX_RPM=	yes
USE_LINUX_APPS=	atk gtk2 pango xorglibs
PREFIX?=	${LOCALBASE}
SRC_DISTFILES=
DIST_SUBDIR=   rpm

USE_NPAPI=	linux
NPAPI_WRKSRC=	${WRKDIR}/usr/lib/mozilla/plugins
NPAPI_FILES=	${PLUGINS_EXT:S/^/${PORTNAME}/}
PLUGINS_EXT=	.so .xpt -dvx.so -dvx.xpt -qt.so -qt.xpt -rm.so -rm.xpt -wmp.so -wmp.xpt

.include "${.CURDIR}/Makefile.npapi"
.include <bsd.port.mk>
