# $MidnightBSD$

PORTNAME=	Email-Simple
PORTVERSION=	2.216
CATEGORIES=	mail perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple parsing of RFC2822 message format and headers

LICENSE=	artistic gpl
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	p5-Email-Date-Format>=0:mail/p5-Email-Date-Format
RUN_DEPENDS:=	${BUILD_DEPENDS}

USES=		perl5
USE_PERL5=	configure
PERL_CONFIGURE=	yes
NO_ARCH=	yes

.include <bsd.port.mk>
