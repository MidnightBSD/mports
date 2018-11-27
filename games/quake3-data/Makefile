# New ports collection makefile for:	Quake 3 paks
# Date created:				1st March 2003
# Whom:					nik@FreeBSD.org
#
# $MidnightBSD$
# $FreeBSD: ports/games/quake3-data/Makefile,v 1.14 2007/05/19 20:07:23 flz Exp $
#

PORTNAME=	data
DISTVERSION=	1.32b-3
CATEGORIES=	games
MASTER_SITES=	${MASTER_SITE_IDSOFTWARE}
MASTER_SITE_SUBDIR=	quake3/linux
PKGNAMEPREFIX=	${Q3PKGNAMEPREFIX}
DISTNAME=	linuxq3apoint-${DISTVERSION}.x86
EXTRACT_SUFX=	.run

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Quake III Arena data files
LICENSE=	unknown

NO_BUILD=	yes
NO_WRKSUBDIR=	yes

OPTIONS=	TEAMARENA "Install Quake III Team Arena data files" on

DATADIR=	${Q3DIR}

SUB_FILES=	pkg-message

do-extract:
	@${RM} -rf ${WRKDIR}
	@${MKDIR} ${WRKDIR}
	@cd ${WRKDIR} && ${TAIL} +356 ${_DISTDIR}/${DISTNAME}${EXTRACT_SUFX} | \
		${TAR} zxf - >/dev/null

.include "Makefile.include"

.include <bsd.port.pre.mk>

.if !defined(WITHOUT_TEAMARENA)
PLIST_SUB+=	TEAMARENA=""
.else
PLIST_SUB+=	TEAMARENA="@comment "
.endif

do-install:
	@${MKDIR} ${FAKE_DESTDIR}${DATADIR}
	@${CP} -R ${WRKDIR}/baseq3 ${FAKE_DESTDIR}${DATADIR}
	@${MKDIR} ${PREFIX}/share/pixmaps
	@${INSTALL_DATA} ${WRKDIR}/quake3.xpm ${PREFIX}/share/pixmaps
.if !defined(WITHOUT_TEAMARENA)
	@${CP} -R ${WRKDIR}/missionpack ${FAKE_DESTDIR}${DATADIR}
.endif

.include <bsd.port.post.mk>
