# $MidnightBSD$

PORTNAME=	Geo-IP
PORTVERSION=	1.50
CATEGORIES=	net geography perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gets country name by IP or hostname

LICENSE=	artistic gpl
LICENSE_COMB=	dual

LIB_DEPENDS=	libGeoIP.so:${PORTSDIR}/net/GeoIP

CONFIGURE_ARGS=	INC="-I${LOCALBASE}/include" LIBS="-L${LOCALBASE}/lib"
USES=		perl5
USE_PERL5=	yes
PERL_CONFIGURE=	yes

.include <bsd.port.mk>
