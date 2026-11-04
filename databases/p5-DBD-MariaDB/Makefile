PORTNAME=	DBD-MariaDB
PORTVERSION=	1.24
CATEGORIES=	databases perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:PALI
PKGNAMEPREFIX=	p5-
PKGNAMESUFFIX=	-${FLAVOR}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	MariaDB driver for the Perl5 Database Interface (DBI)
WWW=		https://metacpan.org/release/DBD-MariaDB

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	p5-DBI>=1.08:databases/p5-DBI \
		p5-Devel-CheckLib>=1.09:devel/p5-Devel-CheckLib
RUN_DEPENDS=	p5-DBI>=1.08:databases/p5-DBI
TEST_DEPENDS=	p5-Test-Deep>=0:devel/p5-Test-Deep

FLAVORS=	mariadb123 mariadb118 mariadb114 mariadb106
FLAVOR?=	${FLAVORS:[1]}

USES=		compiler:c11 mysql:${FLAVOR:S/mariadb//}m perl5
USE_PERL5=		configure

CONFIGURE_ARGS=		${CONFIGURE_ARGS_${CHOSEN_COMPILER_TYPE}}
CONFIGURE_ARGS_gcc=	--libs="-L${PREFIX}/lib/gcc${GCC_DEFAULT} `mysql_config --libs | ${SED} 's/-pthread //'`"

OPTIONS_DEFINE=		SSL
SSL_RUN_DEPENDS=	p5-Crypt-SSLeay>=0:security/p5-Crypt-SSLeay
SSL_USES=		ssl:run

post-install:
	${STRIP_CMD} ${PREFIX}/${SITE_ARCH_REL}/auto/DBD/MariaDB/MariaDB.so

.include <bsd.port.mk>
