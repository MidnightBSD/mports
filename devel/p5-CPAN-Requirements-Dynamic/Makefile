PORTNAME=	CPAN-Requirements-Dynamic
PORTVERSION=	0.003
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:LEONT
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Dynamic prerequisites in meta files
WWW=		https://metacpan.org/dist/CPAN-Requirements-Dynamic

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE_gpl+ =	${WRKSRC}/LICENSE

BUILD_RUN_DEPENDS=	p5-ExtUtils-Config>=0:devel/p5-ExtUtils-Config \
			p5-ExtUtils-HasCompiler>=0:devel/p5-ExtUtils-HasCompiler

USES=		perl5
USE_PERL5=	configure

NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
