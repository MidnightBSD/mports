# $MidnightBSD: mports/security/p11-kit/Makefile,v 1.2 2012/02/29 01:23:33 laffer1 Exp $

PORTNAME=	p11-kit
PORTVERSION=	0.14
CATEGORIES=	security devel
MASTER_SITES=	http://p11-glue.freedesktop.org/releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for loading and enumurating of PKCS\#11 modules
LICENSE=	bsd3

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-gtk-doc --disable-nls --enable-debug=no
MAKE_ENV=	exampledir=${EXAMPLESDIR}

USE_AUTOTOOLS=	libtool
USE_GNOME=	ltverhack gnomehack
USE_LDCONFIG=	yes

pre-configure:
	@${REINPLACE_CMD} -e \
	's|exampledir = $$(p11_system_config)|exampledir = ${EXAMPLESDIR}|' \
	${WRKSRC}/${PORTNAME}/Makefile.in

.include <bsd.port.mk>
