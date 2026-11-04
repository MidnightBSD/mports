PORTNAME=	aws-vault
DISTVERSIONPREFIX=	v
DISTVERSION=	6.6.2
PORTREVISION=	16
CATEGORIES=	security

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Vault for securely storing and accessing AWS credentials
WWW=		https://github.com/99designs/aws-vault

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		go:modules

GO_MODULE=	github.com/99designs/aws-vault/v6
GO_BUILDFLAGS=	-ldflags="-s -w -X main.Version=${PORTVERSION}"

PORTDOCS=	README.md USAGE.md

OPTIONS_DEFINE=	DOCS YUBIKEY
OPTIONS_SUB=	yes

YUBIKEY_DESC=	Install Yubikey IAM helper script

post-install:
	@${MKDIR} ${PREFIX}/etc/bash_completion.d
	@${MKDIR} ${PREFIX}/share/fish/completions
	@${MKDIR} ${PREFIX}/share/zsh/site-functions
	${INSTALL_DATA} ${WRKSRC}/contrib/completions/bash/aws-vault.bash ${PREFIX}/etc/bash_completion.d
	${INSTALL_DATA} ${WRKSRC}/contrib/completions/fish/aws-vault.fish ${PREFIX}/share/fish/completions
	${INSTALL_DATA} ${WRKSRC}/contrib/completions/zsh/aws-vault.zsh ${PREFIX}/share/zsh/site-functions

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${FAKE_DESTDIR}${DOCSDIR}

post-install-YUBIKEY-on:
	${INSTALL_SCRIPT} ${WRKSRC}/contrib/scripts/aws-iam-create-yubikey-mfa.sh ${FAKE_DESTDIR}${PREFIX}/bin

.include <bsd.port.mk>
