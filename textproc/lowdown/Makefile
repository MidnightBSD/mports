PORTNAME=	lowdown
PORTVERSION=	0.8.3
CATEGORIES=	textproc
MASTER_SITES=	https://kristaps.bsd.lv/lowdown/snapshots/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple Markdown translator

LICENSE=	iscl

BUILD_DEPENDS=	${LOCALBASE}/lib/libdiff.a:textproc/libdiff
LDFLAGS+=	-lmd
MAKE_ARGS=	LDFLAGS="${LDFLAGS}" MANDIR=${PREFIX}/share/man

HAS_CONFIGURE=	yes

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/bin/${PORTNAME}
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/bin/${PORTNAME}-diff

.include <bsd.port.mk>
