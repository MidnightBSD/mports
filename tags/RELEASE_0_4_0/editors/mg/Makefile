# $MidnightBSD: mports/editors/mg/Makefile,v 1.5 2010/04/26 13:12:12 laffer1 Exp $

PORTNAME=	mg
PORTVERSION=	20110905
CATEGORIES=	editors
MASTER_SITES=	http://homepage.boetes.org/software/mg/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A small, fast Emacs-like editor
LICENSE=	publicdom

MAN1=	mg.1
MANCOMPRESSED=	no
PORTDOCS=	README tutorial
HAS_CONFIGURE=	yes

pre-configure:
	@${REINPLACE_CMD} -e 's|-Wno-error=unused-but-set-variable||g' \
		-e '/^CC=/d' -e 's|-g -Wall|-Wall|' -e 's|/usr/local|${PREFIX}|' \
		${WRKSRC}/Makefile.in

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin
	${INSTALL_MAN}  ${WRKSRC}/${PORTNAME}.1 ${MANPREFIX}/man/man1
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
.for f in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/${f} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
