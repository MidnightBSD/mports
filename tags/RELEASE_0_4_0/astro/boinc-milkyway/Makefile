# $MidnightBSD: mports/astro/boinc-milkyway/Makefile,v 1.4 2009/12/28 22:52:05 laffer1 Exp $

PORTNAME=	boinc-milkyway
PORTVERSION=	0.18d
PORTEPOCH=	1
CATEGORIES=	astro
MASTER_SITES=	http://milkyway.cs.rpi.edu/milkyway/download/code_release/
DISTNAME=	mw_v${PORTVERSION}.tar

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Modelling the evolution of the Milkyway Galaxy
LICENSE=	gpl2

EXTRACT_SUFX=	#

BUILD_DEPENDS+=	${LOCALBASE}/include/boinc/version.h:${PORTSDIR}/net/boinc-client
RUN_DEPENDS+=	boinc_client:${PORTSDIR}/net/boinc-client

ONLY_FOR_ARCHS=	i386 amd64

WRKSRC=		${WRKDIR}/milkyway/bin
MAKEFILE=	make.linux
USE_GMAKE=	yes
ALL_TARGET=	app_x86_64

# these must match settings in ${PORTSDIR}/net/boinc-client/Makefile
BOINC_USER?=	boinc
BOINC_GROUP?=	nobody
BOINC_HOME?=	/var/db/boinc

MILKYWAY_SITE=	milkyway.cs.rpi.edu_milkyway
MILKYWAY_URL=	milkyway.cs.rpi.edu/milkyway
MILKYWAY_BINARY=milkyway_${PORTVERSION:S/d//}_${ARCH}-portbuild-freebsd

SUB_FILES=	pkg-message app_info.xml
SUB_LIST=	MILKYWAY_VERSION=${PORTVERSION:S/0.//} MILKYWAY_BINARY="${MILKYWAY_BINARY}"

PLIST_SUB=	MILKYWAY_BINARY="${MILKYWAY_BINARY}" MILKYWAY_SITE=${MILKYWAY_SITE} \
		BOINC_HOME=${BOINC_HOME}

.include <bsd.port.pre.mk>

post-patch:
	@${REINPLACE_CMD} -e 's|/software/boinc-6.3.14-0/pkg/include/boinc|${LOCALBASE}/include/boinc|' ${WRKSRC}/${MAKEFILE}
	@${REINPLACE_CMD} -e 's|/projects/wcl/software/boinc|${LOCALBASE}/lib|' ${WRKSRC}/${MAKEFILE}
	@${REINPLACE_CMD} -e 's|/api$$|| ; /^BOINC_LIB_/s|/lib$$||' ${WRKSRC}/${MAKEFILE}
	@${REINPLACE_CMD} -e 's|/usr/local/lib|${LOCALBASE}/lib|' ${WRKSRC}/${MAKEFILE}
.if ${OSVERSION} < 3000
	@${REINPLACE_CMD} -e 's|-ftree-vectorize ||' ${WRKSRC}/${MAKEFILE}
.endif

do-install:
	${INSTALL} -d -o ${BOINC_USER} -g ${BOINC_GROUP} ${FAKE_DESTDIR}${BOINC_HOME}/projects
	${INSTALL} -d -o ${BOINC_USER} -g ${BOINC_GROUP} ${FAKE_DESTDIR}${BOINC_HOME}/projects/${MILKYWAY_SITE}
	${INSTALL_DATA} -o ${BOINC_USER} -g ${BOINC_GROUP} ${WRKDIR}/app_info.xml ${FAKE_DESTDIR}${BOINC_HOME}/projects/${MILKYWAY_SITE}
	${INSTALL_PROGRAM} -o ${BOINC_USER} -g ${BOINC_GROUP} ${WRKSRC}/milkyway_${PORTVERSION:S/d//}_x86_64-pc-linux-gnu ${FAKE_DESTDIR}${BOINC_HOME}/projects/${MILKYWAY_SITE}/${MILKYWAY_BINARY}

.include <bsd.port.post.mk>
