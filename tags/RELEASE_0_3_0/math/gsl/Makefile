#
# $MidnightBSD: ports/math/gsl/Makefile,v 1.42 2008/08/21 06:17:41 rafan Exp $
#

PORTNAME=	gsl
PORTVERSION=	1.11
CATEGORIES=	math
MASTER_SITES=	${MASTER_SITE_GNU:S/$/:gsl/} \
		http://www.gnu.org/software/${PORTNAME}/manual/:gslref
MASTER_SITE_SUBDIR=	${PORTNAME}/:gsl
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}:gsl
.if !defined(NOPORTDOCS)
DISTFILES+=	${GSLREF}:gslref
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}
.endif

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The GNU Scientific Library - mathematical libs
LICENSE=	gpl2

USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ENV+=	MAKEINFO='makeinfo --no-split'

MAN1=		gsl-config.1 gsl-randist.1 gsl-histogram.1
MAN3=		gsl.3
INFO=		gsl-ref

GSLREF=		gsl-ref.ps.gz
IGNOREFILES=	${GSLREF}

post-extract:
	@${RM} -f ${WRKSRC}/doc/gsl-ref.info*

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${PREFIX}/share/doc/gsl
	${INSTALL_DATA} ${_DISTDIR}/${GSLREF} ${PREFIX}/share/doc/gsl
	${GUNZIP_CMD} ${PREFIX}/share/doc/gsl/${GSLREF}
.endif

test:
	@cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${GMAKE} check

.include <bsd.port.mk>
