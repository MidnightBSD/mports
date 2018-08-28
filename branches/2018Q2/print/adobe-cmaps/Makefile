# $MidnightBSD$

PORTNAME=	adobe-cmaps
PORTVERSION=	20051217
PORTREVISION=	2
CATEGORIES=	print
MASTER_SITES=	FREEBSD_LOCAL/hrs/adobe
DISTFILES=	ac15.tar.gz ag15.tar.gz \
		ai0.tar.gz aj16.tar.gz \
		aj20.tar.gz ak12.tar.gz rksj-cmaps.tar.gz
DIST_SUBDIR=	adobe

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Adobe CMap collection

LICENSE=	unknown

USES=		fonts
NO_WRKSUBDIR=	yes
NO_BUILD=	yes
INSTDIRS=	ac15 ag15 ai0 aj16 aj20 ak12 rksj-cmaps
FONTSDIR=	share/fonts/${PORTNAME}

post-extract:
	${RM} -f ${WRKDIR}/ag15/.nfsFA55

do-install:
	${MKDIR} ${PREFIX}/${FONTSDIR}
	cd ${WRKDIR} && \
		${TAR} cf - ${INSTDIRS} | \
		(cd ${PREFIX}/${FONTSDIR} && ${TAR} xf - )

.include <bsd.port.mk>
