PORTNAME=	quake3
DISTVERSION=	1.11-6
PORTREVISION=	4
CATEGORIES=	games
MASTER_SITES=	http://mirror.internode.on.net/pub/idstuff/quake3/linux/ \
		https://www.quaddicted.com/files/idgames/idstuff/quake3/linux/ \
		https://dukeworld.duke4.net/idgames2/idstuff/quake3/linux/
PKGNAMEPREFIX=	linux-
PKGNAMESUFFIX=	-demo
DISTNAME=	linuxq3ademo-${DISTVERSION}.x86
EXTRACT_SUFX=	.gz.sh

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Quake III Arena Demo
WWW=		http://quake3arena.com/

LICENSE=        Loki
LICENSE_NAME=   Loki Software License
LICENSE_FILE=   ${WRKSRC}/Help/Q3A_EULA.txt
LICENSE_PERMS=	auto-accept

RESTRICTED=	no commerical redistribution

USES=		linux
USE_LINUX=	dri
NO_BUILD=	yes
NO_WRKSUBDIR=	yes

DATADIR=	${PREFIX}/share/${PKGNAMEPREFIX}${PORTNAME}${PKGNAMESUFFIX}

SUB_FILES=	q3demo

OPTIONS_DEFINE=	DOCS

do-extract:
	@${MKDIR} ${WRKSRC}
	@cd ${WRKSRC} && ${TAIL} +165 ${_DISTDIR}/${DISTNAME}${EXTRACT_SUFX} | \
		${TAR} zxf -

do-install:
	@${INSTALL_SCRIPT} ${WRKDIR}/q3demo ${PREFIX}/bin
	@${MKDIR} ${DATADIR}
	@${INSTALL_PROGRAM} ${WRKSRC}/bin/x86/glibc-2.0/q3demo ${DATADIR}
	@${CP} -R ${WRKSRC}/demoq3 ${DATADIR}
	@${LN} -s ${LINUXBASE}/usr/X11R6/lib/libGL.so.1 ${DATADIR}/libGL.so
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${WRKSRC}/README ${DOCSDIR}
	@${CP} -R ${WRKSRC}/Help/* ${DOCSDIR}

.include <bsd.port.mk>
