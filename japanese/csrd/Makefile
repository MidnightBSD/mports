PORTNAME=	csrd
PORTVERSION=	1.0
PORTREVISION=	1
CATEGORIES=	japanese
MASTER_SITES=	http://openlab.ring.gr.jp/edict/csrd/

PATCH_SITES=	http://green.ribbon.to/~ikazuhiro/dic/files/
PATCHFILES=	csrd.c.diff.gz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Utility for Shogakukan Random House English-Japanese Dictionary
WWW=		http://openlab.ring.gr.jp/edict/

LICENSE=	publicdom
LICENSE_FILE=	${WRKSRC}/csrd.doc

MAKEFILE=	makefile.unx
MAKE_ARGS=	CC="${CC}"
ALL_TARGET=	csrd

OPTIONS_DEFINE=	DOCS

PLIST_FILES=	bin/csrd %%DATADIR%%/csrd.fmt %%DATADIR%%/csrd.gai \
		%%DATADIR%%/quiet.fmt %%DATADIR%%/quiet.gai

PORTDOCS=	README csrd.doc

SUB_FILES=	pkg-message

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/csrd ${PREFIX}/bin
	${MKDIR} ${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/csrd.fmt ${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/csrd.gai ${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/quiet.fmt ${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/quiet.gai ${DATADIR}
	${MKDIR} ${DOCSDIR}
.for f in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/${f} ${DOCSDIR}
.endfor

.include <bsd.port.mk>
