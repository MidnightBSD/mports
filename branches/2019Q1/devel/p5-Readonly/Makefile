# $MidnightBSD$
# $FreeBSD: ports/devel/p5-Readonly/Makefile,v 1.3 2007/09/08 00:59:03 linimon Exp $

PORTNAME=	Readonly
PORTVERSION=	1.03
PORTREVISION=	1
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	../../authors/id/R/RO/ROODE
PKGNAMEPREFIX=	p5-
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} \
		${PORTNAME}-XS-${PORTVERSION_XS}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Facility for creating read-only scalars, arrays, hashes

LICENSE=	artistic gpl
LICENSE_COMB=	dual

USES=		perl5
USE_PERL5=	configure
PERL_CONFIGURE=	yes
CONFIGURE_ARGS=	DIR="${PORTNAME}-XS-${PORTVERSION_XS}"
PORTVERSION_XS=	1.04

post-patch:
	${MV} ${WRKDIR}/${PORTNAME}-XS-${PORTVERSION_XS} ${WRKSRC}
	${RM} ${WRKSRC}/*.pl

.include <bsd.port.mk>
