PORTNAME=	mypaedia-fpw-package
PORTVERSION=	1.0.7
PORTREVISION=	14
CATEGORIES=	japanese elisp
MASTER_SITES=	http://openlab.ring.gr.jp/edict/fpw/dist/mypaedia/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Supplement file to use "mypaedia" on lookup
WWW=		http://openlab.ring.gr.jp/edict/mypaedia-fpw/

LICENSE=	NONE

RUN_DEPENDS=	sox:audio/sox \
		timidity:audio/timidity++ \
		xanim:multimedia/xanim

USES=		magick:6,run

NO_BUILD=	yes
PLIST_SUB=	PKGNAME=${PKGNAME}

PKG_DIR=	${STAGEDIR}${PREFIX}/share/dict/lookup-package

OPTIONS_DEFINE=	DOCS

do-install:
	@${MKDIR} ${PKG_DIR}
	${INSTALL_DATA} ${WRKSRC}/mypaedia-fpw.el ${PKG_DIR}
	${INSTALL_SCRIPT} ${WRKSRC}/extract-mypaedia.pl ${PKG_DIR}
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	(cd ${WRKSRC} && ${INSTALL_DATA} ChangeLog README.TXT \
		${STAGEDIR}${DOCSDIR})

.include <bsd.port.mk>
