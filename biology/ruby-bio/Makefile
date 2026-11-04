PORTNAME=	bio
PORTVERSION=	1.5.1
CATEGORIES=	biology ruby
MASTER_SITES=	http://bioruby.org/archive/
PKGNAMEPREFIX=	${RUBY_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME}ruby-${PORTVERSION}
DIST_SUBDIR=	ruby

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Integrated environment for Bioinformatics written in Ruby
WWW=		http://bioruby.org/

LICENSE=	gpl2 ruby
LICENSE_COMB=	dual

OPTIONS_DEFINE=	BDB4 MYSQL PGSQL DOCS
BDB4_DESC=	bdb4 support for faster flat file indexing

NO_ARCH=	yes
USES=		ruby:setup shebangfix
SHEBANG_FILES=	sample/biofetch.rb
ruby_OLD_CMD=	/usr/proj/bioruby/bin/ruby

BDB4_RUN_DEPENDS=	${RUBY_SITEARCHLIBDIR}/bdb.so:databases/ruby-bdb
MYSQL_RUN_DEPENDS=	rubygem-dbd-mysql>=0:databases/rubygem-dbd-mysql
PGSQL_RUN_DEPENDS=	rubygem-dbd-pg>=0:databases/rubygem-dbd-pg

CONFLICTS_INSTALL=	rubygem-bio-shell

post-patch:
	${RUBY} -i -pe 'gsub(%r"(/etc/bioinformatics/)") { "${PREFIX}" + $$1 }' \
		${WRKSRC}/doc/Tutorial.rd \
		${WRKSRC}/lib/bio/io/registry.rb

do-install:
	@${MKDIR} ${PREFIX}/etc/bioinformatics
.for f in etc/bioinformatics/seqdatabase.ini
	${INSTALL_DATA} ${WRKSRC}/${f} ${PREFIX}/${f}.sample
.endfor
	@${MKDIR} ${RUBY_MODEXAMPLESDIR}
	${CP} -R ${WRKSRC}/sample/ ${RUBY_MODEXAMPLESDIR}/
	@${MKDIR} ${RUBY_MODDOCDIR}/ja
	${INSTALL_DATA} ${WRKSRC}/ChangeLog ${WRKSRC}/README.rdoc ${RUBY_MODDOCDIR}/
	${INSTALL_DATA} ${WRKSRC}/doc/*.rd ${RUBY_MODDOCDIR}/
	${INSTALL_DATA} ${WRKSRC}/doc/*.rd.ja ${RUBY_MODDOCDIR}/ja/

.include <bsd.port.mk>
