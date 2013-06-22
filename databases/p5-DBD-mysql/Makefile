# $MidnightBSD: mports/databases/p5-DBD-mysql/Makefile,v 1.18 2013/03/02 19:42:17 laffer1 Exp $

PORTNAME=	DBD-mysql
PORTVERSION=	4.023
CATEGORIES=	databases perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-
DISTNAME=	${PORTNAME}-${PORTVERSION:S/00$//}

MAINTAINER=	ports@MidnightBSD.org
COMMENT?=	MySQL driver for the Perl5 Database Interface (DBI)
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/DBI.pm:${PORTSDIR}/databases/p5-DBI
RUN_DEPENDS:=	${BUILD_DEPENDS}

CONFLICTS?=	p5-Mysql-modules-[0-9]* p5-DBD-mysql[45][0-9]-[0-9]*

USE_MYSQL=	yes

PERL_CONFIGURE=	yes

MAN3=	Bundle::DBD::mysql.3 DBD::mysql.3 DBD::mysql::INSTALL.3

OPTIONS_DEFINE=	SSL

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MSSL}
CONFIGURE_ARGS+=	--ssl
RUN_DEPENDS+=		p5-Crypt-SSLeay>=0:${PORTSDIR}/security/p5-Crypt-SSLeay
.endif

.include <bsd.port.mk>
