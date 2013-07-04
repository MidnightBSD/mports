# $MidnightBSD: mports/devel/p5-Clone/Makefile,v 1.3 2009/12/13 18:41:17 laffer1 Exp $

PORTNAME=	Clone
PORTVERSION=	0.34
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ctriv@MidnightBSD.org
COMMENT=	Clone - recursively copy Perl datatypes
LICENSE=	perl

PERL_CONFIGURE=	yes

MAN3=		Clone.3

post-patch:
	${PERL} -pi -e 'm.OPTIMIZE.&&s,.,,sg' ${WRKSRC}/Makefile.PL

.include <bsd.port.mk>

