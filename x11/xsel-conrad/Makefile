PORTNAME=	xsel
PORTVERSION=	1.2.0
PORTREVISION=	1
CATEGORIES=	x11
MASTER_SITES=	http://www.vergenet.net/~conrad/software/xsel/download/
PKGNAMESUFFIX=	-conrad

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Access X selection from command line
WWW=		https://www.vergenet.net/~conrad/software/xsel/

LICENSE=	xsel-conrad
LICENSE_GROUPS=	COPYFREE
LICENSE_NAME=	xsel-conrad license
LICENSE_FILE=	${WRKSRC}/COPYING
LICENSE_PERMS=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

CONFLICTS_INSTALL=	xsel-[0-9]*

USES=		autoreconf localbase xorg
USE_XORG=	x11 xt
GNU_CONFIGURE=	yes
PLIST_FILES=	bin/${PORTNAME} share/man/man1/${PORTNAME}.1.gz
PORTDOCS=	ChangeLog README

OPTIONS_DEFINE=	DOCS

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin/
	${INSTALL_MAN} ${WRKSRC}/${PORTNAME}.1x ${PREFIX}/share/man/man1/${PORTNAME}.1

do-install-DOCS-on:
	(cd ${WRKSRC} && ${COPYTREE_SHARE} \
		"${PORTDOCS}" ${FAKE_DESTDIR}${DOCSDIR})

.include <bsd.port.mk>
