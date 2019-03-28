PORTNAME=	LWP-Online
PORTVERSION=	1.08
PORTREVISION=	1
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:ADAMK
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Checks if process has access to the web

LICENSE=	artistic gpl
LICENSE_COMB=	dual

RUN_DEPENDS+=	p5-libwww>=5.805:www/p5-libwww \
		p5-URI>=1.35:net/p5-URI

USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
