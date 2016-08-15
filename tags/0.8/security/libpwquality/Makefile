# $MidnightBSD$
# $FreeBSD: head/security/libpwquality/Makefile 381119 2015-03-12 17:12:19Z sunpoet $

PORTNAME=	libpwquality
PORTVERSION=	1.2.4
CATEGORIES=	security
MASTER_SITES=	https://fedorahosted.org/releases/l/i/libpwquality/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for generating random passwords and quality checking

LICENSE=	gpl2 bsd3
LICENSE_COMB=	dual

LIB_DEPENDS=	libcrack.so:${PORTSDIR}/security/cracklib

USES=		gettext gmake libtool pathfix tar:bzip2
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
PYTHON_BUILD_DEPENDS=	python:${PORTSDIR}/lang/python
PYTHON_CONFIGURE_ENABLE=	python-bindings

post-patch:
	@${REINPLACE_CMD} -e 's|python setup.py build|${PYTHON_VERSION} setup.py build|g' \
		${WRKSRC}/python/Makefile.in

.include <bsd.port.mk>
