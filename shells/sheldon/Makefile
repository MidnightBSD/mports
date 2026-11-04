PORTNAME=	sheldon
DISTVERSION=	0.8.5
CATEGORIES=	shells

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast, configurable, shell plugin manager
WWW=		https://sheldon.cli.rs/

LICENSE=	Apache-2.0 mit
LICENSE_COMB=	dual
LICENSE_FILE_Apache-2.0=	${WRKSRC}/LICENSE-APACHE
LICENSE_FILE_mit=	${WRKSRC}/LICENSE-MIT

LIB_DEPENDS=	libcurl.so:ftp/curl \
		libssh2.so:security/libssh2

USES=		cargo localbase:ldflags ssl

USE_GITHUB=	yes
GH_ACCOUNT=	rossmacarthur

CARGO_ENV=	OPENSSL_NO_VENDOR=1

PLIST_FILES=	bin/${PORTNAME} \
		etc/bash_completion.d/${PORTNAME} \
		share/zsh/site-functions/_${PORTNAME}

PORTDOCS=	README.md RELEASES.md

OPTIONS_DEFINE=	DOCS

post-install:
	@${MKDIR} ${PREFIX}/etc/bash_completion.d
	${INSTALL_DATA} ${WRKSRC}/completions/${PORTNAME}.bash \
		${PREFIX}/etc/bash_completion.d/${PORTNAME}
	@${MKDIR} ${PREFIX}/share/zsh/site-functions
	${INSTALL_DATA} ${WRKSRC}/completions/${PORTNAME}.zsh \
		${PREFIX}/share/zsh/site-functions/_${PORTNAME}

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_MAN} ${PORTDOCS:S|^|${WRKSRC}/|} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
