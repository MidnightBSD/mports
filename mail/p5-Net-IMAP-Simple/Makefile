PORTNAME=	Net-IMAP-Simple
PORTVERSION=	1.2212
CATEGORIES=	mail perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl extension for simple IMAP account handling
WWW=		https://metacpan.org/release/Net-IMAP-Simple

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-IO-Socket-SSL>0:security/p5-IO-Socket-SSL \
		p5-Net-SSLeay>=0:security/p5-Net-SSLeay \
		p5-Parse-RecDescent>=0:devel/p5-Parse-RecDescent

PORTSCOUT=	skipv:1.20271

NO_ARCH=	yes
USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
