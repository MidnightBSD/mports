PORTNAME=	utouch-kmod
PORTVERSION=	0.0.5
CATEGORIES=	misc

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Kernel driver for absolute USB HID mice
WWW=		https://github.com/wulf7/utouch

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		kmod uidfix

USE_GITHUB=	yes
GH_ACCOUNT=	wulf7
GH_PROJECT=	utouch

PLIST_FILES=	${KMODDIR}/utouch.ko

OPTIONS_DEFINE=	SOURCE
OPTIONS_DEFAULT=SOURCE
SOURCE_DESC=	Install kernel module sources

KMODSRC_DIR=	sys/modules/${PORTNAME}
KMODSRC_FILES=	Makefile utouch.c

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MSOURCE}
PLIST_FILES+=	${KMODSRC_FILES:S|^|${KMODSRC_DIR}/|}
.endif

post-install-SOURCE-on:
	${MKDIR} ${FAKE_DESTDIR}${PREFIX}/${KMODSRC_DIR}
.for file in ${KMODSRC_FILES}
	${INSTALL_DATA} ${WRKSRC}/${file} ${FAKE_DESTDIR}${PREFIX}/${KMODSRC_DIR}
.endfor

.include <bsd.port.mk>
