# $MidnightBSD$

PORTNAME=	Test-NoWarnings
PORTVERSION=	1.04
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Hide and store warnings while running test scripts
LICENSE=	perl

PERL_CONFIGURE=	yes

OPTIONS_DEFINE=	DEVEL_STACKTRACE
DEVEL_STACKTRACE_DESC=	Stack trace support

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MDEVEL_STACKTRACE}
BUILD_DEPENDS+=	p5-Devel-StackTrace>=0:${PORTSDIR}/devel/p5-Devel-StackTrace
RUN_DEPENDS+=	p5-Devel-StackTrace>=0:${PORTSDIR}/devel/p5-Devel-StackTrace
.endif

.include <bsd.port.mk>
