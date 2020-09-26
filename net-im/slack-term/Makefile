PORTNAME=	slack-term
DISTVERSIONPREFIX=	v
DISTVERSION=	0.5.0
PORTREVISION=	1
CATEGORIES=	net-im

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Slack client for your terminal

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		go:modules

USE_GITHUB=	yes
GH_ACCOUNT=	erroneousboat
GH_SUBDIR=	src/github.com/${GH_ACCOUNT}/${PORTNAME}

SUB_FILES=	pkg-message
SUB_LIST=	PORTNAME=${PORTNAME}

PORTDOCS=	README.md

PLIST_FILES=	bin/slack-term

OPTIONS_DEFINE=	DOCS

post-patch:
	@cd ${WRKSRC}/vendor/github.com/OpenPeeDeeP/xdg && \
		${RLN} xdg_linux.go xdg_freebsd.go

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
