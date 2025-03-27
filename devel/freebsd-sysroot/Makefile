PORTNAME=	freebsd-sysroot
DISTVERSION=	a2023-03-23
CATEGORIES=	devel
MASTER_SITES=	https:/www.midnightbsd.org/ftp/MidnightBSD/mports/distfiles/rust/bootstrap/${FLAVOR}/12.4-RELEASE/ \
		http://ftp-archive.freebsd.org/pub/FreeBSD-Archive/old-releases/${FLAVOR}/12.4-RELEASE/ \
		FREEBSD_LOCAL/rust:${FLAVOR}
PKGNAMEPREFIX=	${FLAVOR:S/_/-/g}-
DISTFILES=	${_SYSROOT_DIST:@f@rust/bootstrap/${FLAVOR}/${_SYSROOT_VER}/${f:T}:${FLAVOR}@}
EXTRACT_ONLY=	${DISTFILES:[1]:S/:${FLAVOR}$$//}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	FreeBSD ${_SYSROOT_VER} ${FLAVOR:S/_/ /} sysroot
WWW=		https://www.FreeBSD.org/

LICENSE=	FREEBSD
LICENSE_NAME=	FreeBSD base licenses
LICENSE_FILE=	${WRKDIR}/COPYRIGHT
LICENSE_PERMS=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

FLAVORS=	amd64 i386 
FLAVOR?=	${FLAVORS:[1]}

OPSYS=freebsd

QA_ENV=		IGNORE_QA_baselibs=1 \
		IGNORE_QA_no_arch=1 \
		IGNORE_QA_proxydeps=1 \
		IGNORE_QA_stripped=1
EXTRACT_AFTER_ARGS=	-C${FAKE_DESTDIR}${_SYSROOT} --no-same-permissions \
			${_SYSROOT_INCLUDE:@x@--include=$x@} \
			${_SYSROOT_EXCLUDE:@x@--exclude=$x@}
NO_ARCH=	yes
NO_BUILD=	yes
NO_MTREE=	yes
SUB_FILES=	${exists(${FILESDIR}/${FLAVOR}-c++.in):?${FLAVOR}-c++:} \
		${exists(${FILESDIR}/${FLAVOR}-cc.in):?${FLAVOR}-cc:} c++ cc
SUB_LIST=	FREEBSD_SYSROOT="${_SYSROOT}" \
		FREEBSD_SYSROOT_CC="${CC}" \
		FREEBSD_SYSROOT_CXX="${CXX}" \
		FREEBSD_SYSROOT_LLVM_TRIPLE="${_SYSROOT_LLVM_TRIPLE}"
PLIST=		${.CURDIR}/pkg-plist.${FLAVOR}
PLIST_SUB=	ROOT=${_SYSROOT:S,^${PREFIX}/,,}

_SYSROOT=				${TRUE_PREFIX}/${PORTNAME}/${FLAVOR:S/_/-/g}
_SYSROOT_VER=				12.4-RELEASE
_SYSROOT_DIST=				${_SYSROOT_DIST_${FLAVOR}}
_SYSROOT_DIST_amd64=			releases/amd64/${_SYSROOT_VER}/base.txz
_SYSROOT_DIST_i386=			releases/i386/${_SYSROOT_VER}/base.txz
_SYSROOT_INCLUDE=			COPYRIGHT lib/* usr/include/* usr/lib/* \
					usr/libdata/* \
					${_SYSROOT_INCLUDE_${FLAVOR}}
_SYSROOT_EXCLUDE=			lib/geom/* lib/casper/* lib/libalias_* \
					lib/nvmecontrol/* usr/include/private/* \
					usr/lib/pam_* usr/lib/snmp_* \
					usr/lib/libprivate* *_p.a \
					${_SYSROOT_EXCLUDE_${FLAVOR}}
_SYSROOT_ARCH_amd64=			x86_64
_SYSROOT_ARCH_i386=			i686
_SYSROOT_LLVM_TRIPLE=			${_SYSROOT_LLVM_TRIPLE_${FLAVOR}:U${_SYSROOT_ARCH_${FLAVOR}:U${FLAVOR}}-unknown-${OPSYS:tl}}

.if make(distclean) || make(makesum)
MASTER_SITES:=	${FLAVORS:O:@_flavor@${:!${SETENV} FLAVOR=${_flavor} ${MAKE} -VMASTER_SITES!}@}
DISTFILES:=	${FLAVORS:O:@_flavor@${:!${SETENV} FLAVOR=${_flavor} ${MAKE} -V'DISTFILES'!}@}
.endif

.include <bsd.port.pre.mk>

pre-extract:
	@${MKDIR} ${FAKE_DESTDIR}${_SYSROOT}

post-extract:
	@${FIND} ${FAKE_DESTDIR}${_SYSROOT} -type d -empty -delete
	@${MV} ${FAKE_DESTDIR}${_SYSROOT}/COPYRIGHT ${WRKDIR}

do-install:
	@${MKDIR} ${FAKE_DESTDIR}${_SYSROOT}/bin
	${INSTALL_SCRIPT} ${WRKDIR}/${exists(${FILESDIR}/${FLAVOR}-cc.in):?${FLAVOR}-cc:cc} \
		${FAKE_DESTDIR}${_SYSROOT}/bin/cc
	${INSTALL_SCRIPT} ${WRKDIR}/${exists(${FILESDIR}/${FLAVOR}-c++.in):?${FLAVOR}-c++:c++} \
		${FAKE_DESTDIR}${_SYSROOT}/bin/c++
	@${CAT} ${FAKE_DESTDIR}${_SYSROOT}/bin/c*
# sanity check cross compilers.
	@${PRINTF} '#include <stdio.h>\nint main(){return printf("hello\\n");}' | \
		${SETENV} FREEBSD_SYSROOT=${FAKE_DESTDIR}${_SYSROOT} ${FAKE_DESTDIR}${_SYSROOT}/bin/cc \
		-o ${WRKDIR}/test-c -xc -
# produce some useful info for the build logs like what release/arch test-c is compiled for
	@cd ${WRKDIR} && \
		${FILE} test-c && \
		${READELF} -A test-c
	@${PRINTF} '#include <iostream>\nint main(){std::cout<<"hello"<<std::endl;return 0;}' | \
		${SETENV} FREEBSD_SYSROOT=${FAKE_DESTDIR}${_SYSROOT} ${FAKE_DESTDIR}${_SYSROOT}/bin/c++ \
		-o ${WRKDIR}/test-c++ -xc++ -

.include <bsd.port.post.mk>
