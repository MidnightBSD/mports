# New ports collection makefile for:	XML::SAX::Expat
# Date created:		19 Nov 2001
# Whom:			Sergey Skvortsov <skv@protey.ru>
#

#

PORTNAME=	XML-SAX-Expat
PORTVERSION=	0.51
PORTREVISION=	1
CATEGORIES=	textproc perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple API for XML

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-XML-Parser>=0:textproc/p5-XML-Parser \
		p5-XML-SAX>=0:textproc/p5-XML-SAX \
		p5-XML-NamespaceSupport>=0:textproc/p5-XML-NamespaceSupport

USES=		perl5 dos2unix
USE_PERL5=	configure
CONFIGURE_ENV=	SKIP_SAX_INSTALL=yes

.include <bsd.port.mk>
