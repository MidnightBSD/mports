PORTNAME=	s2tc
PORTVERSION=	1.0+20151228
PORTREVISION=	1
CATEGORIES=	graphics

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Subset of a well-known texture compression scheme

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	libglvnd>=0:graphics/libglvnd

USES=		autoreconf libtool pathfix
USE_GITHUB=	yes
USE_LDCONFIG=	yes

GH_ACCOUNT=	divVerent
GH_TAGNAME=	f6ec862
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip

NO_TEST=	yes

CPPFLAGS+=	-I${LOCALBASE}/include

.include <bsd.port.mk>
