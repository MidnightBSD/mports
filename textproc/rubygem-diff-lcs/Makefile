PORTNAME=	diff-lcs
PORTVERSION=	1.6.2
CATEGORIES=	textproc rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	LCS-based diff library for ruby
WWW=		https://halostatue.github.io/diff-lcs/ \
		https://github.com/halostatue/diff-lcs

LICENSE=	artistic2 gpl2+ mit
LICENSE_COMB=	dual
LICENSE_FILE_artistic2=	${WRKSRC}/docs/artistic.txt
LICENSE_FILE_gpl2+ =	${WRKSRC}/docs/COPYING.txt
LICENSE_FILE_mit=	${WRKSRC}/LICENCE.md

USES=		gem shebangfix

NO_ARCH=	yes

PLIST_FILES=	bin/htmldiff bin/ldiff

CONFLICTS_INSTALL=	p5-HTML-Diff # bin/htmldiff

SHEBANG_FILES=	bin/htmldiff bin/ldiff
ruby_OLD_CMD=	ruby

.include <bsd.port.mk>
