# New ports collection makefile for: dict
# Date created:         6 August 1997
# Whom:                 wosch
#
# $MidnightBSD$
#

PORTNAME=	dict-de
PORTVERSION=	1.2
PORTREVISION=	4
CATEGORIES=	misc german
MASTER_SITES=	http://wolfram.schneider.org/src/
DISTNAME=	dict-${PORTVERSION}
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} ${dict}.gz
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple english/german dictionary
LICENSE=	unknown

BUILD_DEPENDS=	agrep:${PORTSDIR}/textproc/agrep
RUN_DEPENDS=	agrep:${PORTSDIR}/textproc/agrep

FAKE_OPTS=	trueprefix

dict=		ger-eng.txt

post-extract: ${dict}
${dict}:
	${GZCAT} < ${DISTDIR}/${dict}.gz > ${WRKSRC}/${.TARGET}

.include <bsd.port.mk>
