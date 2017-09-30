# $MidnightBSD$

PORTNAME=	Log-Log4perl
PORTVERSION=	1.49
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Log4j implementation for Perl

LICENSE=	perl

RUN_DEPENDS+=	p5-Storable>0:${PORTSDIR}/devel/p5-Storable
BUILD_DEPENDS:=	${RUN_DEPENDS}

PERL_CONFIGURE=	yes

regression-test: build
	@cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${MAKE} test

.include <bsd.port.mk>
