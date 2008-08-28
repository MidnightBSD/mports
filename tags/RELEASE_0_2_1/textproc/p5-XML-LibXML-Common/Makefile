# New ports collection makefile for:	XML::LibXML::Common
# Date created:		7 Nov 2007
# Whom:			Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD$

PORTNAME=	XML-LibXML-Common
PORTVERSION=	0.13
CATEGORIES=	textproc perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	XML
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Routines and Constants common for XML::LibXML and XML::GDOME
LICENSE=	perl

LIB_DEPENDS=	xml2.5:${PORTSDIR}/textproc/libxml2

PERL_CONFIGURE=	yes
CONFIGURE_ARGS=	INC='-I${LOCALBASE}/include -I${LOCALBASE}/include/libxml2'

MAN3=		XML::LibXML::Common.3

.include <bsd.port.mk>
