# $MidnightBSD: mports/archivers/p5-IO-Compress-Base/Makefile,v 1.9 2009/06/27 15:57:55 laffer1 Exp $

PORTNAME=	IO-Compress-Base
PORTVERSION=	2.015
CATEGORIES=	archivers perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Base Class for IO::Uncompress modules
LICENSE=	perl

PERL_CONFIGURE=	YES

MAN3=		IO::Uncompress::AnyUncompress.3 IO::Uncompress::Base.3 \
		File::GlobMapper.3 IO::Compress::Base.3

post-patch:
	@${REINPLACE_CMD} -e 's/5.009/5.666/' ${WRKSRC}/Makefile.PL

.include <bsd.port.mk>
