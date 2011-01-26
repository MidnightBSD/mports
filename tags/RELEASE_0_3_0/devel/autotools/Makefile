# $MidnightBSD: mports/devel/autotools/Makefile,v 1.5 2009/10/13 03:17:18 laffer1 Exp $

PORTNAME=	autotools
PORTVERSION=	20091013
CATEGORIES=	devel
MASTER_SITES=	# none
DISTFILES=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Autotools meta-port
LICENSE=	agg

RUN_DEPENDS=	libtool:${PORTSDIR}/devel/libtool22

PLIST_FILES=	share/${PORTNAME}
NO_BUILD=	yes
NO_FETCH=	yes

AVAIL_AUTOCONF=	2.13 2.62 2.63
AVAIL_AUTOMAKE=	1.4 1.5 1.6 1.9 1.10

.for VER in ${AVAIL_AUTOCONF}
RUN_DEPENDS+=	autoconf-${VER}:${PORTSDIR}/devel/autoconf${VER:C/\.//}
.endfor

.for VER in ${AVAIL_AUTOMAKE}
RUN_DEPENDS+=	automake-${VER}:${PORTSDIR}/devel/automake${VER:C/\.//}
.endfor

do-install:
	@${ECHO_CMD} "Placeholder file" > ${PREFIX}/${PLIST_FILES}

.include <bsd.port.mk>
