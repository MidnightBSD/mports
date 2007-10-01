# New ports collection makefile for:	XML-Filter-BufferText
# Date created:	   17 March 2002
# Whom:		   Sergey Skvortsov <skv@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/textproc/p5-XML-Filter-BufferText/Makefile,v 1.4 2003/07/10 11:50:57 skv Exp $
#

PORTNAME=	XML-Filter-BufferText
PORTVERSION=	1.01
CATEGORIES=	textproc perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	XML
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Filter to put all characters() in one event

RUN_DEPENDS=	${SITE_PERL}/XML/SAX.pm:${PORTSDIR}/textproc/p5-XML-SAX
BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		XML::Filter::BufferText.3

.include <bsd.port.mk>
