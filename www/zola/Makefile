PORTNAME=	zola
DISTVERSIONPREFIX=	v
DISTVERSION=	0.23.6
CATEGORIES=	www

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast static site generator
WWW=		https://www.getzola.org/

LICENSE=	EUPL12 mit
LICENSE_COMB=	multi
LICENSE_FILE_EUPL12=	${WRKSRC}/LICENSE
LICENSE_FILE_mit=	${WRKSRC}/LICENSE-MIT

NOT_FOR_ARCHS=	i386
NOT_FOR_ARCHS_REASON=	the ring crate requires SSE2 instruction on intel cpu

LIB_DEPENDS=	libonig.so:devel/oniguruma \
		libzstd.so:archivers/zstd

USES=		cargo ssl
USE_GITHUB=	yes
GH_ACCOUNT=	getzola

MAKE_ENV=	CARGO_PROFILE_RELEASE_LTO=off

PLIST_FILES=	bin/zola \
		etc/bash_completion.d/zola.bash \
		share/fish/completions/zola.fish \
		share/zsh/site-functions/_zola
PORTDOCS=	*

OPTIONS_DEFINE=	DOCS

post-install:
	${STRIP_CMD} ${PREFIX}/bin/zola
	@${MKDIR} ${PREFIX}/etc/bash_completion.d \
		${PREFIX}/share/fish/completions \
		${PREFIX}/share/zsh/site-functions
	${PREFIX}/bin/zola completion bash > \
		${PREFIX}/etc/bash_completion.d/zola.bash
	${PREFIX}/bin/zola completion fish > \
		${PREFIX}/share/fish/completions/zola.fish
	${PREFIX}/bin/zola completion zsh > \
		${PREFIX}/share/zsh/site-functions/_zola

post-install-DOCS-on:
	@cd ${WRKSRC}/docs && \
		${COPYTREE_SHARE} . ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
