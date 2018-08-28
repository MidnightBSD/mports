# $MidnightBSD$

PORTNAME=	DBI
PORTVERSION=	1.634
CATEGORIES=	databases perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The perl5 Database Interface.  Required for DBD::* modules

LICENSE=	artistic gpl
LICENSE_COMB=	dual

OPTIONS_DEFINE=	PROXY
PROXY_DESC=	Build DBI::Proxy

CONFLICTS=	p5-DBI-1.3*

USES=		perl5 shebangfix
USE_PERL5=	configure
PERL_CONFIGURE=	yes

SHEBANG_FILES=	dbixs_rev.pl

PROXY_BUILD_DEPENDS=	p5-PlRPC>=0.2001:${PORTSDIR}/net/p5-PlRPC
PROXY_RUN_DEPENDS=	p5-PlRPC>=0.2001:${PORTSDIR}/net/p5-PlRPC

.include <bsd.port.mk>
