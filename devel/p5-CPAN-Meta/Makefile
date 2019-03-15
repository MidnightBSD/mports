# $MidnightBSD$

PORTNAME=	CPAN-Meta
PORTVERSION=	2.143240
PORTREVISION=	0
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The distribution metadata for a CPAN dist

LICENSE=	artistic gpl
LICENSE_COMB=	dual

USES=		perl5
USE_PERL5=	configure

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 501600
BUILD_DEPENDS+=	p5-JSON-PP>=2.27200:${PORTSDIR}/converters/p5-JSON-PP
RUN_DEPENDS+=	p5-JSON-PP>=2.27200:${PORTSDIR}/converters/p5-JSON-PP
.endif

.if ${PERL_LEVEL} < 501800
BUILD_DEPENDS+=	p5-CPAN-Meta-Requirements>=2.121:${PORTSDIR}/devel/p5-CPAN-Meta-Requirements \
		p5-CPAN-Meta-YAML>=0.008:${PORTSDIR}/devel/p5-CPAN-Meta-YAML
RUN_DEPENDS+=	p5-CPAN-Meta-Requirements>=2.121:${PORTSDIR}/devel/p5-CPAN-Meta-Requirements \
		p5-CPAN-Meta-YAML>=0.008:${PORTSDIR}/devel/p5-CPAN-Meta-YAML
.endif

.if ${PERL_LEVEL} < 502000
BUILD_DEPENDS+=	p5-Parse-CPAN-Meta>=1.44.14:${PORTSDIR}/devel/p5-Parse-CPAN-Meta
RUN_DEPENDS+=	p5-Parse-CPAN-Meta>=1.44.14:${PORTSDIR}/devel/p5-Parse-CPAN-Meta
.endif

.include <bsd.port.post.mk>
