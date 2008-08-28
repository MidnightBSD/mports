# New ports collection makefile for:	numpy
# Date created:		20 April 1997
# Whom:			Thomas Gellekum <tg@FreeBSD.org>
#
# $MidnightBSD: mports/math/py-numeric/Makefile,v 1.1 2007/04/08 04:34:08 laffer1 Exp $
# $FreeBSD: ports/math/py-numeric/Makefile,v 1.48 2006/02/06 11:57:02 tg Exp $
#

PORTNAME=	numeric
PORTVERSION=	24.2
CATEGORIES=	math python
MASTER_SITES=	http://numpy.scipy.org/:doc \
		${MASTER_SITE_SOURCEFORGE:S/$/:source/}
MASTER_SITE_SUBDIR=	numpy/:source
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTFILES=	Numeric-${PORTVERSION}${EXTRACT_SUFX}:source \
		numpy.pdf:doc
EXTRACT_ONLY=	Numeric-${PORTVERSION}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The Numeric Extension to Python
LICENSE=	mit

USE_PYTHON=	yes
USE_PYDISTUTILS=yes

WRKSRC=		${WRKDIR}/Numeric-${PORTVERSION}

DOCSDIR=	${PREFIX}/share/doc/py-numeric
EXAMPLESDIR=	${PREFIX}/share/examples/py-numeric

.include <bsd.port.pre.mk>

post-extract:
	@${CP} ${DISTDIR}/numpy.pdf ${WRKDIR}

post-install:
	@${MKDIR} ${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/Demo/*.py ${EXAMPLESDIR}
	@${MKDIR} ${EXAMPLESDIR}/NumTut
	${INSTALL_DATA} ${WRKSRC}/Demo/NumTut/* ${EXAMPLESDIR}/NumTut
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKDIR}/numpy.pdf ${DOCSDIR}
.endif

.include <bsd.port.post.mk>
