# $MidnightBSD$

PORTNAME=	Parse-CPAN-Meta
PORTVERSION=	1.44.14
PORTREVISION=	0
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:DAGOLDEN
PKGNAMEPREFIX=	p5-
DISTNAME=	${PORTNAME}-${PORTVERSION:R}${PORTVERSION:E}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Parse META.yml and other similar CPAN metadata files

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-CPAN-Meta-YAML>=0.011:devel/p5-CPAN-Meta-YAML
RUN_DEPENDS=	p5-CPAN-Meta-YAML>=0.011:devel/p5-CPAN-Meta-YAML

USES=		perl5
USE_PERL5=	configure

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 501600
BUILD_DEPENDS+=	p5-JSON-PP>=2.27200:converters/p5-JSON-PP
RUN_DEPENDS+=	p5-JSON-PP>=2.27200:converters/p5-JSON-PP
.endif

.include <bsd.port.post.mk>
