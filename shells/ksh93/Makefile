PORTNAME=	ksh93
DISTVERSION=	93u
PORTEPOCH=	2
CATEGORIES=	shells
DIST_SUBDIR=	ksh93

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	AT&T KornShell 93

LICENSE=	epl

BROKEN_aarch64=	Fails to compile: needs sbrk

USES=		compiler:c11

USE_GITHUB=	yes
GH_ACCOUNT=	att
GH_PROJECT=	ast

KSH_CONFLICTS=		pdksh-*
KSH93_CONFLICTS=	ksh93-devel-* ast-ksh-*

OPTIONS_DEFAULT=	KSH93 EXAMPLES
OPTIONS_DEFINE=		EXAMPLES STATIC
OPTIONS_SINGLE=		BIN_KSH
OPTIONS_SINGLE_BIN_KSH=	KSH KSH93
KSH_DESC=		Install to ${PREFIX}/bin/ksh
KSH93_DESC=		Install to ${PREFIX}/bin/ksh93

CFLAGS+=	-DMAP_TYPE
LDFLAGS+=	-lm
MAKE_ENV=	CCFLAGS="-Wno-unused-value -Wno-parentheses -Wno-logical-op-parentheses" CFLAGS="${CFLAGS}"

STATIC_MAKE_ENV=     LDFLAGS+=-static

KSH_PLIST_SUB=		93=""
KSH93_PLIST_SUB=	93="93"

.include <bsd.port.pre.mk>

.if ${CHOSEN_COMPILER_TYPE} == gcc && ${COMPILER_VERSION} >= 90
BROKEN=	GCC 9.1 changes the output of `gcc -E` which breaks the conf.sh script
.endif

.if ${PORT_OPTIONS:MKSH93}
PNAME=		ksh93
.else
PNAME=		ksh
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|SF_FLAGS|SFIO_FLAGS|g' ${WRKSRC}/src/lib/libast/include/sfio*.h ${WRKSRC}/src/lib/libast/sfio/*.c

do-build:
	@cd ${WRKSRC}/ && ${SETENV} -i ${MAKE_ENV} ${SH} bin/package flat make ksh93

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/bin/ksh ${STAGEDIR}${PREFIX}/bin/${PNAME}
	${INSTALL_MAN} ${WRKSRC}/man/man1/sh.1 ${STAGEDIR}${MAN1PREFIX}/man/man1/${PNAME}.1
	${MKDIR} ${STAGEDIR}${EXAMPLESDIR}/
	cd ${WRKSRC}/fun/ && ${INSTALL_SCRIPT} dirs popd pushd ${STAGEDIR}${EXAMPLESDIR}/

do-test:
	cd ${WRKSRC}/src/cmd/ksh93/tests/ && ${SETENV} SHELL=${WRKSRC}/bin/ksh ${WRKSRC}/bin/ksh shtests

.include <bsd.port.post.mk>
