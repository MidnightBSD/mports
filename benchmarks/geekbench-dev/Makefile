PORTNAME=	Geekbench
PORTVERSION=	6.4.0
DISTVERSIONSUFFIX=-Linux
CATEGORIES=	benchmarks
MASTER_SITES=	https://cdn.geekbench.com/
PKGNAMESUFFIX=	-dev
DIST_SUBDIR=	${PORTNAME}${PKGNAMESUFFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cross-platform benchmark for CPU and GPU performance
WWW=		https://www.geekbench.com

LICENSE=	EULA
LICENSE_NAME=	Geekbench End User License Agreement
LICENSE_TEXT=	Don't sell it
LICENSE_PERMS=	dist-mirror pkg-mirror auto-accept

USES=		linux:rl9
USE_LINUX=	ca-certificates

NO_BUILD=	yes

WRKSRC=		${WRKDIR}/Geekbench-${PORTVERSION}-Linux
SUB_FILES=	geekbench6

do-install:
	${MKDIR} ${PREFIX}/bin
	${INSTALL_SCRIPT} ${WRKDIR}/geekbench6 ${PREFIX}/bin/
	${MKDIR} ${PREFIX}/libexec/geekbench6
	${INSTALL_PROGRAM} ${WRKSRC}/geekbench6 ${PREFIX}/libexec/geekbench6/
	${INSTALL_PROGRAM} ${WRKSRC}/geekbench_avx2 ${PREFIX}/libexec/geekbench6/
	${INSTALL_PROGRAM} ${WRKSRC}/geekbench_x86_64 ${PREFIX}/libexec/geekbench6/
	${INSTALL_DATA} ${WRKSRC}/geekbench.plar ${PREFIX}/libexec/geekbench6/
	${INSTALL_DATA} ${WRKSRC}/geekbench-workload.plar ${PREFIX}/libexec/geekbench6/

.include <bsd.port.mk>
