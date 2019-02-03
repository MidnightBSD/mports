# $MidnightBSD$
# $FreeBSD: head/devel/p5-Class-Accessor-Lite/Makefile 449893 2017-09-15 08:58:46Z mat $

PORTNAME=	Class-Accessor-Lite
PORTVERSION=	0.08
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Minimalistic variant of p5-Class-Accessor

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS+=	${SITE_PERL}/Module/Install.pm:devel/p5-Module-Install

NO_ARCH=	yes
USE_PERL5=	configure
USES=		perl5
PERL_CONFIGURE=	yes

.include <bsd.port.mk>
