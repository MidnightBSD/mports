PORTNAME=	Devel-MAT-Dumper
PORTVERSION=	0.52
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:PEVANS
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Write a heap dump file for later analysis
WWW=		https://metacpan.org/release/Devel-MAT-Dumper

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		perl5
USE_PERL5=	modbuild

post-install:
	${STRIP_CMD} ${PREFIX}/${SITE_PERL_REL}/auto/Devel/MAT/Dumper/Dumper.so

.include <bsd.port.mk>
