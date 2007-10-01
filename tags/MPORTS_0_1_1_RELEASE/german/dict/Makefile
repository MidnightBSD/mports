# New ports collection makefile for: dict
# Date created:         6 August 1997
# Whom:                 wosch
#
# $FreeBSD: ports/german/dict/Makefile,v 1.15 2003/10/29 07:46:48 linimon Exp $
# $MidnightBSD$
#

PORTNAME=	dict
PORTVERSION=	1.2
CATEGORIES=	german
MASTER_SITES=	http://wolfram.schneider.org/src/
DISTNAME=	dict-${PORTVERSION}
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} ${dict}.gz
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple english/german dictionary

RUN_DEPENDS=	agrep:${PORTSDIR}/textproc/agrep

dict=		ger-eng.txt

post-extract: ${dict}
${dict}:
	${GZCAT} < ${DISTDIR}/${dict}.gz > ${WRKSRC}/${.TARGET}

.include <bsd.port.mk>
