# New ports collection makefile for:	p5-IO-Compress-Base
# Date created:		2006-11-07
# Whom:			Thomas Abthorpe <thomas@goodking.ca>
#
# $MidnightBSD: mports/archivers/p5-IO-Compress-Base/Makefile,v 1.6 2008/10/03 19:04:05 laffer1 Exp $
# $FreeBSD: ports/archivers/p5-IO-Compress-Base/Makefile,v 1.3 2007/01/03 17:58:55 erwin Exp $
#

PORTNAME=	IO-Compress-Base
PORTVERSION=	2.015
CATEGORIES=	archivers perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	IO
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Base Class for IO::Uncompress modules
LICENSE=	perl

PERL_CONFIGURE=	YES

MAN3=		IO::Uncompress::AnyUncompress.3 IO::Uncompress::Base.3 \
		File::GlobMapper.3 IO::Compress::Base.3

.include <bsd.port.pre.mk>

.if ${PERL_BRANCH} == "5.10"
PLIST_SUB+=	PERL510="" PERL58="@comment "
.else
PLIST_SUB+=	PERL510="@comment " PERL58=""
.endif

.include <bsd.port.post.mk>
