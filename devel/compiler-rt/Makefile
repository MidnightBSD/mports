PORTNAME=	compiler-rt
DISTVERSION=	0.r${SVN_REV}
PORTREVISION=	3
CATEGORIES=	devel
MASTER_SITES=	FREEBSD_LOCAL/brooks

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Compiler runtime library with Blocks support
WWW=		https://compiler-rt.llvm.org/

LICENSE=	bsd3 mit
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE.TXT

BROKEN_powerpc=		does not compile
BROKEN_powerpc64=	does not build: undefined reference to fmax

CONFIGURE_WRKSRC=	${WRKDIR}/build
BUILD_WRKSRC=		${WRKDIR}/build
INSTALL_WRKSRC=		${WRKDIR}/build
TEST_WRKSRC=		${WRKDIR}/build
TEST_TARGET=		test

CMAKE_SOURCE_PATH=	${WRKSRC}

USES=		cmake:insource tar:bzip2
USE_LDCONFIG=	yes

LLVM_SVN=	http://llvm.org/svn/llvm-project

# fixuns?fti_test tests fail
# powi?f2_test tests fail to link due to lack of -lm
BROKEN_TESTS?=	fixunsdfti_test \
		fixunssfti_test \
		powidf2_test \
		powisf2_test \
		powixf2_test

PLIST_FILES=	include/Block.h \
		include/Block_private.h \
		lib/libBlocksRuntime.so

.include <bsd.port.pre.mk>

.if ${ARCH} == "i386"
CFLAGS+=	-march=i486
.endif

.if defined(BOOTSTRAP)
SVN_REV!=	svn info ${LLVM_SVN}/ | ${GREP} Revision | cut -d' ' -f2
.else
.include "Makefile.svn_rev"
.endif

.if defined(BOOTSTRAP)
FETCH_DEPENDS+=	svn:devel/subversion

do-fetch:
	${MKDIR} ${WRKDIR}
	svn export -r ${SVN_REV} \
	    ${LLVM_SVN}/compiler-rt/trunk ${WRKSRC}
	cd ${WRKDIR}; tar cvfy ${DISTDIR}/${DISTNAME}.tar.bz2 ${DISTNAME}
	echo "SVN_REV=	${SVN_REV}" > ${MASTERDIR}/Makefile.svn_rev
.endif

post-extract:
	${MKDIR} ${CONFIGURE_WRKSRC}

post-patch:
.for test in ${BROKEN_TESTS}
	${REINPLACE_CMD} -e 's/\(MACRO_ADD_CHECK_TEST( ${test}\)/# \1/' \
	    ${WRKSRC}/test/CMakeLists.txt
.endfor

.include <bsd.port.post.mk>
