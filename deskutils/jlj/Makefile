# $MidnightBSD$
# $FreeBSD: ports/deskutils/jlj/Makefile,v 1.14 2006/09/30 18:05:59 bsam Exp $

PORTNAME=	jlj
PORTVERSION=	2.12
CATEGORIES=	deskutils net
MASTER_SITES=	http://umlautllama.com/projects/perl/ \
		http://www.atarininja.org/~wxs/distfiles/
DISTNAME=	${PORTNAME}_${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Jerry's command-line LiveJournal.com entry system

LICENSE=	publicdom

WRKSRC=		${WRKDIR}/${PORTNAME}

USES=		perl5
USE_PERL5=	run
NO_BUILD=	yes
SUB_FILES=	pkg-message

PLIST_FILES=	bin/jlj share/examples/jlj/dot.livejournal.rc
PLIST_DIRS=	share/examples/jlj

.if !defined(NOPORTDOCS)
PORTDOCS=	README
.endif

post-patch:
	@${REINPLACE_CMD} -e 's!/usr/bin/perl!${PERL}!' ${WRKSRC}/jlj.pl

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/jlj.pl ${PREFIX}/bin/jlj
	@${MKDIR} ${PREFIX}/share/examples/jlj
	${INSTALL_DATA} ${WRKSRC}/.livejournal.rc \
		${PREFIX}/share/examples/jlj/dot.livejournal.rc
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README.JLJ ${DOCSDIR}/README
.endif

.include <bsd.port.mk>
