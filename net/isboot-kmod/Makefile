PORTNAME=	isboot-kmod
DISTVERSION=	0.2.14
PORTREVISION=	1
CATEGORIES=	net

MAINTAINER=	john@jnielsen.net
COMMENT=	Kernel module enabling iSCSI/IBFT boot

LICENSE=	bsd2

FAKE_OPTS=	trueprefix

USES=		kmod uidfix

USE_GITHUB=	yes
GH_ACCOUNT=	jnielsendotnet
GH_PROJECT=	isboot

SUB_FILES=	pkg-message
WRKSRC_SUBDIR=	src
PLIST_FILES=	${KMODDIR}/isboot.ko
PORTDOCS=	README

OPTIONS_DEFINE=	DEBUG DOCS VIMAGE
OPTIONS_DEFAULT=DOCS VIMAGE
DEBUG_DESC=	Enable verbose boot logging
DEBUG_CFLAGS=	-DDEBUG -DMODDEBUG -DIBFT_VERBOSE
VIMAGE_DESC=	Build for a kernel with 'options VIMAGE'
VIMAGE_CFLAGS=	-DVIMAGE

post-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKSRC}/.. && ${INSTALL_DATA} ${PORTDOCS} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
