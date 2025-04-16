PORTNAME=	eza
DISTVERSIONPREFIX=	v
DISTVERSION=	0.17.3
CATEGORIES=	sysutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Modern, maintained replacement for ls
WWW=		https://eza.rocks/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENCE

USES=		cargo
USE_GITHUB=	yes
GH_ACCOUNT=	eza-community

OPTIONS_DEFINE=	MANPAGES

MANPAGES_BUILD_DEPENDS=	pandoc:textproc/hs-pandoc

PLIST_FILES=	bin/${PORTNAME} \
		etc/bash_completion.d/${PORTNAME}.bash \
		share/fish/completions/${PORTNAME}.fish \
		share/zsh/site-functions/_${PORTNAME}

_MARKDOWN_FILES=	eza.1 eza_colors-explanation.5 eza_colors.5
.for i in ${_MARKDOWN_FILES}
MANPAGES_PLIST_FILES+=	share/man/man${i:C/.*\.//}/${i}.gz
.endfor

post-build-MANPAGES-on:
.for i in ${_MARKDOWN_FILES}
	cd ${WRKSRC}/man && \
		pandoc ${i}.md -s -t man > ${i}
.endfor

post-install:
	@${MKDIR} ${STAGEDIR}${PREFIX}/etc/bash_completion.d
	${INSTALL_DATA} ${WRKSRC}/completions/bash/${PORTNAME} ${STAGEDIR}${PREFIX}/etc/bash_completion.d/${PORTNAME}.bash
	@${MKDIR} ${STAGEDIR}${PREFIX}/share/fish/completions
	${INSTALL_DATA} ${WRKSRC}/completions/fish/${PORTNAME}.fish ${STAGEDIR}${PREFIX}/share/fish/completions/${PORTNAME}.fish
	@${MKDIR} ${STAGEDIR}${PREFIX}/share/zsh/site-functions
	${INSTALL_DATA} ${WRKSRC}/completions/zsh/_${PORTNAME} ${STAGEDIR}${PREFIX}/share/zsh/site-functions/_${PORTNAME}
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/bin/${PORTNAME}

post-install-MANPAGES-on:
.for i in ${_MARKDOWN_FILES}
	${INSTALL_MAN} ${WRKSRC}/man/${i} ${FAKE_DESTDIR}${MANPREFIX}/share/man/man${i:C/.*\.//}
.endfor

.include <bsd.port.mk>
