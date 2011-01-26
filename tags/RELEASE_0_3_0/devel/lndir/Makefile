# New ports collection makefile for:	lndir
# Date Created:				16 Oct 2007
# Whom:					Lucas Holt <luke@MidnightBSD.org>
#
# $MidnightBSD: mports/devel/lndir/Makefile,v 1.2 2007/12/06 00:31:13 laffer1 Exp $
#

PORTNAME=	lndir
PORTVERSION=	1.0.1
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Create a shadow directory of symbolic links to another directory tree
LICENSE=	unknown
# The license is not cleary stated.

BUILD_DEPENDS=	pkg-config:${PORTSDIR}/devel/pkg-config

MAKE_JOBS_SAFE=	yes
XORG_CAT=	util
USE_XORG=	xproto

PLIST_FILES=	bin/lndir

MAN1=		lndir.1

.include <bsd.port.mk>
