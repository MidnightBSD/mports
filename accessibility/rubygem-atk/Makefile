PORTNAME=	atk
PORTVERSION=	4.3.4
CATEGORIES=	accessibility rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ruby binding of ATK
WWW=		https://ruby-gnome.github.io/ \
		https://github.com/ruby-gnome/ruby-gnome

LICENSE=	lgpl2.1+
LICENSE_FILE=	${WRKSRC}/COPYING.LIB

BUILD_DEPENDS=	rubygem-native-package-installer>=1.0.3:devel/rubygem-native-package-installer \
		rubygem-rake>=0:devel/rubygem-rake \
		rubygem-pkg-config>=0:devel/rubygem-pkg-config \
		${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-glib2>=${PORTVERSION}<${PORTVERSION:R}.99:devel/rubygem-glib2

USES=		gem gnome
USE_GNOME=	atk

NO_ARCH=	yes

.include <bsd.port.mk>
