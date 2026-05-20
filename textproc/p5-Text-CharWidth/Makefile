PORTNAME=	Text-CharWidth
DISTVERSION=	0.04
PORTREVISION=	2
CATEGORIES=	textproc perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	perl@FreeBSD.org
COMMENT=	Get number of occupied columns of a string on terminal
WWW=		https://metacpan.org/release/Text-CharWidth

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

USES=		perl5
USE_PERL5=	configure

post-install:
	${STRIP_CMD} ${PREFIX}/${SITE_ARCH_REL}/auto/Text/CharWidth/CharWidth.so

.include <bsd.port.mk>
