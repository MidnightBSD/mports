# $MidnightBSD: mports/security/wipe/Makefile,v 1.3 2009/05/01 15:23:37 laffer1 Exp $

PORTNAME=	skipfish
PORTVERSION=	1.07b
CATEGORIES=	security
MASTER_SITES=	http://skipfish.googlecode.com/files/
DISTFILES=	${PORTNAME}-${PORTVERSION}.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	File and block device wiping utility
LICENSE=	apache2

USE_GMAKE=	yes
WRKSRC=		${WRKDIR}/${PORTNAME}
SUB_FILES=	pkg-message
SUB_LIST=	DATADIR="${DATADIR}"
MAKE_JOBS_SAFE=	yes

.include <bsd.port.pre.mk>

do-install:
	${INSTALL} ${WRKSRC}/skipfish ${PREFIX}/bin/
	${MKDIR} ${DATADIR}
	(cd ${WRKSRC} && ${PAX} -rw  dictionaries ${DATADIR})

.include <bsd.port.post.mk>
