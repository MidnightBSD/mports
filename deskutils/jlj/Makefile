PORTNAME=	jlj
PORTVERSION=	2.12
PORTREVISION=	1
CATEGORIES=	deskutils net
MASTER_SITES=	http://umlautllama.com/projects/perl/ \
		http://www.atarininja.org/~wxs/distfiles/
DISTNAME=	${PORTNAME}_${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Jerry's command-line LiveJournal.com entry system
WWW=		http://umlautllama.com/projects/perl/ #jlj

LICENSE=	publicdom

USES=		shebangfix perl5
USE_PERL5=	run
NO_BUILD=	yes
NO_ARCH=	yes
SUB_FILES=	pkg-message

WRKSRC=		${WRKDIR}/${PORTNAME}

PLIST_FILES=	bin/jlj
PORTDOCS=	README
PORTEXAMPLES=	dot.livejournal.rc

SHEBANG_FILES=	jlj.pl

OPTIONS_DEFINE=	DOCS EXAMPLES

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/jlj.pl ${PREFIX}/bin/jlj

do-install-EXAMPLES-on:
	@${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/.livejournal.rc \
		${FAKE_DESTDIR}${EXAMPLESDIR}/dot.livejournal.rc

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README.JLJ ${FAKE_DESTDIR}${DOCSDIR}/README

.include <bsd.port.mk>
