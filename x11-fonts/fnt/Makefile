PORTNAME=	fnt
PORTVERSION=	1.7
CATEGORIES=	x11-fonts sysutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Missing font manager for UNIX
WWW=		https://github.com/alexmyczko/fnt

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	bash:shells/bash \
		chafa:graphics/chafa \
		lynx:www/lynx \
		otfinfo:print/typetools

USES=		shebangfix
USE_GITHUB=	yes
GH_ACCOUNT=	alexmyczko

SHEBANG_FILES=	fnt

NO_ARCH=	yes
NO_BUILD=	yes

PLIST_FILES=	bin/fnt \
		share/man/man1/fnt.1.gz

OPTIONS_DEFINE=		ZSH
OPTIONS_DEFAULT=	ZSH

ZSH_PLIST_FILES=	share/zsh/site-functions/_fnt

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/${PORTNAME} ${STAGEDIR}${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/${PORTNAME}.1 \
		${STAGEDIR}${PREFIX}/share/man/man1

do-install-ZSH-on:
	@${MKDIR} ${FAKE_DESTDIR}${PREFIX}/share/zsh/site-functions/
	${INSTALL_DATA} ${WRKSRC}/completions/_fnt \
		${FAKE_DESTDIR}${PREFIX}/share/zsh/site-functions/

.include <bsd.port.mk>
