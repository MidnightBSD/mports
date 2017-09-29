# New ports collection makefile for:	XML::SAX::Expat
# Date created:		19 Nov 2001
# Whom:			Sergey Skvortsov <skv@protey.ru>
#
# $MidnightBSD$
# $FreeBSD: ports/textproc/p5-XML-SAX-Expat/Makefile,v 1.7 2007/01/28 14:53:50 skv Exp $
#

PORTNAME=	XML-SAX-Expat
PORTVERSION=	0.38
PORTREVISION=	1
CATEGORIES=	textproc perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	XML
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple API for XML
LICENSE=        perl

RUN_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/XML/Parser.pm:${PORTSDIR}/textproc/p5-XML-Parser \
		${SITE_PERL}/XML/SAX.pm:${PORTSDIR}/textproc/p5-XML-SAX \
		${SITE_PERL}/XML/NamespaceSupport.pm:${PORTSDIR}/textproc/p5-XML-NamespaceSupport
BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_CONFIGURE=	yes

PLIST_SUB+=     PERL=${PERL}

post-patch:
		@${PERL} -pi -e "s/(?<=XML::SAX::Base          => ')1\.00(?=')/0.25/;" ${WRKSRC}/Makefile.PL

#pre-install:
#	@${SETENV} PKG_PREFIX=${PREFIX} ${PERL} ${PKGINSTALL} ${PKGNAME} PRE-INSTALL

#post-install:
#	@${SETENV} PKG_PREFIX=${PREFIX} ${PERL} ${PKGINSTALL} ${PKGNAME} POST-INSTALL

.include <bsd.port.mk>
