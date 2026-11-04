PORTNAME=		zsh-navigation-tools
PORTVERSION=		2.2.7
DISTVERSIONPREFIX=	v
CATEGORIES=		shells

MAINTAINER=		ports@MidnightBSD.org
COMMENT=		Curses-based tools for Zshell, e.g. multi-word history searcher
WWW=		https://github.com/psprint/zsh-navigation-tools

LICENSE=		gpl3 mit
LICENSE_COMB=		dual
LICENSE_FILE=		${WRKSRC}/LICENSE

FAKE_OPTS=		trueprefix

RUN_DEPENDS=		zsh:shells/zsh

NO_ARCH=		yes
OPTIONS_DEFINE=		DOCS
SUB_FILES=		pkg-message

USE_GITHUB=		yes
GH_ACCOUNT=		psprint

.include <bsd.port.mk>
