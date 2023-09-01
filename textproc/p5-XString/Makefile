PORTNAME=	XString
PORTVERSION=	0.005
CATEGORIES=	textproc perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:ATOOMIC
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Isolated String helpers from B
WWW=		https://metacpan.org/release/XString

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		perl5
USE_PERL5=	configure

post-install:
	${STRIP_CMD} ${PREFIX}/${SITE_ARCH_REL}/auto/XString/XString.so

.include <bsd.port.mk>
