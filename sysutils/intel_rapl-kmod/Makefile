PORTNAME=	intel_rapl-kmod
DISTVERSION=	0.2.0
CATEGORIES=	sysutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Intel RAPL package power limits and power measurement
WWW=		https://github.com/spagu/intel_rapl

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/../LICENSE

ONLY_FOR_ARCHS=	amd64 i386
ONLY_FOR_ARCHS_REASON=	RAPL is an Intel x86 feature

USES=		kmod uidfix
USE_GITHUB=	yes
GH_ACCOUNT=	spagu
GH_PROJECT=	intel_rapl
GH_TAGNAME=	bf5a8baf027d59946bdd0c43a352bad008e57b7c
WRKSRC_SUBDIR=	src

PLIST_FILES=	${KMODDIR}/intel_rapl.ko \
		share/man/man4/intel_rapl.4.gz

do-install:
	${INSTALL_KLD} ${WRKSRC}/intel_rapl.ko ${KMODDIR}
	${INSTALL_MAN} ${WRKSRC}/../man/intel_rapl.4 ${PREFIX}/share/man/man4

do-test:
	${RM} ${WRKSRC}/../tests/unit/test_rapl_calc
	cd ${WRKSRC}/../tests/unit && ${MAKE} run

.include <bsd.port.mk>
