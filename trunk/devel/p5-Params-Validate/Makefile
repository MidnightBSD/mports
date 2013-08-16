# $MidnightBSD: mports/devel/p5-Params-Validate/Makefile,v 1.4 2011/05/15 21:30:08 laffer1 Exp $

PORTNAME=	Params-Validate
PORTVERSION=	1.08
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ctriv@MidnightBSD.org
COMMENT=	Validate method/function parameters
LICENSE=	perl

BUILD_DEPENDS=	p5-Module-Implementation>=0.04:${PORTSDIR}/devel/p5-Module-Implementation
RUN_DEPENDS=	p5-Module-Implementation>=0.04:${PORTSDIR}/devel/p5-Module-Implementation

PERL_MODBUILD=	yes

MAN3=		Attribute::Params::Validate.3 \
		Params::Validate.3

.include <bsd.port.mk>
