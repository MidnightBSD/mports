PORTNAME=	ghdl
DISTVERSIONPREFIX=	v
DISTVERSION=	4.1.0
CATEGORIES=	cad

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU VHDL simulator
WWW=		https://github.com/ghdl/ghdl

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING.md

BROKEN_aarch64=	build breaks, see https://github.com/ghdl/ghdl/issues/2639

TEST_DEPENDS=	bash:shells/bash \
		${PYTHON_PKGNAMEPREFIX}pyTooling>=2.11.0:devel/py-pyTooling@${PY_FLAVOR}

USES=		ada:run gmake python:test shebangfix
SHEBANG_FILES=	testsuite/testsuite.sh
USE_LDCONFIG=	yes

USE_GITHUB=	yes

GNU_CONFIGURE=	yes

OPTIONS_DEFINE=		SYNTH
OPTIONS_SINGLE=		BACKEND
OPTIONS_SINGLE_BACKEND=	MCODE LLVM
OPTIONS_DEFAULT=	LLVM SYNTH
OPTIONS_SUB=		yes

MCODE_DESC=		Use the MCODE backend
# MCODE is enabled by default and doesn't require any configuration options

LLVM_USES=		llvm:15,lib ncurses
LLVM_CONFIGURE_ON=	--with-llvm-config=${LOCALBASE}/bin/llvm-config${LLVM_VERSION}

SYNTH_DESC=		Enable Synthesis Features in ghdl
SYNTH_CONFIGURE_ON=	--enable-synth

post-install:
	@${STRIP_CMD} ${PREFIX}/lib/libghdl-${DISTVERSION:S/./_/g}.so

post-install-MCODE-on:
	@${STRIP_CMD} \
		${FAKE_DESTDIR}${PREFIX}/bin/ghdl \
		${FAKE_DESTDIR}${PREFIX}/lib/libghdlvpi.so

post-install-LLVM-on:
	@${STRIP_CMD} \
		${FAKE_DESTDIR}${PREFIX}/bin/ghdl \
		${FAKE_DESTDIR}${PREFIX}/bin/ghwdump \
		${FAKE_DESTDIR}${PREFIX}/bin/ghdl1-llvm \
		${FAKE_DESTDIR}${PREFIX}/lib/libghdlvpi.so \
		${FAKE_DESTDIR}${PREFIX}/lib/libghw.so

do-test:
	@cd ${WRKSRC}/testsuite && \
		${SETENV} ${MAKE_ENV} GHDL=${FAKE_DESTDIR}${PREFIX}/bin/ghdl ${SH} testsuite.sh

.include <bsd.port.mk>
