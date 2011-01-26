# New ports collection makefile for:	Archive-Zip
# Date created:				Mon Jan  1 09:33:13 2001
# Whom:					will
#
# $MidnightBSD: mports/archivers/p5-Archive-Zip/Makefile,v 1.4 2008/10/10 18:16:45 ctriv Exp $
# $FreeBSD: ports/archivers/p5-Archive-Zip/Makefile,v 1.28 2006/12/03 12:45:56 demon Exp $
#

PORTNAME=	Archive-Zip
PORTVERSION=	1.30
CATEGORIES=	archivers perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl module to create, manipulate, read, and write Zip archive files
LICENSE=	perl

BUILD_DEPENDS=	p5-Compress-Zlib>=1.14:${PORTSDIR}/archivers/p5-Compress-Zlib
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		Archive::Zip.3 Archive::Zip::Tree.3 Archive::Zip::FAQ.3 Archive::Zip::MemberRead.3

.include <bsd.port.mk>
