# $MidnightBSD$

PORTNAME=	Test-SubCalls
PORTVERSION=	1.09
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	Test
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Track the number of times subs are called
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/Hook/LexWrap.pm:${PORTSDIR}/devel/p5-Hook-LexWrap \
		${SITE_PERL}/Test/Builder/Tester.pm:${PORTSDIR}/devel/p5-Test-Simple
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

post-patch:
	@${PERL} -pi -e '$$_="" if m/Test::More/' ${WRKSRC}/Makefile.PL

.include <bsd.port.mk>
