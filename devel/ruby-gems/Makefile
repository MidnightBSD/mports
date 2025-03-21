PORTNAME=	gems
PORTVERSION=	3.5.23
CATEGORIES=	devel ruby
MASTER_SITES=	https://rubygems.org/rubygems/
PKGNAMEPREFIX=	${RUBY_PKGNAMEPREFIX}
DISTNAME=	rubygems-${PORTVERSION}
DIST_SUBDIR=	ruby

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Package management framework for the Ruby language
WWW=		https://rubygems.org/ \
		https://github.com/rubygems/rubygems

LICENSE=	mit ruby
LICENSE_COMB=	dual
LICENSE_FILE_mit=	${WRKSRC}/MIT.txt
LICENSE_FILE_ruby=	${WRKSRC}/LICENSE.txt

RUN_DEPENDS=	ca_root_nss>=0:security/ca_root_nss

USES=		cpe ruby tar:tgz

GEMS_BASE_DIR=	lib/ruby/gems/${RUBY_VER}
GEMS_ENV=	GEM_HOME=${FAKE_DESTDIR}${TRUE_PREFIX}/${GEMS_BASE_DIR}
NO_ARCH=	yes
NO_BUILD=	yes
RUBY_SETUP=	setup.rb
RUBY_SETUP_OPTIONS=	--destdir=${FAKE_DESTDIR} \
			--no-format-executable \
			--no-regenerate-binstubs \
			--no-regenerate-plugins
RUBY_VER_SHORT=            ${RUBY_VER:S/.//}

CACHE_DIR=	${GEMS_BASE_DIR}/cache
DOC_DIR=	${GEMS_BASE_DIR}/doc
EXT_DIR=	${GEMS_BASE_DIR}/extensions
GEMS_DIR=	${GEMS_BASE_DIR}/gems
PLUGINS_DIR=	${GEMS_BASE_DIR}/plugins
SPEC_DIR=	${GEMS_BASE_DIR}/specifications

PLIST_SUB=	GEMS_DIR="${GEMS_DIR}" \
		DOC_DIR="${DOC_DIR}" \
		CACHE_DIR="${CACHE_DIR}" \
		PLUGINS_DIR="${PLUGINS_DIR}" \
		SPEC_DIR="${SPEC_DIR}" \
		EXT_DIR="${EXT_DIR}" \
		RUBY_VER_SHORT=${RUBY_VER_SHORT}

CPE_VENDOR=	rubygems
CPE_PRODUCT=	rubygems

OPTIONS_DEFINE=	DOCS

DOCS_VARS_OFF=	RUBY_SETUP_OPTIONS+="--no-ri --no-rdoc"

post-extract:
	@${RM} -r ${WRKSRC}/bundler
	@${FIND} ${WRKSRC} -name .document -delete

post-patch:
	-@${RM} ${WRKSRC}/lib/rubygems/commands/setup_command.rb.orig

pre-fake:
	${LN} -sf ${RUBY} ${FAKE_DESTDIR}${RUBY}
#	${LN} -sf gem${RUBY_VER_SHORT} ${FAKE_DESTDIR}${TRUE_PREFIX}/bin/gem

do-install:
	${MKDIR} ${STAGEDIR}${PREFIX}/${GEMS_BASE_DIR}
	${MKDIR} ${STAGEDIR}${PREFIX}/${GEMS_BASE_DIR}/build_info
	${MKDIR} ${STAGEDIR}${PREFIX}/${CACHE_DIR}
	${MKDIR} ${STAGEDIR}${PREFIX}/${DOC_DIR}
	${MKDIR} ${STAGEDIR}${PREFIX}/${EXT_DIR}
	${MKDIR} ${STAGEDIR}${PREFIX}/${GEMS_DIR}
	${MKDIR} ${STAGEDIR}${PREFIX}/${PLUGINS_DIR}
	${MKDIR} ${STAGEDIR}${PREFIX}/${SPEC_DIR}
	cd ${WRKSRC}/ && ${SETENV} ${GEMS_ENV} ${RUBY} ${RUBY_SETUP} ${RUBY_SETUP_OPTIONS}
	${INSTALL_SCRIPT} ${WRKSRC}/exe/gem ${PREFIX}/bin/gem
	${REINPLACE_CMD} -e 's|${FAKE_DESTDIR}||g' ${PREFIX}/bin/gem


# Find all RDOC and RI files
post-install-DOCS-on:
	cd ${FAKE_DESTDIR}${TRUE_PREFIX}/ && ${FIND} -ds ${DOC_DIR}/ ! -type d >> ${TMPPLIST}

.include <bsd.port.mk>
