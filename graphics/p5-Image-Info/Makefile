# New ports collection makefile for:	p5-Image-Info
# Date Created:				25 Aug 2001
# Whom:					Shell Hung <shell@shellhung.org>
#
# $MidnightBSD: mports/graphics/p5-Image-Info/Makefile,v 1.2 2008/10/10 18:23:22 ctriv Exp $
# $FreeBSD: ports/graphics/p5-Image-Info/Makefile,v 1.13 2006/12/03 12:45:57 demon Exp $
#

PORTNAME=	Image-Info
PORTVERSION=	1.31
CATEGORIES=	graphics perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl module for getting image information
LICENSE=	perl

RUN_DEPENDS=	${SITE_PERL}/IO/String.pm:${PORTSDIR}/devel/p5-IO-String \
		${SITE_PERL}/XML/Simple.pm:${PORTSDIR}/textproc/p5-XML-Simple \
		p5-XML-LibXML>0:${PORTSDIR}/textproc/p5-XML-LibXML
BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		Image::Info.3 Image::Info::BMP.3 Image::Info::SVG.3 \
		Image::Info::TIFF.3 Image::Info::PPM.3 \
		Image::Info::XBM.3 Image::Info::XPM.3 \
		Image::Info::ICO.3 Bundle::Image::Info::Everything.3 \
		Bundle::Image::Info::PNG.3 Bundle::Image::Info::SVG.3 \
		Bundle::Image::Info::XPM.3 Bundle::Image::Info::XBM.3

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 500903
RUN_DEPENDS+=	p5-IO-Compress>=2.017:${PORTSDIR}/archivers/p5-IO-Compress
BUILD_DEPENDS+=	p5-IO-Compress>=2.017:${PORTSDIR}/archivers/p5-IO-Compress
.endif

.include <bsd.port.post.mk>
