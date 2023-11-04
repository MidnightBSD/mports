PORTNAME?=	ixl
PORTVERSION?=	1.13.4
PORTREVISION?=	0
CATEGORIES=	net
MASTER_SITES?=	https://downloadmirror.intel.com/${MASTER_SITE_SUBDIR}/ \
		http://downloadmirror.intel.com/${MASTER_SITE_SUBDIR}/
MASTER_SITE_SUBDIR?=	786087
PKGNAMEPREFIX=	intel-
PKGNAMESUFFIX=	-kmod

MAINTAINER?=	ports@MidnightBSD.org
COMMENT?=	40 gigabit FreeBSD Base Driver for Intel(R) Network Connections
WWW=		https://downloadcenter.intel.com

LICENSE=	bsd2

USES=		kmod

OPTIONS_SINGLE=		NETMAP
OPTIONS_SINGLE_NETMAP=	NETMAP_ON NETMAP_OFF
OPTIONS_DEFAULT=	NETMAP_OFF

NETMAP_ON_DESC=		Enable netmap(4) support unconditionally
NETMAP_OFF_DESC=	Disable netmap(4) support unconditionally

NETMAP_ON_CFLAGS=	-DDEV_NETMAP
NETMAP_OFF_CFLAGS=	-UDEV_NETMAP

WRKSRC_SUBDIR?=	src

SUB_FILES=	pkg-message
SUB_LIST=	PORTNAME=${PORTNAME}
MANPAGENAME?=	${PORTNAME}
MANPAGELINKS?=	if_${PORTNAME}
PLIST_FILES=	${KMODDIR}/if_${PORTNAME}_updated.ko \
		man/man4/${MANPAGENAME}.4.gz
MAKE_ENV+=	WERROR=""

.for link in ${MANPAGELINKS}
PLIST_FILES+=	man/man4/${link}.4.gz
.endfor

.include <bsd.port.pre.mk>

# Fixup for slave ports that use this as a master port. sbruno
.if ${PORTNAME} == ixl
ONLY_FOR_ARCHS=		aarch64 amd64 powerpc64 powerpc64le riscv64
ONLY_FOR_ARCHS_REASON=	Not supported on other architectures, amd64 and powerpc64 only.
.endif

do-install:
	${MKDIR} ${KMODDIR}
	${INSTALL_KLD} ${WRKSRC}/if_${PORTNAME}.ko ${KMODDIR}/if_${PORTNAME}_updated.ko
	${INSTALL_MAN} ${WRKSRC}/${MANPAGENAME}.4 ${STAGEDIR}${MAN4PREFIX}/man/man4/

.for link in ${MANPAGELINKS}
	${LN} ${STAGEDIR}${MAN4PREFIX}/man/man4/${MANPAGENAME}.4 ${STAGEDIR}${MAN4PREFIX}/man/man4/${link}.4
.endfor

.include <bsd.port.post.mk>
