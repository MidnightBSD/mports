# $MidnightBSD: mports/databases/p5-DBD-Pg/Makefile,v 1.6 2011/08/13 14:40:40 laffer1 Exp $

PORTNAME=	DBD-Pg
PORTVERSION=	2.19.3
CATEGORIES=	databases perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Provides access to PostgreSQL databases through the DBI
LICENSE=        perl

BUILD_DEPENDS=	p5-DBI>=1.52:${PORTSDIR}/databases/p5-DBI
RUN_DEPENDS=	${BUILD_DEPENDS}

USE_PGSQL=	yes

PERL_CONFIGURE=	yes

MAN3=		DBD::Pg.3 Bundle::DBD::Pg.3

.if !defined(NOPORTDOCS)
PORTDOCS=	Changes README TODO

post-install:
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${DOCSDIR}
	@${ECHO_MSG} "===> Documentation installed in ${DOCSDIR}."
.endif

.include <bsd.port.mk>
