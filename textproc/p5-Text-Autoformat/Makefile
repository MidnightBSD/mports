PORTNAME=	Text-Autoformat
PORTVERSION=	1.670.000
PORTREVISION=	3
CATEGORIES=	textproc perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:NEILB
PKGNAMEPREFIX=	p5-
DISTNAME=	${PORTNAME}-${PORTVERSION:C/0\.(000)$//}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Automatic and manual text wrapping and reformating
WWW=		https://metacpan.org/release/Text-Autoformat

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-Text-Reform>=1.11:textproc/p5-Text-Reform
RUN_DEPENDS:=	${BUILD_DEPENDS}

USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
