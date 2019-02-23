PORTNAME=	gems
# Do not forget to update the following gemspec patches:
# - security/rubygem-ezcrypto/files/patch-gemspec
# - www/rubygem-gitlab-grack/files/patch-gemspec
PORTVERSION=	2.7.7
CATEGORIES=	devel ruby
MASTER_SITES=	http://production.cf.rubygems.org/rubygems/
PKGNAMEPREFIX=	${RUBY_PKGNAMEPREFIX}
DISTNAME=	ruby${PORTNAME}-${PORTVERSION}
DIST_SUBDIR=	ruby

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Package management framework for the Ruby language

LICENSE=	mit ruby
LICENSE_COMB=	dual
LICENSE_FILE_mit=	${WRKSRC}/MIT.txt
LICENSE_FILE_ruby=	${WRKSRC}/LICENSE.txt

NO_ARCH=	yes
NO_BUILD=	yes
USE_RUBY=	yes
RUBY_SETUP=	setup.rb
USES=		tar:tgz

GEMS_BASE_DIR=		lib/ruby/gems
GEMS_BASE_DIR_P=	${GEMS_BASE_DIR}
GEMS_VER_DIR=		${GEMS_BASE_DIR}/${RUBY_VER}
GEMS_VER_DIR_P=		${GEMS_BASE_DIR_P}/%%RUBY_VER%%
GEMS_DOC_BASE_DIR=	${GEMS_VER_DIR}/doc
GEMS_DOC_BASE_DIR_P=	${GEMS_VER_DIR_P}/doc
GEMS_DOC_DIR=		${GEMS_DOC_BASE_DIR}/${DISTNAME}
GEMS_DOC_DIR_P=		${GEMS_DOC_BASE_DIR_P}/%%DISTNAME%%
GEMS_ENV=		DONT_USE_BUNDLER_FOR_GEMDEPS=true GEM_HOME=${FAKE_DESTDIR}${TRUE_PREFIX}/${GEMS_VER_DIR}
RUBY_SETUP_OPTIONS=	--destdir=${FAKE_DESTDIR} --no-regenerate-binstubs
RUBY_VER_SHORT=		${RUBY_VER:S/.//}

GEMS_DIR=		${GEMS_VER_DIR}/gems
DOC_DIR=		${GEMS_VER_DIR}/doc
CACHE_DIR=		${GEMS_VER_DIR}/cache
SPEC_DIR=		${GEMS_VER_DIR}/specifications
EXT_DIR=		${GEMS_VER_DIR}/extensions

PLIST_SUB=	DISTNAME="${DISTNAME}" \
		RUBY_VER_SHORT="${RUBY_VER_SHORT}" \
		GEMS_DIR="${GEMS_DIR}" \
		DOC_DIR="${DOC_DIR}" \
		CACHE_DIR="${CACHE_DIR}" \
		SPEC_DIR="${SPEC_DIR}" \
		EXT_DIR="${EXT_DIR}"

DOCS_VARS_OFF=	RUBY_SETUP_OPTIONS+="--no-ri --no-rdoc"

pre-fake:
	${LN} -sf /usr/local/bin/ruby${RUBY_VER_SHORT} ${FAKE_DESTDIR}${TRUE_PREFIX}/bin/
	${LN} -sf gem${RUBY_VER_SHORT} ${FAKE_DESTDIR}${TRUE_PREFIX}/bin/gem

do-install:
	cd ${WRKSRC}/ && ${SETENV} ${GEMS_ENV} ${RUBY} ${RUBY_SETUP} ${RUBY_SETUP_OPTIONS}
	${INSTALL_SCRIPT} ${WRKSRC}/bin/gem ${PREFIX}/bin/gem${RUBY_VER_SHORT}

#
# Find all RDOC and RI files
#
post-install-DOCS-on:
	cd ${FAKE_DESTDIR}${TRUE_PREFIX}/ && ${FIND} -ds ${GEMS_DOC_DIR}/ ! -type d >> ${TMPPLIST}

.include <bsd.port.mk>
