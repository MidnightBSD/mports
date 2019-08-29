PORTNAME=	MIME-Lite
PORTVERSION=	3.03.0
PORTREVISION=	1
CATEGORIES=	mail perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-
DISTNAME=	${PORTNAME}-${PORTVERSION:R}${PORTVERSION:E}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple interface for creating (not parsing!) MIME messages

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-Email-Date-Format>=1.000:mail/p5-Email-Date-Format \
		p5-MIME-Types>=1.28:mail/p5-MIME-Types \
		p5-Mail-Tools>=1.62:mail/p5-Mail-Tools
RUN_DEPENDS:=	${BUILD_DEPENDS}

NO_ARCH=	yes
NO_TEST=	yes
USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
