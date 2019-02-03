# $MidnightBSD$

PORTNAME=	compat6x
PORTVERSION=	6.4.604000.200810
PORTREVISION=	2
CATEGORIES=	misc
MASTER_SITES=	${MASTER_SITE_FREEBSD_LOCAL} \
		http://people.freebsd.org/~${MASTER_SITE_SUBDIR}/
MASTER_SITE_SUBDIR=	mnag/compat6x
PKGNAMESUFFIX=	-${ARCH}
DISTNAME=	${PORTNAME}-${ARCH}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Convenience package to install the FreeBSD 6.x compat libraries
LICENSE=	agg

USES=		tar:bzip2
NO_BUILD=	yes
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
	@${MKDIR} -m 755 ${TARGET_DIR}
.if ${OSVERSION} >= 4015
	${RM} -f ${WRKSRC}/lib/libpthread.so.2
	(cd ${TARGET_DIR} && ${LN} -sf libthr.so.2 libpthread.so.2)
.endif
	(cd ${WRKSRC}/lib && ${INSTALL_DATA} *.so.* ${TARGET_DIR})
.if ${ARCH} == amd64
	@${MKDIR} ${TARGET32_DIR}
. if ${OSVERSION} >= 4015
	${RM} -f ${WRKSRC}/lib32/libpthread.so.2
	(cd ${TARGET32_DIR} && ${LN} -sf libthr.so.2 libpthread.so.2)
. endif
	(cd ${WRKSRC}/lib32 && ${INSTALL_DATA} *.so.* ${TARGET32_DIR})
.endif

# Include this file to use install-ldconfig-file
.include "${PORTSDIR}/misc/ldconfig_compat/bsd.ldconfig.mk"

.include <bsd.port.post.mk>
