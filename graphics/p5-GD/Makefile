# $MidnightBSD$

PORTNAME=	GD
PORTVERSION=	2.53
CATEGORIES=	graphics perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl5 interface to Gd Graphics Library version2

LICENSE=	artistic gpl gpl2 gpl3
LICENSE_COMB=	dual

LIB_DEPENDS=	libgd.so:${PORTSDIR}/graphics/gd

CONFIGURE_ENV=	options="FT,GIF,JPEG,PNG,XPM" \
		lib_ft_path=${LOCALBASE} \
		lib_gd_path=${LOCALBASE} \
		lib_jpeg_path=${LOCALBASE} \
		lib_png_path=${LOCALBASE} \
		lib_zlib_path=/usr
USES=		perl5
PERL_CONFIGURE=	yes

.include <bsd.port.mk>
