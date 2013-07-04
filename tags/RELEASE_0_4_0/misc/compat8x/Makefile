# $MidnightBSD$

PORTNAME=	compat8x
PORTVERSION=	8.3.803000.201209
CATEGORIES=	misc
MASTER_SITES=	${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	garga/compat
PKGNAMESUFFIX=	-${ARCH}
DISTNAME=	${PORTNAME}-${ARCH}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A convenience package to install the FreeBSD compat8x libraries
LICENSE=	agg

USE_BZIP2=	yes
NO_BUILD=	yes
ONLY_FOR_ARCHS=	i386 amd64 sparc64
PLIST=		${PKGDIR}/pkg-plist.${ARCH}
TARGET_DIR=	${PREFIX}/lib/compat
TARGET32_DIR=	${PREFIX}/lib32/compat
USE_LDCONFIG=	${TARGET_DIR}

.include <bsd.port.pre.mk>

.if ${OSVERSION} < 4015
IGNORE=		is for MidnightBSD 0.4 and newer
.endif

.if ${ARCH} == amd64
PLIST_SUB+=	LDCONFIG_LIB32="${LDCONFIG} -32"
USE_LDCONFIG32=	${TARGET32_DIR}
.endif

do-install:
	@${MKDIR} -m 0755 ${TARGET_DIR}
	(cd ${WRKSRC}/lib && ${INSTALL_DATA} *.so.* ${TARGET_DIR})
.if ${ARCH} == amd64
	@${MKDIR} ${TARGET32_DIR}
	(cd ${WRKSRC}/lib32 && ${INSTALL_DATA} *.so.* ${TARGET32_DIR})
.endif

.include <bsd.port.post.mk>
