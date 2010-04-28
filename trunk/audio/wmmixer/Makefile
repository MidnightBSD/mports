# New ports collection makefile for:   wmmixer
# Date created:        11 July 1998
# Whom:                Rich Neswold <rneswold@mcs.net>
#
# $FreeBSD: ports/audio/wmmixer/Makefile,v 1.17 2008/04/19 17:46:37 miwi Exp $
#

PORTNAME=	wmmixer
PORTVERSION=	1.0b1
PORTREVISION=	1
CATEGORIES=	audio windowmaker
MASTER_SITES=	ftp://ftp.aranei.com/pub/FreeBSD/distfiles/
DISTNAME=	${PORTNAME}-1.0-beta1
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@FreeBSD.org
COMMENT=	An audio mixer for the WindowMaker dock

PLIST_FILES=		bin/wmmixer
WRKSRC=			${WRKDIR}/wmmixer
USE_IMAKE=		yes
USE_XORG=		xpm
NO_INSTALL_MANPAGES=	yes

.include <bsd.port.mk>
