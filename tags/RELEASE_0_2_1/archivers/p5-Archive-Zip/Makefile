# New ports collection makefile for:	Archive-Zip
# Date created:				Mon Jan  1 09:33:13 2001
# Whom:					will
#
# $MidnightBSD: mports/archivers/p5-Archive-Zip/Makefile,v 1.2 2008/01/04 15:52:12 laffer1 Exp $
# $FreeBSD: ports/archivers/p5-Archive-Zip/Makefile,v 1.28 2006/12/03 12:45:56 demon Exp $
#

PORTNAME=	Archive-Zip
PORTVERSION=	1.23
CATEGORIES=	archivers perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	Archive
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl module to create, manipulate, read, and write Zip archive files
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/Compress/Zlib.pm:${PORTSDIR}/archivers/p5-Compress-Zlib \
		${SITE_PERL}/${PERL_ARCH}/File/Spec.pm:${PORTSDIR}/devel/p5-PathTools \
		${SITE_PERL}/File/Temp.pm:${PORTSDIR}/devel/p5-File-Temp \
		p5-File-Which>=0:${PORTSDIR}/sysutils/p5-File-Which
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		Archive::Zip.3 Archive::Zip::Tree.3 Archive::Zip::FAQ.3 Archive::Zip::MemberRead.3

.include <bsd.port.mk>
