PORTNAME=	SGMLSpm
PORTVERSION=	1.03
CATEGORIES=	textproc perl5
MASTER_SITES=	CPAN/SGMLS
PKGNAMEPREFIX=	p5-
DISTNAME=	${PORTNAME}-${PORTVERSION}ii

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl module for postprocessing the output from sgmls and nsgmls
WWW=		https://metacpan.org/release/DMEGG/SGMLSpm-1.03ii

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		shebangfix perl5
USE_PERL5=	run
NO_BUILD=	yes
WRKSRC=		${WRKDIR}/${PORTNAME}
SHEBANG_FILES=	sgmlspl.pl \
		DOC/sample.pl \
		DOC/HTML/SGMLSpm/example.html

FAKE_MAKEARGS=	BINDIR=${FAKE_DESTDIR}${PREFIX}/bin PERL5DIR=${FAKE_DESTDIR}${SITE_PERL} 
FAKE_MAKEARGS+= SPECDIR=${FAKE_DESTDIR}${EXAMPLESDIR} HTMLDIR=${FAKE_DESTDIR}${DOCSDIR}

pre-install:
	${MKDIR} ${DOCSDIR} ${EXAMPLESDIR} ${FAKE_DESTDIR}${SITE_PERL}


.ifndef(NOPORTDOCS)
PORTDOCS=	*
INSTALL_TARGET= install docs install_html 
.endif

.include <bsd.port.mk>
