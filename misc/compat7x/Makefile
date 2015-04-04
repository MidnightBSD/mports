# $MidnightBSD$

PORTNAME=	compat7x
PORTVERSION=	7.4.704000.201310.1
CATEGORIES=	misc
MASTER_SITES=	${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	garga/compat
PKGNAMESUFFIX=	-${ARCH}
DISTNAME=	${PORTNAME}-${ARCH}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Convenience package to install the FreeBSD compat7x libraries
LICENSE=	agg

LICENSE=	bsd2

USES=		tar:xz
NO_BUILD=	yes
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
	(cd ${TARGET_DIR} && ${LN} -sf /lib/libthr.so.3 libkse.so.3)
.if ${ARCH} == amd64
	@${MKDIR} ${TARGET32_DIR}
	(cd ${TARGET32_DIR} && ${LN} -sf /usr/lib32/libthr.so.3 libkse.so.3)
	(cd ${WRKSRC}/lib32 && ${INSTALL_DATA} *.so.* ${TARGET32_DIR})
.endif

.include <bsd.port.post.mk>
