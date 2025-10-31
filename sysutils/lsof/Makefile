PORTNAME=	lsof
DISTVERSION=	4.95.0
CATEGORIES=	sysutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lists information about open files (similar to fstat(1))
WWW=		https://github.com/lsof-org/lsof

LICENSE=	lsof
LICENSE_NAME=	lsof
LICENSE_FILE=	${FILESDIR}/LICENSE
LICENSE_PERMS=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

USES=		compiler cpe shebangfix
CPE_VENDOR=	lsof_project
USE_GITHUB=	yes
GH_ACCOUNT=	lsof-org
HAS_CONFIGURE=	yes
CONFIGURE_SCRIPT=	Configure
CONFIGURE_ARGS=	-n freebsd
CONFIGURE_ENV=	LSOF_CC="${CC}"  FREEBSD_SYS="${SRC_BASE}/sys"
LDFLAGS+=	-lutil
.include <bsd.port.pre.mk>

.if ${OSVERSION} > 400000
CONFIGURE_ENV+=	LSOF_VSTR="13.4-RELEASE" LSOF_VERS=13000
.else
.if ${OSVERSION} > 300000
CONFIGURE_ENV+=	LSOF_VSTR="12.4-RELEASE" LSOF_VERS=12000
.else
CONFIGURE_ENV+=	LSOF_VSTR="11.3-RELEASE" LSOF_VERS=11000
.endif
.endif

.if ${CHOSEN_COMPILER_TYPE} == gcc
CONFIGURE_ENV+=       LSOF_CFGL="-lzfs -lzpool"
.endif

.if !exists(${SRC_BASE}/sys/kern/kern_lockf.c)
IGNORE=		requires kernel sources
.endif

.if !exists(${SRC_BASE}/sys/kern/kern_lockf.c)
IGNORE+=	requires kernel sources
.endif

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/lsof ${PREFIX}/sbin
	(cd ${WRKSRC} && /usr/bin/soelim Lsof.8 > ${WRKSRC}/lsof.8)
	${INSTALL_MAN} ${WRKSRC}/lsof.8 ${PREFIX}/share/man/man8/lsof.8
	@${MKDIR} ${STAGEDIR}${PREFIX}/share/lsof
	${INSTALL_SCRIPT} ${WRKSRC}/scripts/* ${PREFIX}/share/lsof
	@${CHMOD} 0444 ${PREFIX}/share/lsof/00*

.include <bsd.port.post.mk>
