PORTNAME=	aquantia-atlantic-kmod
PORTVERSION=	0.0.5
PORTREVISION=	2
CATEGORIES=	net

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Aquantia AQtion (Atlantic) Network Driver (Development Preview)
WWW=		https://github.com/Aquantia/aqtion-freebsd

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

FAKE_OPTS=	trueprefix

USES=		kmod uidfix
USE_GITHUB=	yes

GH_ACCOUNT=	Aquantia
GH_PROJECT=	aqtion-freebsd
GH_TAGNAME=	c61d27b

# Strip -Werror from sys/conf/kmod.mk
MAKE_ENV=	WERROR=""

PLIST_FILES=	${KMODDIR}/if_atlantic.ko

pre-install:
	${MKDIR} ${FAKE_DESTDIR}/boot/modules

.include <bsd.port.mk>
