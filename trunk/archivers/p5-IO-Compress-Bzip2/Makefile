# $MidnightBSD: mports/archivers/p5-IO-Compress-Bzip2/Makefile,v 1.1 2009/03/27 06:15:22 laffer1 Exp $

PORTNAME=	IO-Compress-Bzip2
PORTVERSION=	2.015
CATEGORIES=	archivers perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An interface to allow writing bzip2 compressed data to files or buffer
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/Compress/Raw/Bzip2.pm:${PORTSDIR}/archivers/p5-Compress-Raw-Bzip2 \
		${SITE_PERL}/${PERL_ARCH}/IO/Compress/Base.pm:${PORTSDIR}/archivers/p5-IO-Compress-Base
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	YES

MAN3=		IO::Compress::Bzip2.3 IO::Uncompress::Bunzip2.3

post-patch:
	@${REINPLACE_CMD} -e 's/5.009/5.666/' ${WRKSRC}/Makefile.PL

.include <bsd.port.mk>
