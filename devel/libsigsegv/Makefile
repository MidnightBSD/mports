PORTNAME=	libsigsegv
PORTVERSION=	2.12
CATEGORIES=	devel
MASTER_SITES=	GNU/libsigsegv

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Handling page faults in user mode

LICENSE=	gpl2

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	AWK="${AWK}" --enable-shared
INSTALL_TARGET=	install-strip
USES=		libtool
USE_LDCONFIG=	yes

PLIST_FILES=	include/sigsegv.h \
		lib/libsigsegv.a \
		lib/libsigsegv.so \
		lib/libsigsegv.so.2 \
		lib/libsigsegv.so.2.0.5

regression-test: build
	@cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${MAKE} ${MAKE_FLAGS} ${MAKEFILE} ${MAKE_ARGS} check

.include <bsd.port.mk>
