PORTNAME=	DBD-mysql
PORTVERSION=	4.050
CATEGORIES=	databases perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:CAPTTOFU
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT?=	MySQL driver for the Perl5 Database Interface (DBI)
WWW=		https://metacpan.org/release/DBD-mysql

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS} \
		p5-Devel-CheckLib>=1.09:devel/p5-Devel-CheckLib
RUN_DEPENDS=	p5-DBI>=1.08:databases/p5-DBI

CONFLICTS_INSTALL?=	p5-DBD-mysql[45][0-9]-[0-9]*

USES=		compiler:c11 mysql perl5
CONFIGURE_ARGS=	${CONFIGURE_ARGS_${CHOSEN_COMPILER_TYPE}}
CONFIGURE_ARGS_gcc=	--libs="-L${PREFIX}/lib/gcc${GCC_DEFAULT} `mysql_config --libs | ${SED} 's/-pthread //'`"
USE_PERL5=	configure

USE_GCC=	8

NO_TEST=	yes

OPTIONS_DEFINE=	SSL
SSL_RUN_DEPENDS=	p5-Crypt-SSLeay>=0:security/p5-Crypt-SSLeay
SSL_CONFIGURE_OFF=	--nossl
SSL_CONFIGURE_ON=	--ssl
SSL_USES=		ssl

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/${SITE_ARCH_REL}/auto/DBD/mysql/mysql.so

.include <bsd.port.mk>
