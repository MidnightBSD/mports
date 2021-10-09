# Created by: Vasil Dimov <vd@datamax.bg>


PORTNAME=	sparsehash
PORTVERSION=	2.0.3
DISTVERSIONPREFIX=	${PORTNAME}-
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Extremely memory-efficient hash_map implementation

LICENSE=	bsd3

USES=		pathfix
USE_GITHUB=	yes

WRKSRC=		${WRKDIR}/sparsehash-sparsehash-${PORTVERSION}

GNU_CONFIGURE=	yes

OPTIONS_DEFINE=	DOCS

post-patch:
	${REINPLACE_CMD} -e \
		's|^docdir = .*|docdir = ${DOCSDIR}|' \
		${WRKSRC}/Makefile.in

regression-test: check

check: build
	cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${MAKE} ${MAKE_FLAGS} ${MAKEFILE} ${MAKE_ARGS} check

.include <bsd.port.mk>
