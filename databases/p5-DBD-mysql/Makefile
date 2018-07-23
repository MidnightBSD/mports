# $MidnightBSD$

PORTNAME=	DBD-mysql
PORTVERSION=	4.046
CATEGORIES=	databases perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT?=	MySQL driver for the Perl5 Database Interface (DBI)

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-DBI>=1.08:${PORTSDIR}/databases/p5-DBI
RUN_DEPENDS:=	${BUILD_DEPENDS}
TEST_DEPENDS=	p5-Test-Deep>=0:${PORTSDIR}/devel/p5-Test-Deep

CONFLICTS_INSTALL?=	p5-Mysql-modules-[0-9]* p5-DBD-mysql[45][0-9]-[0-9]*

USE_MYSQL=	yes

PERL_CONFIGURE=	yes

OPTIONS_DEFINE=	SSL
SSL_BUILD_DEPENDS=	p5-Crypt-SSLeay>=0:${PORTSDIR}/security/p5-Crypt-SSLeay
SSL_RUN_DEPENDS=	${SSL_BUILD_DEPENDS}
SSL_CONFIGURE_ON=	--ssl

.include <bsd.port.mk>
