# $MidnightBSD: mports/graphics/p5-Image-Size/Makefile,v 1.3 2010/05/30 22:47:56 laffer1 Exp $
# $FreeBSD: ports/graphics/p5-Image-Size/Makefile,v 1.37 2006/12/03 12:45:57 demon Exp $

PORTNAME=	Image-Size
PORTVERSION=	3.221
PORTREVISION=	1
CATEGORIES=	graphics www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl5 module to determine the size of images in several common formats
LICENSE=	perl

PERL_CONFIGURE=	yes

MAN1=		imgsize.1
MAN3=		Image::Size.3

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 500903
RUN_DEPENDS+=	p5-IO-Compress>=2.017:${PORTSDIR}/archivers/p5-IO-Compress
BUILD_DEPENDS+=	p5-IO-Compress>=2.017:${PORTSDIR}/archivers/p5-IO-Compress
.endif

.include <bsd.port.post.mk>
