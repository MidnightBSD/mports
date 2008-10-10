# New ports collection makefile for:	p5-IO-Compress-Zlib
# Date created:				3 December 2006
# Whom:	      				Dmitry Sivachenko <demon@FreeBSD.org>
#
# $MidnightBSD: mports/archivers/p5-IO-Compress-Zlib/Makefile,v 1.6 2008/10/03 19:05:42 laffer1 Exp $
# $FreeBSD: ports/archivers/p5-IO-Compress-Zlib/Makefile,v 1.4 2007/02/01 11:28:45 demon Exp $
#

PORTNAME=	IO-Compress-Zlib
PORTVERSION=	2.015
CATEGORIES=	archivers perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl5 interface for reading and writing of (g)zip files
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/Compress/Raw/Zlib.pm:${PORTSDIR}/archivers/p5-Compress-Raw-Zlib \
		${SITE_PERL}/IO/Compress/Base.pm:${PORTSDIR}/archivers/p5-IO-Compress-Base
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	YES

MAN3=		IO::Uncompress::RawInflate.3 IO::Uncompress::Unzip.3 \
		IO::Uncompress::Inflate.3 IO::Compress::Deflate.3 \
		IO::Compress::Zip.3 IO::Uncompress::Gunzip.3 \
		IO::Compress::RawDeflate.3 IO::Uncompress::AnyInflate.3 \
		IO::Compress::Gzip.3

.include <bsd.port.pre.mk>

.if ${PERL_BRANCH} == "5.10"
PLIST_SUB+=	PERL510="" PERL58="@comment "
.else
PLIST_SUB+=	PERL510="@comment " PERL58=""
.endif

.include <bsd.port.post.mk>
