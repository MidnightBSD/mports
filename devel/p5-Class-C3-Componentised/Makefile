# $MidnightBSD$

PORTNAME=	Class-C3-Componentised
PORTVERSION=	1.0010
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-
DISTNAME=	${PORTNAME}-${PORTVERSION}00

MAINTAINER=	ctriv@MidnightBSD.org
COMMENT=	Load mix-ins or components to your C3-based class

LICENSE=	perl

RUN_DEPENDS=	p5-Class-C3>=0.20:${PORTSDIR}/devel/p5-Class-C3 \
		p5-MRO-Compat>0:${PORTSDIR}/devel/p5-MRO-Compat \
		p5-Class-Inspector>=0:${PORTSDIR}/devel/p5-Class-Inspector
BUILD_DEPENDS:=	${RUN_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		Class::C3::Componentised.3 Class::C3::Componentised::ApplyHooks.3

post-extract:
	@${REINPLACE_CMD} -i '' -e '/Test::/d' ${WRKSRC}/Makefile.PL

.include <bsd.port.mk>
