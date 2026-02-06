PORTNAME=	sysinfo
PORTVERSION=	0.10.0
PORTREVISION=	1
CATEGORIES=	devel rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	All your system-independent infoz in one handy class
WWW=		https://github.com/delano/sysinfo

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

RUN_DEPENDS=	rubygem-drydock>=0:devel/rubygem-drydock \
		rubygem-storable>=0.10<1:devel/rubygem-storable
BUILD_DEPENDS=	${RUN_DEPENDS}

USES=		gem shebangfix

NO_ARCH=	yes

PLIST_FILES=	bin/sysinfo

SHEBANG_FILES=	bin/sysinfo

.include <bsd.port.mk>
