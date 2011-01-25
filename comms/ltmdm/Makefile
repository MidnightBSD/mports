# $FreeBSD: ports/comms/ltmdm/Makefile,v 1.30 2006/03/04 21:31:03 osa Exp $
# $MidnightBSD: mports/comms/ltmdm/Makefile,v 1.6 2009/02/23 18:58:51 laffer1 Exp $

PORTNAME=	ltmdm
PORTVERSION=	1.4
PORTREVISION=	21
CATEGORIES=	comms kld
MASTER_SITES=	http://people.midnightbsd.org/~laffer1/ \
		http://www.dons.net.au/~darius/
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Driver for the Lucent LT Winmodem chipset
LICENSE=	restricted

MODULES_WITH_WORLD?=	yes
ONLY_FOR_ARCHS=	i386
BUILD_WRKSRC=	${WRKSRC}/sys/modules/ltmdm
NO_WRKSUBDIR=	yes
SUB_FILES+=	pkg-message
PKGMESSAGE=	${WRKDIR}/pkg-message
RESTRICTED=	Unknown license type for binary object file ltmdmobj.o

LTMDM_DEV_MAJOR?=	228
LTMDM_OBJ_VERSION?=	600

.if defined(WITH_595_OBJ)
MAKE_ARGS+=	LTMDM_OBJ_VERSION=595
.endif

MAKE_ARGS+=	LTMDM_DEV_MAJOR=${LTMDM_DEV_MAJOR}
MAKE_ARGS+=	LTMDM_OBJ_VERSION=${LTMDM_OBJ_VERSION}
#MAKE_ENV+=	WERROR=
STRIP=		# do not strip kernel module

PORTDOCS=	README.TXT README-en.TXT INSTALL.TXT INSTALL-en.TXT
SYSDIR?=	${SRC_BASE}/sys

.include <bsd.port.pre.mk>

PLIST_SUB+=	KMODDIR=${KMODDIR}

pre-fetch:
.if !exists(${SYSDIR}/Makefile)
	@${ECHO}  "This port requires the kernel source be available"; \
	exit 1
.endif
.if !defined(WITH_595_OBJ)
	@${ECHO} "If your ISP supports K56flex protocol only and   ";
	@${ECHO} " doesn't support V90, define WITH_595_OBJ.       ";
	@${ECHO} "Otheriwse your modem will not connect            ";
.endif

do-install:
	@${MKDIR} -p ${KMODDIR}
	@${INSTALL_PROGRAM} ${BUILD_WRKSRC}/ltmdm.ko ${KMODDIR}
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for i in ${PORTDOCS}
	@${INSTALL_DATA} ${WRKSRC}/${i} ${DOCSDIR}/
.endfor
.endif

.include <bsd.port.post.mk>
