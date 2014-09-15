# $MidnightBSD$

PORTNAME=	postgresql-plruby
PORTVERSION=	0.5.4
PORTREVISION=	2
CATEGORIES=	databases ruby
DIST_SUBDIR=	ruby

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PL/Ruby procedural language for the PostgreSQL database system

LICENSE=	unknown

BUILD_DEPENDS=	postgres:${PORTSDIR}/${POSTGRESQL_PORT}
RUN_DEPENDS=	postgres:${PORTSDIR}/${POSTGRESQL_PORT}

USE_GITHUB=	yes
GH_ACCOUNT=	CraigCottingham
GH_TAGNAME=	${GH_COMMIT}
GH_COMMIT=	f8d9ced

USES+=		uidfix tar:bzip2
USE_PGSQL=	yes
USE_RUBY=	yes
USE_RUBY_EXTCONF=	yes
USE_RUBY_RDOC=		yes

POSTGRESQL_PORT?=	databases/postgresql${PGSQL_VER}-server
PGSQL_PORTDIR?=		${PORTSDIR}/${POSTGRESQL_PORT}
PGSQL_WRKSRC_CMD=	cd ${PGSQL_PORTDIR} && ${MAKE} -V WRKSRC

CONFIGURE_ARGS=		--with-pg-config="${LOCALBASE}/bin/pg_config" \
			--with-pgsql-srcinc="`${PGSQL_WRKSRC_CMD}`/src/include"
#CONFIGURE_ARGS+=	--with-safe-level=0
#CONFIGURE_ARGS+=	--with-main-safe-level=0
#CONFIGURE_ARGS+=	--with-timeout=30
INSTALL_TARGET=	site-install

DOCS=		Changes plruby.html plruby.rd

OPTIONS_DEFINE=	DOCS

PKGMESSAGE=	${WRKDIR}/createlang.sql

.include <bsd.mport.options.mk>

post-fetch:
	cd ${PGSQL_PORTDIR} && ${MAKE} -DBATCH patch

post-build:
	${SED} 's,!!PLRUBY_SO!!,${RUBY_SITEARCHLIBDIR}/plruby.so,' \
		${FILESDIR}/createlang.sql > ${WRKDIR}/createlang.sql
.if !defined(NOPORTDOCS)
	cd ${BUILD_WRKSRC}; ${SETENV} ${MAKE_ENV} ${MAKE} ${MAKE_FLAGS} ${MAKEFILE} ${MAKE_ARGS} rdoc
.endif

.include <bsd.port.pre.mk>

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${RUBY_MODEXAMPLESDIR}/
	${INSTALL_DATA} ${WRKDIR}/createlang.sql ${RUBY_MODEXAMPLESDIR}/
	${MKDIR} ${RUBY_MODDOCDIR}
	@(cd ${WRKSRC}/ && ${COPYTREE_SHARE} ${DOCS} ${RUBY_MODDOCDIR}/)

	@${FIND} -ds ${RUBY_MODDOCDIR} -type f -print | ${SED} -E -e \
		's,^${PREFIX}/?,,' >> ${TMPPLIST}
	@${FIND} -ds ${RUBY_MODDOCDIR} -type d -print | ${SED} -E -e \
		's,^${PREFIX}/?,@dirrm ,' >> ${TMPPLIST}
	@${ECHO_CMD} "@unexec rmdir %D/share/doc/ruby18/ 2>/dev/null || true" \
		>> ${TMPPLIST}
.endif

.include <bsd.port.post.mk>
