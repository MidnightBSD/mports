# $MidnightBSD$

PORTNAME=	Test-NoWarnings
PORTVERSION=	1.04
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Hide and store warnings while running test scripts

LICENSE=	artistic gpl
LICENSE_COMB=	dual

USES=		perl5
USE_PERL5=	configure

OPTIONS_DEFINE=	DEVEL_STACKTRACE
DEVEL_STACKTRACE_DESC=	Stack trace support

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MDEVEL_STACKTRACE}
BUILD_DEPENDS+=	p5-Devel-StackTrace>=0:devel/p5-Devel-StackTrace
RUN_DEPENDS+=	p5-Devel-StackTrace>=0:devel/p5-Devel-StackTrace
.endif

.include <bsd.port.mk>
