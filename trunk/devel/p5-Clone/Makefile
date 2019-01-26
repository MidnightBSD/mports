# $MidnightBSD$

PORTNAME=	Clone
PORTVERSION=	0.41
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ctriv@MidnightBSD.org
COMMENT=	Clone - recursively copy Perl datatypes

LICENSE=	gpl artistic
LICENSE_COMB=	dual

USES=		perl5
USE_PERL5=	configure
PERL_CONFIGURE=	yes

post-patch:
	@${REINPLACE_CMD} -e '/OPTIMIZE/d' ${WRKSRC}/Makefile.PL

post-install:
	@${STRIP_CMD} ${STAGEDIR}/${PREFIX}/${SITE_ARCH_REL}/auto/Clone/Clone.so

.include <bsd.port.mk>

