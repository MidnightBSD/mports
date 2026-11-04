PORTNAME=	schemesh
DISTVERSIONPREFIX=	v
DISTVERSION=	0.9.3
CATEGORIES=	shells

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Unix shell and Lisp REPL, fused together
WWW=		https://github.com/cosmos72/schemesh

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_RUN_DEPENDS=	chez-scheme:lang/chez-scheme
LIB_DEPENDS=	liblz4.so:archivers/liblz4 \
		libuuid.so:misc/libuuid

USES=		gmake iconv:lib ncurses

USE_GITHUB=	yes
GH_ACCOUNT=	cosmos72
CFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
USE_LDCONFIG=	yes
MAKE_ARGS=	LIB_ICONV="${ICONV_LIB}"

PLIST_FILES=	bin/schemesh \
		bin/countdown \
		lib/schemesh/libschemesh_${DISTVERSION}.so

post-patch:
	@${REINPLACE_CMD} -e 's,chezscheme,chez-scheme,' \
		${WRKSRC}/utils/find_chez_scheme_dir.sh
	@${REINPLACE_CMD} -r -e 's/^CC=cc/CC=${CC}/' \
		-e 's,^(prefix.+)(=.+)$$,\1= ${TRUE_PREFIX},' \
		-e '/^LDFLAGS/s|$$| ${LDFLAGS}|' \
		-e '/^CFLAGS/s|$$| ${CFLAGS}|' \
		${WRKSRC}/Makefile

.include <bsd.port.mk>
