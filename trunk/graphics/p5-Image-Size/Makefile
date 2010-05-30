# New ports collection makefile for:	p5-Image-Size
# Date created:				October 20th 1996
# Whom:	      				James FitzGibbon <jfitz@FreeBSD.org>
#
# $MidnightBSD: mports/graphics/p5-Image-Size/Makefile,v 1.2 2008/10/10 18:27:41 ctriv Exp $
# $FreeBSD: ports/graphics/p5-Image-Size/Makefile,v 1.37 2006/12/03 12:45:57 demon Exp $
#

PORTNAME=	Image-Size
PORTVERSION=	3.220
CATEGORIES=	graphics www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl5 module to determine the size of images in several common formats
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/Compress/Zlib.pm:${PORTSDIR}/archivers/p5-Compress-Zlib
RUN_DEPENDS:=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN1=		imgsize.1
MAN3=		Image::Size.3

.include <bsd.port.mk>
