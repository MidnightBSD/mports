PORTNAME=	bareword-filehandles
PORTVERSION=	0.007
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:ILMARI
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Disables bareword filehandles
WWW=		https://metacpan.org/release/bareword-filehandles

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	p5-ExtUtils-Depends>=0:devel/p5-ExtUtils-Depends \
		${RUN_DEPENDS}
RUN_DEPENDS=	p5-B-Hooks-OP-Check>=0:devel/p5-B-Hooks-OP-Check

USE_PERL5=	configure
USES=		perl5

post-install:
	${STRIP_CMD} ${PREFIX}/${SITE_ARCH_REL}/auto/bareword/filehandles/filehandles.so

.include <bsd.port.mk>
