# Also update	ports/japanese/plan/ (ja-plan) when this port is updated

PORTNAME=	plan
PORTVERSION=	1.12
PORTREVISION?=	1
CATEGORIES+=	deskutils
MASTER_SITES=	https://cschubert.com/distfiles/plan/ \
		FREEBSD_LOCAL/cy \
		https://plan.ftp.fu-berlin.de/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X/Motif schedule planner with calendar
WWW=		https://www.bitrot.de/plan.html

USES=		motif
USE_XORG=	xt sm ice x11 xext
WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}/src
ALL_TARGET=	freebsd

MAKE_ENV+=	DATADIR=${DATADIR} EXAMPLESDIR=${EXAMPLESDIR}

CONFLICTS_INSTALL?=	ja-plan

OPTIONS_DEFINE=	DOCS

do-install:
	@${MKDIR} ${STAGEDIR}${EXAMPLESDIR}

	cd ${WRKSRC} \
	   && ${INSTALL_PROGRAM} plan pland netplan notifier ${STAGEDIR}${PREFIX}/bin		\
	   && ${INSTALL_SCRIPT}  ../misc/Killpland ${STAGEDIR}${PREFIX}/bin			\
	   && ${INSTALL_MAN} ../misc/netplan.1 ../misc/plan.1 ${STAGEDIR}${PREFIX}/share/man/man1	\
	   && ${INSTALL_MAN} ../misc/plan.4 ${STAGEDIR}${PREFIX}/share/man/man4

	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	cd ${WRKSRC}/.. \
	   && ${INSTALL_DATA} misc/plan_cal.ps language/* misc/Mkdoc misc/Mkdoc.nawk	\
	                      misc/BlackWhite misc/Monochrome README			\
	                      ${STAGEDIR}${DOCSDIR}

	cd ${WRKSRC}/../holiday \
	   && ${INSTALL_DATA}   \
	      holiday_australia holiday_austria holiday_bavarian holiday_belgium		\
	      holiday_canada holiday_combi holiday_czech holiday_denmark holiday_dutch		\
	      holiday_finnish holiday_french holiday_frswiss holiday_german holiday_greek	\
	      holiday_hungary holiday_italy holiday_japan holiday_norway holiday_portugal	\
	      holiday_quebec holiday_slovak holiday_spain holiday_swedish holiday_uk		\
	      holiday_us ${STAGEDIR}${EXAMPLESDIR}

	@${MKDIR} ${STAGEDIR}${DATADIR}/netplan.dir

.include <bsd.port.mk>
