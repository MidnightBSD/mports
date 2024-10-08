PORTNAME=	p4
PORTVERSION=	${YEAR}.${MAJOR}.${MINOR}
CATEGORIES=	devel
# Perforce changes their distfiles when they patch, which changes the
# zip file's checksum. This does not play well with FreeBSD's conventions.
# maintainer is backup hosting
MASTER_SITES=	https://ftp.perforce.com/perforce/${P4VERSION}/bin.tools/p4source${EXTRACT_SUFX}?dummy=/ \
		https://hesiod.org/distfiles/perforce/
DISTNAME=	p4source-${MINOR}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perforce command line client
WWW=		https://www.perforce.com/products/helix-core

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${JAM}:devel/jam

# p4 links libssl and libcrypto statically, so specify :build
USES=		ssl:build tar:tgz

WRKSRC=		${WRKDIR}/p4source-${PORTVERSION}

PLIST_FILES=	bin/p4

.include <bsd.port.pre.mk>

.include "Makefile.inc"

do-build:
	cd ${WRKSRC} && ${SETENV} C++="${CXX}" C++FLAGS="${CXXFLAGS}" \
	    CCFLAGS="${CFLAGS}" \
	    HDRS="${OPENSSLINC}" \
	    LINKFLAGS="${LDFLAGS}" \
	    OSVER="124" \
	    SSL="yes" \
	    SSLVER="1.1.1" \
	    SSLPREFIX=${OPENSSLLIB} \
	    USE_EXTENSIONS=0 \
	    USE_OPTIMIZED_ZLIB=0 \
	    ${JAM} -dx -j${MAKE_JOBS_NUMBER} p4

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/p4-bin/p4 ${PREFIX}/bin

.include <bsd.port.post.mk>
