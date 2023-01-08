PORTNAME=	DBI
PORTVERSION=	1.643
PORTREVISION=	2
CATEGORIES=	databases perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl5 Database Interface, required for DBD::* modules
WWW=		https://metacpan.org/release/DBI

LICENSE=	artistic gpl
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

OPTIONS_DEFINE=	PROXY
PROXY_DESC=	Build DBI::Proxy

USES=		cpe perl5 shebangfix
USE_PERL5=	configure
CPE_VENDOR=	perl

SHEBANG_FILES=	dbixs_rev.pl

PROXY_BUILD_DEPENDS=	p5-PlRPC>=0.2001:net/p5-PlRPC
PROXY_RUN_DEPENDS=	p5-PlRPC>=0.2001:net/p5-PlRPC

post-install:
	${STRIP_CMD} ${PREFIX}/${SITE_ARCH_REL}/auto/DBI/DBI.so

.include <bsd.port.mk>
