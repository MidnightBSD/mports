# $MidnightBSD: mports/misc/compat6x/Makefile,v 1.1 2009/01/03 22:31:16 laffer1 Exp $

PORTNAME=	compat6x
PORTVERSION=	6.4.604000.200810
CATEGORIES=	misc
MASTER_SITES=	${MASTER_SITE_FREEBSD_LOCAL} \
		http://people.freebsd.org/~${MASTER_SITE_SUBDIR}/
MASTER_SITE_SUBDIR=	mnag/compat6x
PKGNAMESUFFIX=	-${ARCH}
DISTNAME=	${PORTNAME}-${ARCH}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A convenience package to install the FreeBSD 6.x compat libraries
LICENSE=	agg

USE_BZIP2=	yes
NO_BUILD=	yes
ONLY_FOR_ARCHS=	i386 amd64
PLIST=		${PKGDIR}/pkg-plist.${ARCH}
USE_LDCONFIG=	yes
LDCONFIG_DIRS=	%%PREFIX%%/lib/compat
TARGET_DIR=	${PREFIX}/lib/compat
TARGET32_DIR=	${PREFIX}/lib32/compat
USE_LDCONFIG=	${TARGET_DIR}

.include <bsd.port.pre.mk>

.if ${OSVERSION} < 3000
IGNORE=		is for MidnightBSD 0.3  and newer
.endif

.if ${ARCH} == amd64
PLIST_SUB+=	LDCONFIG_LIB32="${LDCONFIG} -32"
USE_LDCONFIG32=	${TARGET32_DIR}
.endif

do-install:
	@${MKDIR} ${TARGET_DIR}
	(cd ${WRKSRC}/lib && ${INSTALL_DATA} *.so.* ${TARGET_DIR})
.if ${ARCH} == amd64
	@${MKDIR} ${TARGET32_DIR}
	(cd ${WRKSRC}/lib32 && ${INSTALL_DATA} *.so.* ${TARGET32_DIR})
.endif

# Include this file to use install-ldconfig-file
.include "${PORTSDIR}/misc/ldconfig_compat/bsd.ldconfig.mk"

.include <bsd.port.post.mk>
