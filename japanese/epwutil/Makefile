PORTNAME=	epwutil
PORTVERSION=	1.1
PORTREVISION=	2
CATEGORIES=	japanese
MASTER_SITES=	http://openlab.ring.gr.jp/edict/epwutil/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Utilities to manage Japanese EPWING or Electric-Book based CD-ROM

LICENSE=	other

MAKEFILE=	makefile.unx

EPWPROGS=	bookinfo catdump squeeze

PLIST_FILES=	${EPWPROGS:S|^|bin/|} ${EPWPROGS:S|^|share/man/ja/man1/|:S|$|.1.gz|}

PORTDOCS=	epwutil.doc

OPTIONS_DEFINE=	DOCS

do-install:
.for file in ${EPWPROGS}
	${INSTALL_PROGRAM} ${WRKSRC}/${file} ${STAGEDIR}${PREFIX}/bin
	${MKDIR} ${STAGEDIR}${PREFIX}/share/man/ja/man1
	${INSTALL_MAN} ${WRKSRC}/${file}.man \
		${STAGEDIR}${PREFIX}/share/man/ja/man1/${file}.1
.endfor
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${STAGEDIR}${DOCSDIR}

.include <bsd.port.mk>
