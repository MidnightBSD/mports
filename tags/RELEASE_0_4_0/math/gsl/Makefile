# $MidnightBSD: mports/math/gsl/Makefile,v 1.1 2008/12/20 18:38:51 ctriv Exp $

PORTNAME=	gsl
PORTVERSION=	1.15
CATEGORIES=	math
MASTER_SITES=	GNU

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The GNU Scientific Library - mathematical libs
LICENSE=	gpl3

USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ENV+=	MAKEINFO='makeinfo --no-split'

MAN1=		gsl-config.1 gsl-randist.1 gsl-histogram.1
MAN3=		gsl.3
INFO=		gsl-ref

post-extract:
	@${RM} -f ${WRKSRC}/doc/gsl-ref.info*

check regression-test test: build
	@(cd ${WRKSRC}; ${SETENV} ${MAKE_ENV} ${MAKE} ${_MAKE_JOBS} \
	${MAKE_ARGS} check)

.include <bsd.port.mk>
