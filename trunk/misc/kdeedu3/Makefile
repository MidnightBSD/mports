# $MidnightBSD: mports/misc/kdeedu3/Makefile,v 1.6 2011/02/02 21:10:19 laffer1 Exp $

PORTNAME=	kdeedu
PORTVERSION=	${KDE_VERSION}
PORTREVISION=	1
CATEGORIES?=	misc kde
MASTER_SITES=		${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	stable/${PORTVERSION:S/.0//}/src
DIST_SUBDIR=	KDE

MAINTAINER?=	ports@MidnightBSD.org
COMMENT=	Collection of entertaining, educational programs for KDE
LICENSE=	agg

LIB_DEPENDS=	usb-0.1:${PORTSDIR}/devel/libusb

CONFLICTS+=	kwordquiz-[0-9]* kgeography-[0-9]*

USE_KDELIBS_VER=3
PREFIX=		${KDE_PREFIX}

USE_BZIP2=	yes
USE_XORG=	xpm
USE_GMAKE=	yes
USE_AUTOTOOLS=  libtool

CONFIGURE_ARGS+=--enable-libusb=${LOCALBASE} \
		--disable-ocamlsolver

USE_LDCONFIG=	yes
LDCONFIG_DIRS+=	%%PREFIX%%/lib %%PREFIX%%/lib/kde3

.include "${.CURDIR}/../../x11/kde3/Makefile.kde"
.include <bsd.port.pre.mk>

.if ${OSVERSION} < 4015
LIB_DEPENDS+=    usb-0.1:${PORTSDIR}/devel/libusb
.endif
LIB_DEPENDS+=	boost_python:${PORTSDIR}/devel/boost-python-libs
PLIST_SUB+=	BOOST_PYTHON=""

pre-configure:
	${REINPLACE_CMD} \
	-e 's|pylibdir in.*|pylibdir in "${LOCALBASE}/lib" \\|g' \
	${WRKSRC}/configure

.include <bsd.port.post.mk>
