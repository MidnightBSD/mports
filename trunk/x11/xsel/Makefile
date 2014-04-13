# $MidnightBSD$
# $FreeBSD: ports/x11/xsel/Makefile,v 1.9 2009/01/23 16:28:24 flz Exp $
#

PORTNAME=	xsel
PORTVERSION=	0.04.1
PORTREVISION=	1
CATEGORIES=	x11
MASTER_SITES=	CENKES
#http://www.niksula.cs.hut.fi/~vherva/xsel/xsel.{c,man}

MAINTAINER=	ports@midnightbsd.org
COMMENT=	Access X selection from command line

LICENSE=	mit

CONFLICTS=	xsel-conrad-[0-9]*

USES=		tar:bzip2
USE_XORG=	xmu xaw xt xproto xkbfile
CFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib -lXt -lXaw -lX11 -lXmu
PLIST_FILES=	bin/${PORTNAME} man/man1/xsel.1.gz
PORTDOCS=	${PORTNAME}.html

.include <bsd.mport.options.mk>

do-build:
	@cd ${WRKSRC} && ${CC} ${CFLAGS} xsel.c -o xsel ${LDFLAGS}

do-install:
	@${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin/
	@${INSTALL_MAN} ${WRKSRC}/${PORTNAME}.man ${MAN1PREFIX}/man/man1/${PORTNAME}.1
.if ${PORT_OPTIONS:MDOCS}
	@${INSTALL} -d ${DOCSDIR}/
	@cd ${WRKSRC}/&&${INSTALL_DATA} ${PORTDOCS} ${DOCSDIR}/
.endif

.include <bsd.port.mk>
