# New ports collection makefile for:	boinc-einsteinathome
# Date created:				20 February 2006
# Whom:					Rene Ladan <r.c.ladan@student.tue.nl>
#
# $MidnightBSD$
# $FreeBSD: ports/astro/boinc-einsteinathome/Makefile,v 1.11 2008/06/06 13:02:55 edwin Exp $
#

PORTNAME=	boinc-einsteinathome
PORTVERSION=	4.18
CATEGORIES=	astro
MASTER_SITES=	http://einstein.phys.uwm.edu/app_test/FreeBSD/
DISTNAME=	einstein_S5R3_${PORTVERSION}_i386-unknown-freebsd

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Search for gravitational waves, a distributed computing project
LICENSE=	unknown

.include <bsd.port.pre.mk>

ONLY_FOR_ARCHS=	i386 amd64

LIB_DEPENDS+=	c.5:${PORTSDIR}/misc/compat5x
RUN_DEPENDS+=	boinc_client:${PORTSDIR}/net/boinc-client

NO_BUILD=	yes
NO_WRKSUBDIR=	yes
STRIP=		#

# these must match settings in ${PORTSDIR}/net/boinc-client/Makefile
BOINC_USER?=	boinc
BOINC_GROUP?=	nobody
BOINC_HOME?=	/var/db/boinc

EINSTEIN_SITE=	einstein.phys.uwm.edu
EINSTEIN_BINARY=${DISTNAME}

.if ${ARCH} == amd64
AMD64=		""
.else
AMD64=		"@comment "
.endif

SUB_FILES=	pkg-message
SUB_LIST=	AMD64=${AMD64}

PLIST_SUB=	EINSTEIN_BINARY="${EINSTEIN_BINARY}" EINSTEIN_SITE=${EINSTEIN_SITE} \
		BOINC_HOME=${BOINC_HOME}

do-install:
	${INSTALL} -d -o ${BOINC_USER} -g ${BOINC_GROUP} ${FAKE_DESTDIR}${BOINC_HOME}/projects
	${INSTALL} -d -o ${BOINC_USER} -g ${BOINC_GROUP} ${FAKE_DESTDIR}${BOINC_HOME}/projects/${EINSTEIN_SITE}
	${INSTALL_DATA} -o ${BOINC_USER} -g ${BOINC_GROUP} ${WRKDIR}/projects/${EINSTEIN_SITE}/app_info.xml ${FAKE_DESTDIR}${BOINC_HOME}/projects/${EINSTEIN_SITE}
	${INSTALL_PROGRAM} -o ${BOINC_USER} -g ${BOINC_GROUP} ${WRKSRC}/projects/${EINSTEIN_SITE}/${EINSTEIN_BINARY} ${FAKE_DESTDIR}${BOINC_HOME}/projects/${EINSTEIN_SITE}

.include <bsd.port.post.mk>
