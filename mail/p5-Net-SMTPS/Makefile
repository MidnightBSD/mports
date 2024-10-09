PORTNAME=	Net-SMTPS
PORTVERSION=	0.04
CATEGORIES=	mail perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	SSL/STARTTLS support for Net::SMTP
WWW=		https://metacpan.org/release/Net-SMTPS

LICENSE=	perl

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Authen-SASL>=2:security/p5-Authen-SASL \
		p5-IO-Socket-SSL>=1.9:security/p5-IO-Socket-SSL

USES=		perl5
USE_PERL5=	configure

MAKE_JOBS_UNSAFE=	yes
NO_ARCH=	yes

.include <bsd.port.mk>
