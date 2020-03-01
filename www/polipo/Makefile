PORTNAME=	polipo
PORTVERSION=	1.1.1
CATEGORIES=	www
MASTER_SITES=	http://www.pps.univ-paris-diderot.fr/~jch/software/files/polipo/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Small and fast caching web proxy

LICENSE=	mit

USE_RC_SUBR=	polipo.sh

.include <bsd.port.pre.mk>

.if defined(NO_PTEXINFO)
ALL_TARGET=	polipo
NOPORTDOCS=	yes
.else
INFO=		polipo
.endif

DOCSDIR=	${DATADIR}/www/doc
PORTDOCS=	*

SUB_FILES=	pkg-message pkg-install pkg-deinstall 400.polipo
SUB_LIST+=	USER=${PUSER} GROUP=${PGRP} DESTDIR=${DESTDIR} PCONFIGDIR=${PCONFIGDIR} \
		PCACHEDIR=${PCACHEDIR} PPIDDIR=${PPIDDIR} PPIDFILE=${PPIDFILE} \
		PLOGFILE=${PLOGFILE} RC_SUBR=${RC_SUBR} TRUE_PREFIX=${TRUE_PREFIX}

# polipo installation options, propagated to install scripts
PUSER?=		polipo
PGRP?=		polipo
PCONFIGDIR?=	${TRUE_PREFIX}/etc/polipo/
PCACHEDIR?=	/var/cache/polipo
PPIDDIR?=	/var/run/polipo/
PPIDFILE=	${PPIDDIR}polipo.pid
PLOGFILE?=	/var/log/polipo
MAKE_ENV+=	DISK_CACHE_ROOT=${PCACHEDIR}

pre-install: apply-slist
	@PREFIX=${PREFIX} ${SH} ${PKGINSTALL} ${PKGNAME} PRE-INSTALL

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/polipo ${PREFIX}/bin/
	${MKDIR} ${PREFIX}/etc/periodic/daily/
	${INSTALL_SCRIPT} ${WRKDIR}/400.polipo ${PREFIX}/etc/periodic/daily/
	${INSTALL_MAN} ${WRKSRC}/polipo.man ${PREFIX}/man/man1/polipo.1
	${MKDIR} ${FAKE_DESTDIR}${PCONFIGDIR}
	${INSTALL_DATA} ${WRKSRC}/config.sample ${FAKE_DESTDIR}${PCONFIGDIR}
	${INSTALL_DATA} ${WRKSRC}/forbidden.sample ${FAKE_DESTDIR}${PCONFIGDIR}
	${CHGRP} -R ${PGRP} ${FAKE_DESTDIR}${PCONFIGDIR}
.if !defined(NO_PTEXINFO)
	${INSTALL_DATA} ${WRKSRC}/polipo.info ${PREFIX}/info/
.endif
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/html/* ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/localindex.html ${DATADIR}/www/index.html
	${CHGRP} -R ${PGRP} ${DATADIR}
.endif

post-install:
	@PREFIX=${PREFIX} ${SH} ${PKGINSTALL} ${PKGNAME} POST-INSTALL

.include <bsd.port.post.mk>
