PORTNAME=	9base
PORTVERSION=	6
PORTEPOCH=	1
CATEGORIES=	devel
MASTER_SITES=	http://dl.suckless.org/tools/
DISTNAME=	${PORTNAME}-6

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Port of various original plan9 tools
WWW=		https://tools.suckless.org/9base

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

ONLY_FOR_ARCHS=		amd64 i386 powerpc powerpc64 powerpc64le sparc64
ONLY_FOR_ARCHS_REASON=	has low-level code unavailable for ${ARCH}

USES=		cpe shebangfix
CPE_VENDOR=	${PORTNAME}_project
SHEBANG_FILES=	troff/tmac/sendcover \
		troff/font/devutf/mkMAP
SHEBANG_LANG=	rc
rc_OLD_CMD=	${PREFIX}/bin/rc
rc_CMD=		${PREFIX}/9/bin/rc
MANDIRS=	${PREFIX}/9/share/man
MAKE_ARGS=	PREFIX="${PREFIX}/9" CC="${CC}" \
		CFLAGS="${CFLAGS} -I. -c" LDFLAGS="${LDFLAGS} -L."
MAKE_JOBS_UNSAFE=	yes

# Fix build on current
CFLAGS+=	-fcommon

post-patch:
	@${REINPLACE_CMD} -e 's|PREFIX|"${PREFIX}/9"|' ${WRKSRC}/lib9/get9root.c

post-install:
	@${FILE} ${STAGEDIR}${PREFIX}/9/bin/* | ${AWK} -F: '/ not stripped/{print $$1}' | \
		${XARGS} ${STRIP_CMD}

.include <bsd.port.mk>
