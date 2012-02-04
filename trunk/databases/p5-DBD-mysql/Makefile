# $MidnightBSD: mports/databases/p5-DBD-mysql/Makefile,v 1.12 2011/05/31 00:15:19 laffer1 Exp $

PORTNAME=	DBD-mysql
PORTVERSION=	4.020
DISTNAME=	${PORTNAME}-${PORTVERSION:S/00$//}
CATEGORIES=	databases perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT?=	MySQL driver for the Perl5 Database Interface (DBI)
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/DBI.pm:${PORTSDIR}/databases/p5-DBI
RUN_DEPENDS=	${BUILD_DEPENDS}

CONFLICTS?=	p5-Mysql-modules-[0-9]* p5-DBD-mysql4[0-9]-[0-9]* p5-DBD-mysql5[0-9]-[0-9]* p5-DBD-mysql6[0-9]-[0-9]*

USE_MYSQL=	yes

PERL_CONFIGURE=	yes

MAN3=	Bundle::DBD::mysql.3 DBD::mysql.3 DBD::mysql::INSTALL.3

.include <bsd.port.mk>
