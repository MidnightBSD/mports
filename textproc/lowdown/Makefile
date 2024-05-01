PORTNAME=	lowdown
PORTVERSION=	1.1.0
CATEGORIES=	textproc
MASTER_SITES=	https://kristaps.bsd.lv/lowdown/snapshots/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple Markdown translator
WWW=		https://kristaps.bsd.lv/lowdown/

LICENSE=	iscl

BUILD_DEPENDS=	${LOCALBASE}/lib/libdiff.a:textproc/libdiff
LDFLAGS+=	-lmd
MAKE_ARGS=	LDFLAGS="${LDFLAGS}"

HAS_CONFIGURE=	yes
CONFIGURE_ARGS=	PREFIX="${PREFIX}"
INSTALL_TARGET=	install install_libs

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/bin/${PORTNAME}
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/bin/${PORTNAME}-diff

.include <bsd.port.mk>
