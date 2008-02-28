# New ports collection makefile for:	wmsmixer
# Date created:				2 April 2001
# Whom:					Konstantinos Konstantinidis <kkonstan@daemon.gr>
#
# $MidnightBSD: mports/audio/wmsmixer/Makefile,v 1.1 2006/09/29 15:06:39 wintellect Exp $
# $FreeBSD: ports/audio/wmsmixer/Makefile,v 1.9 2006/05/25 21:57:23 pav Exp $
#

PORTNAME=	wmsmixer
PORTVERSION=	0.5.1
CATEGORIES=	audio windowmaker
MASTER_SITES=	http://www.hibernaculum.net/download/

MAINTAINER=	ports@midnightbsd.org
COMMENT=	An audio mixer for the WindowMaker dock

PLIST_FILES=	bin/wmsmixer
USE_XPM=	YES
USE_IMAKE=	YES
MAKE_ARGS=	CC="${CXX}" CFLAGS="${CXXFLAGS}"

.include <bsd.port.mk>
