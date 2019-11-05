# Created by Lucas Holt

PORTNAME=	postgresqltuner
PORTVERSION=	1.0.1
#DISTVERSIONPREFIX=	v
CATEGORIES=	databases

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple script to analyse your PostgreSQL database configuration, and give tuning advice

LICENSE=	gpl3

RUN_DEPENDS=	p5-DBD-Pg>=0:databases/p5-DBD-Pg \
		freecolor:sysutils/freecolor

USES=		perl5

USE_GITHUB=	yes
GH_ACCOUNT=	jfcoz
GH_PROJECT=	postgresqltuner

NO_BUILD=	yes

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/postgresqltuner.pl ${PREFIX}/bin/postgresqltuner.pl

.include <bsd.port.mk>
