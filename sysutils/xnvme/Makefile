PORTNAME=	xnvme
DISTVERSION=	0.7.5
CATEGORIES=	sysutils
MASTER_SITES=	https://github.com/xnvme/xnvme/releases/download/v${DISTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cross-platform libraries and tools for NVMe devices
WWW=		https://xnvme.io/

LICENSE=	bsd3

NOT_FOR_ARCHS=	armv7 i386 powerpc
NOT_FOR_ARCHS_REASON=	use of types with platform-specific length

USES=		meson pkgconfig
USE_LDCONFIG=	yes

MESON_ARGS=	-Dforce_completions=true \
		-Dwith-isal=disabled \
		-Dwith-libaio=disabled \
		-Dwith-liburing=disabled \
		-Dwith-libvfn=disabled \
		-Dwith-spdk=disabled

OPTIONS_DEFINE=		EXAMPLES TESTS TOOLS
OPTIONS_DEFAULT=	TOOLS
OPTIONS_SUB=		yes

EXAMPLES_DESC=	Install the CLI example binaries
TESTS_DESC=	Install the CLI test binaries
TOOLS_DESC=	Install the CLI tool binaries

EXAMPLES_MESON_TRUE=	examples
TESTS_MESON_TRUE=	tests
TOOLS_MESON_TRUE=	tools

NO_TEST=	yes

.include <bsd.port.mk>
