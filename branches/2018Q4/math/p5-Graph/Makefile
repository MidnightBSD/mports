# $MidnightBSD$

PORTNAME=	Graph
PORTVERSION=	0.96
CATEGORIES=	math perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Graph, the Perl module for graph operations
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/Heap.pm:${PORTSDIR}/devel/p5-Heap \
		${SITE_PERL}/${PERL_ARCH}/List/Util.pm:${PORTSDIR}/lang/p5-Scalar-List-Utils
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

.include <bsd.port.mk>
