# $MidnightBSD: mports/devel/autotools/Makefile,v 1.6 2009/10/13 03:17:48 laffer1 Exp $

PORTNAME=	autotools
PORTVERSION=	20101016
CATEGORIES=	devel
MASTER_SITES=	# none
DISTFILES=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Autotools meta-port
LICENSE=	agg

RUN_DEPENDS=	libtool:${PORTSDIR}/devel/libtool \
		autoconf-2.13:${PORTSDIR}/devel/autoconf213 \
		autoconf-2.68:${PORTSDIR}/devel/autoconf \
		automake-1.4:${PORTSDIR}/devel/automake14 \
		automake-1.11:${PORTSDIR}/devel/automake

PLIST_FILES=	share/${PORTNAME}
NO_BUILD=	yes
NO_FETCH=	yes

do-install:
	@${ECHO_CMD} "Placeholder file" > ${PREFIX}/${PLIST_FILES}

.include <bsd.port.mk>
