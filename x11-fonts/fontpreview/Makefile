PORTNAME=	fontpreview
DISTVERSION=	1.0.6
PORTREVISION=	1
CATEGORIES=	x11-fonts graphics

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Very customizable and minimal font previewer written in Bash

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

FAKE_OPTS=	trueprefix

RUN_DEPENDS=	bash:shells/bash \
		convert:graphics/ImageMagick7 \
		fzf:textproc/fzf \
		getopt>0:misc/getopt \
		sxiv:graphics/sxiv \
		xdotool:x11/xdotool

USES=		shebangfix
USE_GITHUB=	yes
GH_ACCOUNT=	sdushantha
SHEBANG_FILES=	${PORTNAME}

NO_ARCH=	yes
NO_BUILD=	yes

PLIST_FILES=	bin/${PORTNAME}
PORTDOCS=	README.md extra/

OPTIONS_DEFINE=	DOCS

post-patch:
	@${REINPLACE_CMD} 's|%%GETOPT%%|${LOCALBASE}/bin/getopt|' \
		${WRKSRC}/${PORTNAME}

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}/extra
	${INSTALL_DATA} ${WRKSRC}/README.md ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/extra/* ${FAKE_DESTDIR}${DOCSDIR}/extra

.include <bsd.port.mk>
