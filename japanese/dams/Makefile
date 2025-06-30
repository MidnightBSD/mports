PORTNAME=	dams
PORTVERSION=	4.3.4
CATEGORIES=	japanese
MASTER_SITES=	http://newspat.csis.u-tokyo.ac.jp/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Geocoder that converts address strings into latitude and longitude
WWW=		http://newspat.csis.u-tokyo.ac.jp/geocode/

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		gmake libtool tar:tgz
USE_CXXSTD=	c++14
USE_LDCONFIG=	yes

GNU_CONFIGURE=	yes

MAKE_JOBS_UNSAFE=	yes
ALL_TARGET=	all dic
INSTALL_TARGET=	install install-dic install-strip

post-install:
	${INSTALL_PROGRAM} ${WRKSRC}/src/.libs/dams ${STAGEDIR}${PREFIX}/bin

.include <bsd.port.mk>
