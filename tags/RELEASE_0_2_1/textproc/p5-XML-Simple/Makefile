# New ports collection makefile for:	p5-XML-Simple
# Date created:				October 10th 2000
# Whom:	      				Andrew <andrew@ugh.net.au>
#
# $MidnightBSD: mports/textproc/p5-XML-Simple/Makefile,v 1.1 2007/03/11 04:48:24 laffer1 Exp $
# $FreeBSD: ports/textproc/p5-XML-Simple/Makefile,v 1.18 2007/02/03 02:27:48 clsung Exp $
#

PORTNAME=	XML-Simple
PORTVERSION=	2.18
CATEGORIES=	textproc perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	XML
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Trivial API for reading and writing XML (esp config files)
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/XML/Parser.pm:${PORTSDIR}/textproc/p5-XML-Parser \
    		${SITE_PERL}/XML/SAX/Expat.pm:${PORTSDIR}/textproc/p5-XML-SAX-Expat
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	YES

MAN3=		XML::Simple.3 XML::Simple::FAQ.3

.include <bsd.port.pre.mk>
.if ${PERL_LEVEL} <= 500503
EXTRA_PATCHES=	${PATCHDIR}/5.005_03-lib::XML::Simple.pm ${PATCHDIR}/5.005_03-Makefile.PL

post-patch:
	@${FIND} ${WRKSRC} -name '*.orig' -delete

post-configure:
	${PERL} -pi -e 's/(\(POD2MAN_EXE\))/$$1 --lax/' ${WRKSRC}/Makefile

.endif
.include <bsd.port.post.mk>
