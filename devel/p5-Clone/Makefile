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

PERL_CONFIGURE=	yes

post-patch:
	${PERL} -pi -e 'm.OPTIMIZE.&&s,.,,sg' ${WRKSRC}/Makefile.PL

.include <bsd.port.mk>

