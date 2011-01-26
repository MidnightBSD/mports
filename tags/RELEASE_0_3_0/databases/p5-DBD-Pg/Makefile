# $MidnightBSD: mports/databases/p5-DBD-Pg/Makefile,v 1.4 2009/10/14 13:19:01 laffer1 Exp $
# $FreeBSD: ports/databases/p5-DBD-Pg/Makefile,v 1.69 2006/05/14 17:19:16 leeym Exp $

PORTNAME=	DBD-Pg
PORTVERSION=	2.17.1
CATEGORIES=	databases perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Provides access to PostgreSQL databases through the DBI
LICENSE=        perl

BUILD_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/DBI.pm:${PORTSDIR}/databases/p5-DBI
RUN_DEPENDS=	${BUILD_DEPENDS}

CONFLICTS=	p5-DBD-Pg-1.3*

USE_PGSQL=	yes

PERL_CONFIGURE=	yes

MAN3=		DBD::Pg.3

.if !defined(NOPORTDOCS)
PORTDOCS=	Changes README TODO

post-install:
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${DOCSDIR}
	@${ECHO_MSG} "===> Documentation installed in ${DOCSDIR}."
.endif

.include <bsd.port.pre.mk>

PG_CONFIG=	${LOCALBASE}/bin/pg_config
CONFIGURE_ENV+=	POSTGRES_INCLUDE=`${PG_CONFIG} --includedir` \
		POSTGRES_LIB=`${PG_CONFIG} --libdir`

.include <bsd.port.post.mk>
