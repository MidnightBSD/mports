# New ports collection makefile for:	wmsmixer
# Date created:				2 April 2001
# Whom:					Konstantinos Konstantinidis <kkonstan@daemon.gr>
#
# $MidnightBSD$
# $FreeBSD: ports/audio/wmsmixer/Makefile,v 1.9 2006/05/25 21:57:23 pav Exp $
#

PORTNAME=	wmsmixer
PORTVERSION=	0.5.1
CATEGORIES=	audio windowmaker
MASTER_SITES=	http://www.hibernaculum.net/download/ \
		http://dockapps.org/download.php/id/268/

MAINTAINER=	ports@midnightbsd.org
COMMENT=	An audio mixer for the WindowMaker dock

PLIST_FILES=	bin/wmsmixer
USE_XPM=	YES
USE_IMAKE=	YES
MAKE_ARGS=	CC="${CXX}" CFLAGS="${CXXFLAGS}"

.include <bsd.port.mk>
