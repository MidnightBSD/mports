# $MidnightBSD$
# $FreeBSD: head/security/libpwquality/Makefile 381119 2015-03-12 17:12:19Z sunpoet $

PORTNAME=	libpwquality
PORTVERSION=	1.4.0
CATEGORIES=	security
MASTER_SITES=	https://github.com/${PORTNAME}/${PORTNAME}/releases/download/${PORTNAME}-${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for generating random passwords and quality checking

LICENSE=	gpl2 bsd3
LICENSE_COMB=	dual

LIB_DEPENDS=	libcrack.so:security/cracklib

USES=		gettext gmake localbase libtool pathfix tar:bzip2
USE_GNOME=	intltool
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS+=--disable-pam
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip

OPTIONS_DEFINE=	PYTHON
OPTIONS_DEFAULT=PYTHON
OPTIONS_SUB=	yes
PYTHON_USES=	python
PYTHON_CONFIGURE_ENABLE=	python-bindings
PYTHON_CONFIGURE_ON=	--with-python-binary=${PYTHON_CMD}

.include <bsd.port.mk>
