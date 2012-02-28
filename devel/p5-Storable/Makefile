# $MidnightBSD: mports/devel/p5-Storable/Makefile,v 1.3 2009/12/13 20:53:30 laffer1 Exp $

PORTNAME=	Storable
PORTVERSION=	2.30
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Persistency for perl data structures
LICENSE=	perl

PERL_CONFIGURE=	yes

MAN3=		Storable.3

post-patch:
	@${PERL} -pi -e '$$_="" if /MAN3PODS|INSTALLDIRS/' ${WRKSRC}/Makefile.PL

.include <bsd.port.mk>
