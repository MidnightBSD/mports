# $MidnightBSD$
# $OpenBSD: Makefile,v 1.14 2003/12/09 18:48:54 jose Exp $

PORTNAME=	XML-RSS
PORTVERSION=	1.48
PORTREVISION=	1
CATEGORIES=     textproc perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	XML
PKGNAMEPREFIX=	p5-

COMMENT=	perl module to manage XML RSS files
MAINTAINER=	luke@MidnightBSD.org
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/XML/Parser.pm:${PORTSDIR}/textproc/p5-XML-Parser \
		${SITE_PERL}/${PERL_ARCH}//DateTime.pm:${PORTSDIR}/devel/p5-DateTime \
		${SITE_PERL}/DateTime/Format/Mail.pm:${PORTSDIR}/devel/p5-DateTime-Format-Mail \
		${SITE_PERL}/DateTime/Format/W3CDTF.pm:${PORTSDIR}/devel/p5-DateTime-Format-W3CDTF \
		p5-HTML-Parser>=0:${PORTSDIR}/www/p5-HTML-Parser
RUN_DEPENDS=    ${BUILD_DEPENDS}
BUILD_DEPENDS+=	p5-Test-Manifest>=0.9:${PORTSDIR}/devel/p5-Test-Manifest

USE_PERL5=	yes
PERL_CONFIGURE=	yes

# Install additional example files
EXAMPLE_LOC=	${PREFIX}/share/examples/p5-XML-RSS
EXAMPLE_PL=	rss2html.pl update_rss.pl convert.pl rss_info.pl \
		create_rss_multiple.pl 1.0/create_rss_1.0.pl \
		1.0/update_rss_1.0.pl 0.91/create_rss_0.91_full.pl \
		0.91/create_rss_0.91.pl 0.9/create_rss.pl
EXAMPLE_DOC=	1.0/rss1.0.rdf 1.0/slash.rdf 0.91/fm.rdf 0.91/rss-0.91.dtd \
		0.91/fm0.91_full.rdf 0.91/fm0.91.rdf 0.91/xmlnews.rdf \
		README 0.9/linuxtoday.rdf 0.9/rss-0.9.dtd 0.9/slashdot.rdf

pre-fake:
	${MKDIR} ${FAKE_DESTDIR}${EXAMPLE_LOC}

post-install:
.for i in 1.0 0.91 0.9
	${MKDIR} ${EXAMPLE_LOC}/$i
.endfor
.for i in ${EXAMPLE_PL}
	${INSTALL_SCRIPT} ${WRKSRC}/examples/$i ${EXAMPLE_LOC}/$i
.endfor
.for i in ${EXAMPLE_DOC}
	${INSTALL_DATA} ${WRKSRC}/examples/$i ${EXAMPLE_LOC}/$i
.endfor
	
.include <bsd.port.mk>
