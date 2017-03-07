# $MidnightBSD$

PORTNAME=	Storable
PORTVERSION=	2.51
PORTREVISION=	0
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Persistency for perl data structures

LICENSE=	artistic gpl
LICENSE_COMB=	dual

USE_PERL5=	yes
PERL_CONFIGURE=	yes

post-patch:
	@${PERL} -pi -e '$$_="" if /MAN3PODS|INSTALLDIRS/' ${WRKSRC}/Makefile.PL

.include <bsd.port.mk>
