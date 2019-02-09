# $MidnightBSD$
# $FreeBSD: ports/x11/xsel/Makefile,v 1.9 2009/01/23 16:28:24 flz Exp $

PORTNAME=	xsel
PORTVERSION=	0.04.1
PORTREVISION=	4
CATEGORIES=	x11
MASTER_SITES=	http://BSDforge.com/projects/source/x11/xsel/

MAINTAINER=	ports@midnightbsd.org
COMMENT=	Access X11 selection buffer from command line

LICENSE=	mit

CONFLICTS_INSTALL=	xsel-conrad-[0-9]*

USES=		tar:bzip2
USE_XORG=	xmu xaw xt xorgproto xkbfile

CFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib -lXt -lXaw -lX11 -lXmu

PLIST_FILES=	bin/${PORTNAME} man/man1/xsel.1.gz
PORTDOCS=	${PORTNAME}.html

OPTIONS_DEFINE=	DOCS

do-build:
	@cd ${WRKSRC} && ${CC} ${CFLAGS} xsel.c -o xsel ${LDFLAGS}

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/${PORTNAME}.man \
		${MAN1PREFIX}/man/man1/${PORTNAME}.1
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/,} ${DOCSDIR}

.include <bsd.port.mk>
