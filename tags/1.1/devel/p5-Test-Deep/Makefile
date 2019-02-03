# $MidnightBSD$

PORTNAME=	Test-Deep
PORTVERSION=	0.110
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Test data structures for differences deeply
LICENSE=	perl

BUILD_DEPENDS=	p5-Test-NoWarnings>=0.02:${PORTSDIR}/devel/p5-Test-NoWarnings \
		p5-Test-Tester>=0.04:${PORTSDIR}/devel/p5-Test-Tester
RUN_DEPENDS:=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes
REINPLACE_ARGS=	-i ''

post-patch:
	@${REINPLACE_CMD} -e '/return (/s/;/);/' ${WRKSRC}/lib/Test/Deep/RegexpOnly.pm

.include <bsd.port.mk>
