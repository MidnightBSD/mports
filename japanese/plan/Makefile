PORTNAME=	plan
PORTVERSION=	1.9
PORTREVISION=	3
CATEGORIES=	japanese

MAINTAINER=	ports@MidnightBSD.org

MAKE_ENV+=	JAPANESE=yes

MASTERDIR=	${.CURDIR}/../../deskutils/plan

PLIST=	${WRKDIR}/PLIST
EXTRA_PATCHES=	${.CURDIR}/files/patch-*

CONFLICTS_INSTALL=	plan # bin/Killpland

PORTDOCS=	plan_calEUC.ps

OPTIONS_DEFINE=	DOCS

post-build:
	${CAT} ${MASTERDIR}/pkg-plist >> ${WRKDIR}/PLIST

post-install:
	@${MKDIR} ${STAGEDIR}${DATADIR}/netplan.dir
	${CHMOD} 1777 ${STAGEDIR}${DATADIR}/netplan.dir
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${.CURDIR}/files/plan_calEUC.ps ${STAGEDIR}${DOCSDIR}

.include	"${MASTERDIR}/Makefile"
