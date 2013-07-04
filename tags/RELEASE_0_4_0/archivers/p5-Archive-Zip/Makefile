# New ports collection makefile for:	Archive-Zip
# Date created:				Mon Jan  1 09:33:13 2001
# Whom:					will
#
# $MidnightBSD: mports/archivers/p5-Archive-Zip/Makefile,v 1.5 2009/12/25 17:26:51 laffer1 Exp $
# $FreeBSD: ports/archivers/p5-Archive-Zip/Makefile,v 1.28 2006/12/03 12:45:56 demon Exp $
#

PORTNAME=	Archive-Zip
PORTVERSION=	1.30
PORTREVISION=	1
CATEGORIES=	archivers perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl module to create, manipulate, read, and write Zip archive files
LICENSE=	perl

PERL_CONFIGURE=	yes

MAN3=		Archive::Zip.3 Archive::Zip::Tree.3 Archive::Zip::FAQ.3 Archive::Zip::MemberRead.3

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 500903
BUILD_DEPENDS+=	p5-IO-Compress>=2.017:${PORTSDIR}/archivers/p5-IO-Compress
RUN_DEPENDS+=	p5-IO-Compress>=2.017:${PORTSDIR}/archivers/p5-IO-Compress
.endif

.include <bsd.port.post.mk>

