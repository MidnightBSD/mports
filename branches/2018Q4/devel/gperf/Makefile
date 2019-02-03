# $MidnightBSD$

PORTNAME=	gperf
PORTVERSION=	3.0.3
PORTREVISION=	3
CATEGORIES=	devel
MASTER_SITES=	GNU

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Generates perfect hash functions for sets of keywords

LICENSE=	gpl2

MAKE_JOBS_UNSAFE=	yes

GNU_CONFIGURE=	yes

INFO=		gperf
CONFIGURE_ARGS+=	--docdir=${DOCSDIR}

regression-test: test

test:	build
	@cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${MAKE} check

.include <bsd.port.mk>
