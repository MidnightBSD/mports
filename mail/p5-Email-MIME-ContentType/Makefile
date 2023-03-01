# New ports collection makefile for:	p5-Email-MIME-ContentType
# Date created:				Oct 11, 2008
# Whom:					Lucas Holt

PORTNAME=	Email-MIME-ContentType
PORTVERSION=	1.028
CATEGORIES=	mail perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Parse a MIME Content-Type Header
WWW=		https://metacpan.org/release/Email-MIME-ContentType

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Text-Unidecode>=0:converters/p5-Text-Unidecode

NO_ARCH=	yes
USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
