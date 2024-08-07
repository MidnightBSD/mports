PORTNAME=	quake3
PORTVERSION=	1.32c
PORTREVISION=	4
CATEGORIES=	games linux
MASTER_SITES=	${MASTER_SITE_IDSOFTWARE:S|$|quake3/linux/:data|} \
		${MASTER_SITE_IDSOFTWARE:S|$|quake3/:patch|}
PKGNAMEPREFIX=	linux-
DISTFILES=	${Q3DATAFILE}:data \
		${Q3PATCHFILE}:patch
DIST_SUBDIR=	${Q3PKGNAMEPREFIX}data

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Quake III Arena for Linux
WWW=		http://www.quake3arena.com/

LICENSE=	Loki
LICENSE_NAME=	Loki Software License
LICENSE_FILE=	${WRKSRC}/Q3A_EULA.txt
LICENSE_PERMS=	auto-accept

USES=		linux zip:infozip
NO_WRKSUBDIR=	yes

RESTRICTED=	Restrictive license by Loki Software
NO_CDROM=	${RESTRICTED}

OPTIONS_MULTI=	TYPE
OPTIONS_MULTI_TYPE=	CLIENT DEDICATED SMP
OPTIONS_DEFINE=	DOCS
OPTIONS_DEFAULT=	CLIENT DEDICATED SMP

OPTIONS_SUB=	yes

CLIENT_DESC=	Install client
DEDICATED_DESC=	Install dedicated server
SMP_DESC=	Install SMP (threaded) client

PLIST_SUB+=	LIBDIR="${LIBDIR:S/${PREFIX}\///}"

LIBDIR=		${PREFIX}/libexec/${PKGNAMEPREFIX}${PORTNAME}
Q3DATAFILE=	linuxq3apoint-1.32b-3.x86.run
Q3PATCHFILE=	quake3-${PORTVERSION}.zip

do-extract:
	@${MKDIR} ${WRKSRC}
	@cd ${WRKSRC} && ${TAIL} +356 ${_DISTDIR}/${Q3DATAFILE} | \
		${TAR} zxf -
	@${UNZIP_CMD} -qo ${_DISTDIR}/${Q3PATCHFILE} -d ${WRKSRC}

post-extract:
.for f in q3ded quake3.x86 quake3-smp.x86
	@${MV} "${WRKSRC}/Quake III Arena 1.32c/linux/${f}" \
		${WRKSRC}/bin/Linux/x86/${f}
.endfor

.include "${.CURDIR}/../quake3-data/Makefile.include"

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MDEDICATED}
PROGS+=		q3ded
PLIST_SUB+=	DEDICATED=""
.else
PLIST_SUB+=	DEDICATED="@comment "
.endif

.if ${PORT_OPTIONS:MCLIENT}
PROGS+=		quake3.x86
PLIST_SUB+=	CLIENT=""
.else
PLIST_SUB+=	CLIENT="@comment "
.endif

.if ${PORT_OPTIONS:MSMP}
PROGS+=		quake3-smp.x86
PLIST_SUB+=	SMP=""
.else
PLIST_SUB+=	SMP="@comment "
.endif

do-build:
.for f in ${PROGS}
	@(${ECHO_CMD} "#!${SH}"; \
		${ECHO_CMD} "cd ${DATADIR} || exit 1"; \
		${ECHO_CMD} 'exec ${LIBDIR}/${f:R} "$$@"') > ${WRKDIR}/${f:R}
.endfor

do-install:
	${MKDIR} ${LIBDIR}
.for f in ${PROGS}
	${INSTALL_PROGRAM} ${WRKSRC}/bin/Linux/x86/${f} ${LIBDIR}/${f:R}
	${INSTALL_SCRIPT} ${WRKDIR}/${f:R} ${PREFIX}/bin/linux-${f:R}
.endfor
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README-linux.txt ${DOCSDIR}
	${CP} -Rp ${WRKSRC}/Docs/LinuxFAQ ${DOCSDIR}

.include <bsd.port.mk>
