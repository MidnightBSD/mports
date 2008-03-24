# New ports collection makefile for:	autotools
# Date created:				14th April 2007
# Whom:					Ade Lovett <ade@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/devel/autotools/Makefile,v 1.2 2007/09/30 04:46:42 linimon Exp $

PORTNAME=	autotools
PORTVERSION=	20070905
CATEGORIES=	devel
MASTER_SITES=	# none
DISTFILES=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Autotools meta-port

RUN_DEPENDS=	libtool:${PORTSDIR}/devel/libtool15

PLIST_FILES=	share/${PORTNAME}
NO_BUILD=	yes
NO_FETCH=	yes

AVAIL_AUTOCONF=	2.13 2.61
AVAIL_AUTOMAKE=	1.4 1.5 1.6 1.7 1.8 1.9 1.10

.for VER in ${AVAIL_AUTOCONF}
RUN_DEPENDS+=	autoconf-${VER}:${PORTSDIR}/devel/autoconf${VER:C/\.//}
.endfor

.for VER in ${AVAIL_AUTOMAKE}
RUN_DEPENDS+=	automake-${VER}:${PORTSDIR}/devel/automake${VER:C/\.//}
.endfor

do-install:
	@${ECHO_CMD} "Placeholder file" > ${PREFIX}/${PLIST_FILES}

.include <bsd.port.mk>
