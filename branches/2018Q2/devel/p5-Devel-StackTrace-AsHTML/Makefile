# $MidnightBSD$

PORTNAME=	Devel-StackTrace-AsHTML
PORTVERSION=	0.15
#PORTREVISION=	0
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:MIYAGAWA
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl extension to display stack trace in HTML

LICENSE=	artistic gpl
LICENSE_COMB=	dual

RUN_DEPENDS=	p5-Devel-StackTrace>0:devel/p5-Devel-StackTrace
BUILD_DEPENDS:=	${RUN_DEPENDS}

USES=		perl5
USE_PERL5=	configure
PERL_CONFIGURE=	yes

.include <bsd.port.mk>
