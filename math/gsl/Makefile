# $MidnightBSD$

PORTNAME=	gsl
PORTVERSION=	1.16
CATEGORIES=	math
MASTER_SITES=	GNU

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The GNU Scientific Library - mathematical libs

LICENSE=	gpl3

USES=		libtool makeinfo pathfix
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ENV+=	MAKEINFO='makeinfo --no-split'
INSTALL_TARGET=	install-strip

NO_TEST=	yes

INFO=		gsl-ref

post-extract:
	@${RM} -f ${WRKSRC}/doc/gsl-ref.info*

#prevent regression test coredumps from causing failures on the
#package-building cluster:
.ifndef(MAINTAINER_MODE)
CORELIMIT?=	/usr/bin/limits -Sc 0
.endif

check regression-test test: build
	@(cd ${WRKSRC}; ${SETENV} ${MAKE_ENV} ${MAKE} ${_MAKE_JOBS} \
	${MAKE_ARGS} check)

.include <bsd.port.mk>
