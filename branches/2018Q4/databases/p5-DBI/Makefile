# $MidnightBSD$

PORTNAME=	DBI
PORTVERSION=	1.641
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

PROXY_BUILD_DEPENDS=	p5-PlRPC>=0.2001:net/p5-PlRPC
PROXY_RUN_DEPENDS=	p5-PlRPC>=0.2001:net/p5-PlRPC

post-install:
	${STRIP_CMD} ${PREFIX}/${SITE_ARCH_REL}/auto/DBI/DBI.so

.include <bsd.port.mk>
