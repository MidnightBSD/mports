# $MidnightBSD$

PORTNAME=	CGI
PORTVERSION=	4.25
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:LEEJO
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Handle Common Gateway Interface requests and responses

LICENSE=	artistic2 gpl
LICENSE_COMB=	dual

PERL_CONFIGURE=	yes

PORTSCOUT=	limit:^[0-9\.]*$$

NO_ARCH=	yes
USES=		perl5
USE_PERL5=	configure

PORTEXAMPLES=	*

OPTIONS_DEFINE=	EXAMPLES

post-install:
	@${MKDIR} ${EXAMPLESDIR}
	(cd ${WRKSRC}/examples && ${COPYTREE_SHARE} . ${EXAMPLESDIR})

.include <bsd.port.mk>
