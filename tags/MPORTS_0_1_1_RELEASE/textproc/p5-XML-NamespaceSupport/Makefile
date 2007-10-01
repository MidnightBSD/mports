# New ports collection makefile for:	XML::NamespaceSupport
# Date created:		19 Nov 2001
# Whom:			Sergey Skvortsov <skv@protey.ru>
#
# $MidnightBSD$
# $FreeBSD: ports/textproc/p5-XML-NamespaceSupport/Makefile,v 1.7 2005/05/23 15:43:24 skv Exp $
#

PORTNAME=	XML-NamespaceSupport
PORTVERSION=	1.09
PORTREVISION=	1
CATEGORIES=	textproc perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	XML
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A simple generic namespace support class

PERL_CONFIGURE=	yes

MAN3=		XML::NamespaceSupport.3

.include <bsd.port.pre.mk>

post-patch:
.if ${PERL_LEVEL} < 500600
	${PERL} -pi -e '$$_="" if /warnings/' ${WRKSRC}/NamespaceSupport.pm
.endif

.include <bsd.port.post.mk>
