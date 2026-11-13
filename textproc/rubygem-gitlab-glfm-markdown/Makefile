PORTNAME=	gitlab-glfm-markdown
PORTVERSION=	0.0.41
PORTREVISION=	2
CATEGORIES=	textproc rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Markdown processing for GitLab Flavored Markdown
WWW=		https://gitlab.com/gitlab-org/ruby/gems/gitlab-glfm-markdown

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_RUN_DEPENDS=	rubygem-rb_sys>=0.9.124<0.10:lang/rubygem-rb_sys

USES=		cargo gem gmake llvm:build

# Required to be able to build the rust library the gem uses
GEMFILES:=	${DISTNAME}.gem
DISTFILES+=	${DISTNAME}.gem
GEMS_SKIP_SUBDIR=	1
CARGO_VENDOR_DIR=	${WRKSRC}/ext/gitlab_glfm_markdown/cargo-crates
CARGO_CARGOTOML=	${WRKSRC}/ext/gitlab_glfm_markdown/Cargo.toml
CARGO_BUILD=	no
CARGO_INSTALL=	no
GEM_ENV+=	MAKE=gmake

# update the crates file with: make cargo-crates > Makefile.crates

post-install:
	@${ECHO_CMD} "${GEM_LIB_DIR}/ext/gitlab_glfm_markdown/Cargo.lock" >> ${TMPPLIST}

# USES=gem replaces do-extract with 'gem unpack', so the cargo crates in
# EXTRACT_ONLY would never be unpacked for cargo-extract
pre-extract:
	@for f in ${EXTRACT_ONLY:N*.gem}; do \
		(cd ${WRKDIR} && ${EXTRACT_CMD} ${EXTRACT_BEFORE_ARGS} ${_DISTDIR}/$$f ${EXTRACT_AFTER_ARGS}) || exit 1; \
	done

.include <bsd.port.mk>
