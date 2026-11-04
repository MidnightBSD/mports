PORTNAME=	iris
DISTVERSIONPREFIX=	v
DISTVERSION=	0.7.3
CATEGORIES=	shells

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Shell auto-completion tool for your terminal
WWW=		https://github.com/versenilvis/IRIS

LICENSE=	bsd0
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		go:modules

GO_MODULE=	github.com/versenilvis/iris
GO_TARGET=	./cmd/iris
GO_BUILDFLAGS=	-ldflags="-w -X github.com/versenilvis/iris/root.Version=${DISTVERSION}"

PLIST_FILES=	bin/${PORTNAME}
PORTDOCS=	README.md

OPTIONS_DEFINE=		COMPLETIONS DOCS
OPTIONS_DEFAULT=	COMPLETIONS

COMPLETIONS_DESC=	Build and/or install shell completions

COMPLETIONS_PLIST_FILES=etc/bash_completion.d/${PORTNAME} \
			share/fish/completions/${PORTNAME}.fish \
			share/zsh/site-functions/_${PORTNAME}

post-build-COMPLETIONS-on:
	@${MKDIR} ${WRKSRC}/completions
.for sh in bash fish zsh
	${GO_WRKDIR_BIN}/${PORTNAME} completion ${sh} > \
		${WRKSRC}/completions/${PORTNAME}.${sh}
.endfor

post-install-COMPLETIONS-on:
	@${MKDIR} ${COMPLETIONS_PLIST_FILES:H:S|^|${FAKE_DESTDIR}${PREFIX}/|}
.for sh in bash fish zsh
	${INSTALL_DATA} ${WRKSRC}/completions/${PORTNAME}.${sh} \
		${COMPLETIONS_PLIST_FILES:M*${sh}*:S|^|${FAKE_DESTDIR}${PREFIX}/|}
.endfor

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_MAN} ${PORTDOCS:S|^|${WRKSRC}/|} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
