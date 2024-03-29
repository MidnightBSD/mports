# Created by: Bruce Simpson

PORTNAME=	kBuild
DISTVERSION=	${KBUILD_VERSION}
PORTREVISION=	15
CATEGORIES=	devel
MASTER_SITES=	FREEBSD_LOCAL/jkim
DISTNAME=	${PORTNAME}-${DISTVERSION}r3127-src

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Makefile framework
WWW=		https://svn.netlabs.org/kbuild

LICENSE=	gpl3+ bsd3
LICENSE_COMB=	multi

NOT_FOR_ARCHS=		aarch64 armv6 armv7 mips mips64
NOT_FOR_ARCHS_REASON=	./kBuild/env.sh: unknown cpu/arch

USES=		autoreconf:build gmake makeinfo tar:xz

CONFLICTS_INSTALL=	kBuild-devel-[0-9]*

WRKSRC=		${WRKDIR}/${PORTNAME}-${DISTVERSION}

KBUILD_VERSION=	0.1.9998
KBUILD_ARCH=	${MACHINE_ARCH:S/i386/x86/:S/x86_64/amd64/:C/powerpc.*/ppc32/:C/armv.*/arm/}
KBUILD_ENV=	AUTORECONF=${AUTORECONF} \
		AUTOPOINT=true \
		CC="${CC}" CFLAGS="${CFLAGS}" CPPFLAGS="${CPPFLAGS}" \
		LDFLAGS="${LDFLAGS}" MAKE="${MAKE_CMD}"
KBUILD_TARGET=	freebsd

KBUILD_BINS=	kDepIDB kDepObj kDepPre kObjCache kmk kmk_append kmk_ash \
		kmk_cat kmk_chmod kmk_cmp kmk_cp kmk_echo kmk_expr kmk_gmake \
		kmk_install kmk_ln kmk_md5sum kmk_mkdir kmk_mv kmk_printf \
		kmk_redirect kmk_rm kmk_rmdir kmk_sed kmk_sleep kmk_test \
		kmk_time
PORTDOCS=	QuickReference-kmk.html \
		QuickReference-kmk.txt

ENV=
.export ENV

OPTIONS_DEFINE=	DOCS GCC
OPTIONS_DEFAULT=GCC
GCC_DESC=	Build with GCC (should almost always be enabled)
GCC_USE=	GCC=yes

post-patch:
	@${REINPLACE_CMD} 's|gcc|${CC}|g' ${WRKSRC}/kBuild/tools/*.kmk

do-build:
	cd ${WRKSRC} && ${SETENV} ${KBUILD_ENV} ./kBuild/env.sh --full ${MAKE_CMD} -f bootstrap.gmk
	cd ${WRKSRC} && ${RM} -r out
	cd ${WRKSRC} && ./kBuild/env.sh kmk
	cd ${WRKSRC} && ./kBuild/env.sh kmk NIX_INSTALL_DIR=${TRUE_PREFIX} BUILD_TYPE=release -C ${WRKSRC}

do-install:
.for bin in ${KBUILD_BINS}
	${INSTALL_PROGRAM} ${WRKSRC}/out/${KBUILD_TARGET}.${KBUILD_ARCH}/release/stage${TRUE_PREFIX}/bin/${bin} ${STAGEDIR}${PREFIX}/bin
.endfor
	${MKDIR} ${STAGEDIR}${DATADIR}
	(cd ${WRKSRC}/out/${KBUILD_TARGET}.${KBUILD_ARCH}/release/stage${TRUE_PREFIX}/share/kBuild && ${COPYTREE_SHARE} \* ${STAGEDIR}${DATADIR})

do-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
.for doc in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/out/${KBUILD_TARGET}.${KBUILD_ARCH}/release/stage${TRUE_PREFIX}/share/doc/${PORTNAME}-${KBUILD_VERSION}/${doc} ${FAKE_DESTDIR}${DOCSDIR}
.endfor

.include <bsd.port.mk>
